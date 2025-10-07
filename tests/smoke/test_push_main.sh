#!/bin/bash
set -euo pipefail

BRANCH="main"
TMP_PREFIX="tmp_smoke_main"

git checkout smoke-tests >/dev/null 2>&1

for REMOTE in bitbucket github; do
  TMP_BRANCH="${TMP_PREFIX}_${REMOTE}"
  echo "[main-protect] Versuch push auf ${REMOTE}/${BRANCH}"

  git fetch "$REMOTE" "$BRANCH"
  git checkout -B "$TMP_BRANCH" "$REMOTE/$BRANCH" >/dev/null 2>&1

  echo "smoke" > smoke_test.txt
  git add smoke_test.txt
  git commit -m "smoke test push to $REMOTE/$BRANCH" >/dev/null 2>&1

  if git push "$REMOTE" HEAD:"$BRANCH"; then
    echo "FAIL: push to $REMOTE/$BRANCH succeeded"
    git checkout smoke-tests >/dev/null 2>&1
    git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true
    rm -f smoke_test.txt
    exit 1
  fi

  echo "PASS: push to $REMOTE/$BRANCH was rejected"

  git checkout smoke-tests >/dev/null 2>&1
  git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true
  rm -f smoke_test.txt
done

git checkout smoke-tests >/dev/null 2>&1
exit 0
