#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "post-create start"
echo "$(date)    post-create start" >> "$HOME/status"

# Start the k3s cluster
k3d cluster create workshop --k3s-server-arg "--no-deploy=traefik" --servers 1 --agents 1 --wait
#--port 8084:80@loadbalancer 

# Load the sample 
kubectl create namespace easytrade
git clone https://github.com/Dynatrace/easytrade.git
#kubectl -n easytrade apply -f ./easytrade/kubernetes-manifests
##while [[ `kubectl get pods -n easytrade | grep frontend | grep "0/"` ]]; do kubectl get pods -n easytrade; echo "==> waiting for frontend pod ready"; sleep 3; done

echo "post-create complete"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-create complete" >> "$HOME/status"
