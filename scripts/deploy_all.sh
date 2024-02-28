#!/bin/bash
#
# deploy cluster and applications
#
set -eu -o pipefail
K3D_CONFIG="${K3D_CONFIG:-clusters/k3d/kube-multiple-agent-no-default-ingress/k3d.yml}"
#
# registry data on volume
export REGISTRY_DIR="${REGISTRY_DIR:-registry-data}"
# if need persistent registry data locally , set to
# REGISTRY_DIR=$(pwd)/registry

echo "# Create intial cluster"
k3d cluster create --config ${K3D_CONFIG}

echo "# List cluster and pods"
k3d cluster list
k3d node list

kubectl get node -A
kubectl get pod -A

echo "# Deploy application in cluster"
export HELM_DIFF_THREE_WAY_MERGE=true
helmfile sync --wait
helmfile apply --wait

#echo "# Test whoami url"
#curl http://localhost:8080
