#!/bin/bash

# Delete the existing backend deployment
kubectl delete deployment backend

# Apply the simple backend
kubectl apply -f k8s/simple-backend.yaml

# Apply the simple frontend config
kubectl apply -f k8s/simple-frontend.yaml

# Wait for the backend to be ready
echo "Waiting for backend to be ready..."
kubectl rollout status deployment/backend

# Restart the frontend to pick up the new config
kubectl rollout restart deployment/frontend
kubectl rollout status deployment/frontend

# Test the backend directly
echo "Testing backend directly..."
kubectl exec $(kubectl get pod -l app=backend -o jsonpath="{.items[0].metadata.name}") -- wget -qO- localhost:3000/api/status

echo "Deployment complete. Access the frontend service to see if it works now."
kubectl get service frontend