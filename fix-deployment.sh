#!/bin/bash

echo "Cleaning up previous deployments..."
kubectl delete pvc --all
kubectl delete pv --all
helm uninstall postgresql backend frontend

echo "Creating local storage for PostgreSQL..."
kubectl apply -f k8s/local-storage.yaml

echo "Creating secrets..."
kubectl apply -f k8s/app-secrets.yaml
kubectl apply -f k8s/db-secrets.yaml

echo "Building simplified Docker images..."
# Backend
cd backend
docker build -t nksusn/eks-app-backend:simple -f Dockerfile.simple .
docker push nksusn/eks-app-backend:simple

# Frontend
cd ../frontend
docker build -t nksusn/eks-app-frontend:simple -f Dockerfile.simple .
docker push nksusn/eks-app-frontend:simple

cd ..

echo "Updating Helm values for new images..."
# Update backend image
sed -i 's/tag: "v1.0.1"/tag: "simple"/' helm/backend/values.yaml

# Update frontend image
sed -i 's/tag: "v1.0.1"/tag: "simple"/' helm/frontend/values.yaml

echo "Installing Helm charts..."
helm install postgresql ./helm/postgresql
helm install backend ./helm/backend
helm install frontend ./helm/frontend

echo "Deployment complete. Checking pod status..."
kubectl get pods