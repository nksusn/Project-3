#!/bin/bash

# Apply the updated configuration
kubectl apply -f k8s/simplified-deployment.yaml

# Restart the pods to apply the changes
kubectl rollout restart deployment/frontend
kubectl rollout restart deployment/backend

# Wait for the rollout to complete
kubectl rollout status deployment/frontend
kubectl rollout status deployment/backend

echo "Update complete. Try accessing the frontend again."