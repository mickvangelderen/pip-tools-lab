#!/usr/bin/env bash

set -euo pipefail

./lock.sh

set -x

time ./pdm sync

{ set +x ;} 2> /dev/null
