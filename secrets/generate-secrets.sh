#!/bin/bash

echo "Generating secure secrets..."
echo "JWT_SECRET=$(openssl rand -hex 32)"
echo "API_KEY=$(openssl rand -hex 20)"
echo "POSTGRES_PASSWORD=$(openssl rand -hex 16)"
