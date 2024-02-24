#!/bin/bash
#
# deploy cluster and applications
#
K3D_CONFIG="${K3D_CONFIG:-k3d/kube-multiple-agent-ingress-nginx/k3d.yml}"

echo "# Create intial cluster"
k3d cluster create --config ${K3D_CONFIG} 

echo "# List cluster and pods"
k3d cluster list
k3d node list

kubectl get node -A
kubectl get pod -A

echo "# Deploy application in cluster"
helmfile apply --wait

echo "# Test whoami url"
curl http://localhost:8080

#echo "# Delete cluster and all ressources"
#k3d cluster delete --config ${K3D_CONFIG} 
