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

## Configure the cluster

####  Retrieve the cluster kubeconfig

    cd terraform/packtclusters

    aws eks --region us-east-1 update-kubeconfig --name packtclusters-prod1

####  Create Python virtual environment

    virtualenv ~/ansible
    source ~/ansible/bin/activate

####  Install ansible and k8s modules

    pip install 'ansible<3.0' openshift pyyaml requests 'kubernetes<12.0'

####  Execute ansible-playbook to configure the cluster

    ansible-playbook -i \
                ../../ansible/inventories/packtclusters/ \
                -e "worker_iam_role_arn=$(terraform output worker_iam_role_arn) \
                    cluster_name=$(terraform output cluster_full_name) \
                    aws_default_region=$(terraform output aws_region)" \
                ../../ansible/cluster.yaml
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
