#!/bin/bash

# Apply the fixed backend
kubectl apply -f k8s/backend-fix.yaml

# Apply the fixed frontend
kubectl apply -f k8s/frontend-fix.yaml

# Wait for the rollout to complete
echo "Waiting for backend rollout..."
kubectl rollout status deployment/backend

echo "Waiting for frontend rollout..."
kubectl rollout status deployment/frontend

# Test the connection
echo "Testing backend health endpoint..."
kubectl exec $(kubectl get pod -l app=frontend -o jsonpath="{.items[0].metadata.name}") -- curl -s backend:3000/health
echo ""

echo "Testing backend API endpoint..."
kubectl exec $(kubectl get pod -l app=frontend -o jsonpath="{.items[0].metadata.name}") -- curl -s backend:3000/api/status
echo ""

echo "Testing backend direct status endpoint..."
kubectl exec $(kubectl get pod -l app=frontend -o jsonpath="{.items[0].metadata.name}") -- curl -s backend:3000/status
echo ""

echo "Getting frontend service URL..."
kubectl get service frontend

echo "Deployment complete. Access the application at the EXTERNAL-IP shown above."