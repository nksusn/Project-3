#!/bin/bash

# Run the cleanup script first
./cleanup.sh

# Install PostgreSQL with a different release name
helm install pg-db ./helm/postgresql --namespace default

# Install backend
helm install api ./helm/backend --namespace default

# Install frontend
helm install web ./helm/frontend --namespace default

# Check the status
echo "Checking pod status:"
kubectl get pods

echo "Checking services:"
kubectl get svc