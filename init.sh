#!/usr/bin/env bash

set -euo pipefail

[ $(pyenv local) == $(cat .python-version | tr -d '\n') ] || echo "warn: consider using pyenv to manage python versions"

set -x

python -m venv .venv
.venv/bin/pip install --upgrade pip
.venv/bin/pip install --upgrade pip-tools

{ set +x ;} 2> /dev/null

./sync.sh
