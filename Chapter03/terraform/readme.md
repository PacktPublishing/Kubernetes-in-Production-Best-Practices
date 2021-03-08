# Chapter Instructions

## Prerequisites
### Install tools
 1. [tfenv](https://github.com/tfutils/tfenv)
 2. [Python](https://www.python.org/downloads/)
 3. [Pip](https://pip.pypa.io/en/stable/)
 4. [Virtualenv](https://pypi.org/project/virtualenv/)

### Install terraform
    tfenv install 0.14.5

## Provision the infrastructure

### Create terraform shared state
    cd shared-state 
    terraform init 
    terraform apply

### Create cluster VPC and network
    cd packtclusters-vpc
    terraform workspace new prod1-vpc
    terraform init 
    terraform apply

### Create cluster resources
    cd packtclusters
    terraform workspace new prod1                
    terraform init 
    terraform apply

#### Verify the cluster

    kubectl get nodes
    kubectl get namespaces
    kubectl get pods --all-namespaces

## Destroy the infrastructure

### Destroy cluster resources
    cd packtclusters
    terraform workspace select prod1                
    terraform init 
    terraform destroy
    
### Create cluster VPC and network
    cd packtclusters-vpc
    terraform workspace select prod1-vpc
    terraform init 
    terraform destroy
    
### Create terraform shared state
    cd shared-state 
    terraform init 
    terraform destroy
