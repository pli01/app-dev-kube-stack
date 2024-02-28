# cheat sheet

# Quick install

Requirements: https://k3d.io/v5.6.0/#requirements
- docker > v20.10.5

```
# latest version
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
# specific version
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG=v5.6.0 bash
# k3d version
```

create and destroy simple cluster
```
k3d cluster create devcluster

k3d cluster list
k3d node list

kubectl get node -A
kubectl get pod -A

k3d cluster delete devcluster
```

## sample clusters configuration
Examples:

- simple cluster with 1 ctrlplane node
```
k3d cluster create devcluster
```

- cluster with 1 ctrlplane node and 1 agent node, expose ports 80 and 443 on 8080 and 8443 on local vm
```
k3d cluster create devcluster --agents 1 -p "8080:80@loadbalancer"  -p "8443:443@loadbalancer"
```

- cluster with:
  - 1 ctrlplane node and 2 different agent node (label ingress=true and web=true)
  - expose ports 80 and 443 on 8080 and 8443 on local vm
  - disable ingress traefik and lb service
```
k3d cluster create devcluster --agents 2 \
   -p "8080:80@loadbalancer"  -p "8443:443@loadbalancer" \
   --k3s-node-label 'ingress=true@agent:0' --k3s-node-label 'web=true@agent:1' \
   --k3s-arg "--disable=traefik@server:0" --k3s-arg "--disable=servicelb@server:0"

```
all k3d args can be set in one yaml file: see https://k3d.io/v5.6.0/usage/configfile/#config-options
```
k3d cluster create devcluster --config ./myconfig.yml
```


## Helmfiles

```
helmfile init
helmfile sync
helmfile apply
helmfile destroy
```

- to install crds at first time, use `helmfile sync`
