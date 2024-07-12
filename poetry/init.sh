#!/usr/bin/env bash

set -euo pipefail

[ $(pyenv local) == $(cat .python-version | tr -d '\n') ] || echo "warn: consider using pyenv to manage python versions"

set -x

# An environment for poetry
python -m venv .poetry/
.poetry/bin/pip install --upgrade pip
.poetry/bin/pip install --upgrade poetry poetry-plugin-export
rm -f ./poetry && ln -s .poetry/bin/poetry ./poetry

# An environment for the application
python -m venv .venv/

{ set +x ;} 2> /dev/null

./sync.sh
