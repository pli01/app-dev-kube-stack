# stack for developing applications on Kube

Provides an application development stack on Kubernetes
Can be used to develop and run your app on kubernetes

Requirements:
- must run for local development or CI
- simple to use
- start and destroy quickly
- developers working on machines with limited resources or need to conserve system resources for other tasks.
- low memory requirements and low resources consumption
- dev/prod parity
- support common kubernetes features
- makes it easy to create single or multi-node cluster
- backed on already known docker

Work on:
- Linux
- Mac (and M1 too)

The stack is based on:
- docker
- k3d, a lightweight wrapper to run k3s
- helmfile
- helm-diff

Then you can develop and deploy your app on your local kubernetes cluster

## Quick install

Requirements:
- curl
- docker > v20.10.5 (see  https://k3d.io/v5.6.0/#requirements)

To install all components, use the `install_prereq.sh` script

## Usage

In following directory:
- k3d: config to create/use/destroy local kubernetes cluster
- helmfiles: to install helmfile on kube cluster
