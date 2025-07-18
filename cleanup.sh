#!/bin/bash

# Delete any existing deployments with these names
kubectl delete deployment postgresql backend frontend --ignore-not-found

# Delete any existing services with these names
kubectl delete service postgresql backend frontend --ignore-not-found

# Delete any existing secrets related to the Helm releases
kubectl delete secret sh.helm.release.v1.postgresql.v1 --ignore-not-found
kubectl delete secret sh.helm.release.v1.backend.v1 --ignore-not-found
kubectl delete secret sh.helm.release.v1.frontend.v1 --ignore-not-found

# Delete any existing configmaps
kubectl delete configmap nginx-config --ignore-not-found

# Check if there are any remaining Helm releases
echo "Checking remaining Helm releases:"
helm list -a

echo "Cleanup complete. You can now reinstall the Helm charts."