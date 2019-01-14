# Helm, Kubectl and helmsman for EKS

This repository contains all tools to access your [EKS](https://aws.amazon.com/eks) cluster in AWS and ships [Helmsman](https://github.com/Praqma/Helmsman/releases), [Helm](https://helm.sh), [kubectl](https://github.com/kubernetes/kubectl) and [aws-iam-authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator) in one small docker image.

## Run

    docker run -it \
               -e AWS_EKS_CLUSTER_NAME=sample-123456 \
               -e AWS_ACCESS_KEY_ID=<key> \
               -e AWS_SECRET_ACCESS_KEY=<secret> \
               widerin/eks-helmsman

Set your cluster by running following command in the container:

    aws eks update-kubeconfig --name=$AWS_EKS_CLUSTER_NAME

## Environment variables

- `AWS_EKS_CLUSTER_NAME`: Your [EKS](https://aws.amazon.com/eks) cluster name in AWS console
- `AWS_ACCESS_KEY` and `AWS_SECRET_ACCESS_KEY`: AWS credentials to access the cluster

## Helpers available in the image

- `helmsman`
- `helm`: You might want to use this image to just use it with `helm` and ignore the `helmsman` binary.
- `kubectl`
- `awscli`
- `aws-iam-authenticator`
- `envsubst`: substitute environment variables with `envsubst '$VAR1 $VAR2' < file1.yaml > file2.yaml`.
