#!/bin/sh -l


if [ -z "${INPUT_KUSTOMIZE}" ] && [ -z "${INPUT_SET_IMAGE}" ]; then
    echo "kustomize args is empty. Please set with kustomize."
    exit 1;
fi 

cmd=""

if [ -n "${INPUT_PATH}" ]; then
    cmd="cd ${INPUT_PATH}; "
fi

if [ -n "${INPUT_KUSTOMIZE}" ] || [ -z "${INPUT_SET_IMAGE}" ]; then
    cmd="${cmd} kustomize ${INPUT_KUSTOMIZE}"
else
    cmd="${cmd} kustomize edit set image ${INPUT_SET_IMAGE}"
fi

echo "$cmd"
sh -c "${cmd}"
