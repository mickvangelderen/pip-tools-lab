#!/usr/bin/env bash

set -euo pipefail

./lock.sh

set -x

time ./poetry update --lock

{ set +x ;} 2> /dev/null
