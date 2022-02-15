#!/bin/sh
set -e
set -x

KubeconfigFile=$1
ObjectsFile=$2

unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
kubectl --kubeconfig $KubeconfigFile create -f $ObjectsFile
