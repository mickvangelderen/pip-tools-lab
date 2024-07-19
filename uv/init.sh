#!/usr/bin/env bash

set -euo pipefail

[ $(pyenv local) == $(cat .python-version | tr -d '\n') ] || echo "warn: consider using pyenv to manage python versions"

set -x

# An environment for poetry
python -m venv .tools
.tools/bin/pip install --upgrade pip
.tools/bin/pip install --upgrade uv

# An environment for the application
python -m venv .venv/

{ set +x ;} 2> /dev/null
