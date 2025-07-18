#!/bin/bash

# Clean up existing resources
echo "Cleaning up existing resources..."
kubectl delete deployment postgresql backend frontend
kubectl delete service postgresql backend frontend
kubectl delete pvc --all
kubectl delete pv --all
kubectl delete configmap nginx-config

# Apply the simplified deployment
echo "Applying simplified deployment..."
kubectl apply -f k8s/simplified-deployment.yaml

# Wait for services to be ready
echo "Waiting for services to be ready..."
sleep 5

# Get the external IP for the frontend service
echo "Getting frontend service URL..."
kubectl get service frontend

echo "Deployment complete. It may take a few minutes for the LoadBalancer to be ready."
echo "You can check the status with: kubectl get pods"
echo "Once the LoadBalancer is ready, access the application at the EXTERNAL-IP shown above."