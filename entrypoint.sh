#!/bin/sh
set -e
set -x

KubeconfigFile=$1
ObjectsFile=$2

kubectl --kubeconfig $KubeconfigFile create -f $ObjectsFile
