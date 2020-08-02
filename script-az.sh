#!/bin/bash
kubectl get nodes -o wide | grep worker | awk '{print $1}'|head -n 1 > node1
kubectl get nodes -o wide | grep worker | awk '{print $1}'|tail -n 1 > node2
n1=$(cat node1)
n2=$(cat node2)
ssh AzureUser@$n1 "sudo systemctl stop docker && sudo systemctl stop kubelet" 
ssh AzureUser@$n2 "sudo systemctl stop docker && sudo systemctl stop kubelet" 

