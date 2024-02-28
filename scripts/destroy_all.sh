#!/bin/bash
#
# deploy cluster and applications
#
K3D_CONFIG="${K3D_CONFIG:-clusters/k3d/kube-multiple-agent-no-default-ingress/k3d.yml}"
echo "# List cluster and pods"
k3d cluster list
k3d node list


echo "# Delete cluster and all ressources"
k3d cluster delete --config ${K3D_CONFIG} 
