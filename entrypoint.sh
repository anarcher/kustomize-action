#!/bin/sh -l


if [ -z "${INPUT_KUSTOMIZE}" ] && [ -z "${INPUT_SETIMAGE}" ]; then
    echo "kustomize args is empty. Please set with kustomize."
    exit 1;
fi 

cmd=""

if [ -n "${INPUT_PATH}" ]; then
    cmd="cd ${INPUT_PATH}; "
fi

if [ -n "${INPUT_KUSTOMIZE}" ] || [ -z "${INPUT_SETIMAGE}" ]; then
    cmd="${cmd} kustomize ${INPUT_KUSTOMIZE}"
fi

if [ -n "${INPUT_SETIMAGE}" ] || [ -z "${INPUT_KUSTOMIZE}" ]; then
    cmd="${cmd} kustomize edit set image ${INPUT_SETIMAGE}"
fi

echo "$cmd"
sh -c "${cmd}"
