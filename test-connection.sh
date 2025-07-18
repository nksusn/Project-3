#!/bin/bash

# Get a frontend pod name
FRONTEND_POD=$(kubectl get pod -l app=frontend -o jsonpath="{.items[0].metadata.name}")

echo "Testing connection from frontend pod to backend service..."
kubectl exec $FRONTEND_POD -- curl -s backend:3000/health
echo ""

echo "Testing backend API endpoint..."
kubectl exec $FRONTEND_POD -- curl -s backend:3000/api/status
echo ""

echo "If you see 'OK' and a JSON response above, the connection is working."