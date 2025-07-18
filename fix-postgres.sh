#!/bin/bash

# Clean up existing resources
kubectl delete pvc postgresql-pvc
helm uninstall postgresql

# Apply the local PV
kubectl apply -f k8s/local-pv.yaml

# Reinstall PostgreSQL
helm install postgresql ./helm/postgresql

# Check status
kubectl get pv,pvc
kubectl get pods