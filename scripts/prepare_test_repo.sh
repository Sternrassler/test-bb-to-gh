#!/bin/bash
set -euo pipefail

if ! git rev-parse --verify smoke-tests >/dev/null 2>&1; then
  echo "smoke-tests branch missing" >&2
  exit 1
fi

git checkout smoke-tests >/dev/null 2>&1
# Keep working tree aligned with latest commit on this branch
git reset --hard
