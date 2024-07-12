#!/usr/bin/env bash

set -euo pipefail

set -x

# Resolve dependencies, in order
time .venv/bin/pip-compile requirements.0.in
time .venv/bin/pip-compile requirements.1.in
time .venv/bin/pip-compile requirements.in

{ set +x ;} 2> /dev/null
