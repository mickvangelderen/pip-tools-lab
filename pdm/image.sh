#!/usr/bin/env bash

set -euo pipefail

./lock.sh

set -x

time docker buildx build -t pip-tools-lab .

{ set +x ;} 2> /dev/null
