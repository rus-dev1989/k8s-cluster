#!/bin/bash
set -e
num_pod=$2

if [[ -z "$1" ]]; then
    echo "--> Error. Example: ./script_name.sh deploy or delete or showlog  AND number of pod (1 or 2 or 3)"
    exit 1
fi

if [[ -z "$2" ]]; then
    echo "--> Error. Example: ./script_name.sh  number of pod (1 or 2 or 3)"
    exit 1
fi

deploy() {
   kubectl apply -f  backend$num_pod.yml
}

delete() {
  kubectl delete deployment app$num_pod --namespace test 
}

show_log() {
   kubectl describe pod app$num_pod --namespace test
}


if [[ $1 == "deploy" ]]; then
   deploy $num_pod
fi

if [[ $1 == "delete" ]]; then
   delete $num_pod
fi


if [[ $1 == "showlog" ]]; then
   show_log $num_pod
fi


