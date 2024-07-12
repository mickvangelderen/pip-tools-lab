#!/usr/bin/env bash

set -euo pipefail

./lock.sh

set -x

time .venv/bin/pip-sync requirements.0.txt requirements.1.txt requirements.txt

{ set +x ;} 2> /dev/null
