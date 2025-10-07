#!/bin/bash
set -euo pipefail

BASE_BRANCH="main"
TMP_PREFIX="tmp_smoke_feature"

git checkout smoke-tests >/dev/null 2>&1

for REMOTE in bitbucket github; do
  TMP_BRANCH="${TMP_PREFIX}_${REMOTE}"
  echo "[feature-push] Versuch push auf ${REMOTE}/${TMP_BRANCH}"

  git fetch "$REMOTE" "$BASE_BRANCH"
  git checkout -B "$TMP_BRANCH" "$REMOTE/$BASE_BRANCH" >/dev/null 2>&1

  echo "smoke feature" > smoke_feature.txt
  git add smoke_feature.txt
  git commit -m "smoke test feature push to $REMOTE" >/dev/null 2>&1

  if git push "$REMOTE" HEAD:"$TMP_BRANCH"; then
    echo "PASS: feature push to $REMOTE succeeded"
    git push "$REMOTE" --delete "$TMP_BRANCH" >/dev/null 2>&1 || true
  else
    echo "FAIL: feature push to $REMOTE failed"
    git checkout smoke-tests >/dev/null 2>&1
    git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true
    rm -f smoke_feature.txt
    exit 1
  fi

  git checkout smoke-tests >/dev/null 2>&1
  git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true
  rm -f smoke_feature.txt
done

git checkout smoke-tests >/dev/null 2>&1
exit 0
