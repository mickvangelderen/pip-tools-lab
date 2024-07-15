#!/usr/bin/env bash

set -euo pipefail

set -x

# Resolve dependencies, in order
time ./poetry export --only l0 --output requirements.l0.txt
time ./poetry export --only l1 --output requirements.l1.txt
time ./poetry export --only l2 --output requirements.l2.txt

{ set +x ;} 2> /dev/null
