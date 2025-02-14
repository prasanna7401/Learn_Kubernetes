# Learn Kubernetes

Lab: To setup your own lab environment, you can either use `minikube`, local nodes, or managed k8s services. This repository contains a terraform code to set up Azure K8s Service cluster [here](./100%20-%20AKS%20Cluster%20-%20Terraform/).


## Useful tips

1. Configure tab completion for `kubectl`

    1. Edit the bashrc profile: `vim ~/.bashrc`
    2. Add a new line: `source <(kubectl completion bash)`.

    > Note: If you are using an alias _k_ for kubectl, you need to the add a new line with `complete -o default -F __start_kubectl k`.

## Command Cheatsheet

![cheatsheat](./.github/screenshots/command%20cheatsheet.jpg)