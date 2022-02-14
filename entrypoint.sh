#!/bin/sh
set -e
set -x

kubeconfig=$1
command=$2

kubectl --kubeconfig $kubeconfig $command
