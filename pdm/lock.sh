#!/usr/bin/env bash

set -euo pipefail

set -x

time ./pdm lock
time ./pdm export -o requirements.txt

{ set +x ;} 2> /dev/null
