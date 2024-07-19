#!/usr/bin/env bash

set -euo pipefail

set -x

# Resolve dependencies, in order
time .tools/bin/uv pip compile pyproject.toml --generate-hashes > requirements.txt

{ set +x ;} 2> /dev/null
