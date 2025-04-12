!#/bin/bash

kubectl apply -f k8s/db-deployment.yaml
kubectl apply -f k8s/db-service.yaml

kubectl apply -f k8s/app-deployment.yaml
kubectl apply -f k8s/app-service.yaml

kubectl apply -f k8s/nginx-config.yaml
kubectl apply -f k8s/web-deployment.yaml
kubectl apply -f k8s/web-service.yaml


