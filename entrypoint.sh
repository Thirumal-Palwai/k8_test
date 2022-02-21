#!/bin/sh
set -e
set -x

KubeconfigFile=$1
ObjectsFile=$2

Namespace=$3

ServiceAccount=$4
SA_Namespace=$5

export NetworkPolicy=$6
export NP_Namespace=$7
export MatchLabel=$8
export IngressIP=$9
export IngressProtocol=$10
export IngressPort=$11
export EgressIP=$12
export EgressProtocol=$13
export EgressPort=$14

unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY

if [ ! -z "$ObjectsFile" ]
then
kubectl --kubeconfig $KubeconfigFile create -f $ObjectsFile
fi

if [ ! -z "$Namespace" ]
then
kubectl --kubeconfig $KubeconfigFile create ns $Namespace
fi

if [ ! -z "$ServiceAccount" ]
then
kubectl --kubeconfig $KubeconfigFile create sa $ServiceAccount -n $SA_Namespace
fi

if [ ! -z "$NetworkPolicy" ]
then
envsubst < /optional.yml | kubectl --kubeconfig $KubeconfigFile create -f -
fi
