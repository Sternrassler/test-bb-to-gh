#!/bin/bash#!/bin/bash#!/bin/bash#!/bin/bash#!/bin/bash

set -euo pipefail

set -e

BASE_BRANCH="main"

TMP_PREFIX="tmp_smoke_feature"set -e



git checkout smoke-tests >/dev/null 2>&1BRANCH="smoke-feature"



for REMOTE in bitbucket github; doset -eset -e

  TMP_BRANCH="${TMP_PREFIX}_${REMOTE}"

  echo "[feature-push] Versuch push auf ${REMOTE}/${TMP_BRANCH}"git checkout main >/dev/null 2>&1



  git fetch "$REMOTE" "$BASE_BRANCH"git branch -D "$BRANCH" >/dev/null 2>&1 || trueBRANCH="smoke-feature"

  git checkout -B "$TMP_BRANCH" "$REMOTE/$BASE_BRANCH" >/dev/null 2>&1

git checkout -b "$BRANCH" >/dev/null 2>&1

  echo "smoke feature" > smoke_feature.txt

  git add smoke_feature.txtBRANCH="smoke-feature"BRANCH="smoke-feature"

  git commit -m "smoke test feature push to $REMOTE" >/dev/null 2>&1

for REMOTE in bitbucket github; do

  if git push "$REMOTE" HEAD:"$TMP_BRANCH"; then

    echo "PASS: feature push to $REMOTE succeeded"  echo "Teste Push auf $BRANCH zu $REMOTE ..."git checkout main

    git push "$REMOTE" --delete "$TMP_BRANCH" >/dev/null 2>&1 || true

  else  git reset --hard "$REMOTE/main"

    echo "FAIL: feature push to $REMOTE failed"

    git checkout smoke-tests >/dev/null 2>&1git branch -D "$BRANCH" >/dev/null 2>&1 || truegit checkout -b $BRANCHgit checkout -b $BRANCH

    git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true

    rm -f smoke_feature.txt  echo "Smoke-Test" > smoke_test.txt

    exit 1

  fi  git add smoke_test.txt



  git checkout smoke-tests >/dev/null 2>&1  git commit -m "Smoke-Test: commit auf Feature-Branch zu $REMOTE"

  git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true

  rm -f smoke_feature.txtgit checkout -b "$BRANCH"for REMOTE in bitbucket github; dofor REMOTE in bitbucket github; do

done

  if git push "$REMOTE" "$BRANCH"; then

git checkout smoke-tests >/dev/null 2>&1

exit 0    echo "OK: Push auf Feature-Branch zu $REMOTE funktioniert."


    git push "$REMOTE" --delete "$BRANCH" >/dev/null 2>&1 || true

  elsefor REMOTE in bitbucket github; do  echo "Test-Commit" > smoke_test.txt  echo "Test-Commit" > smoke_test.txt

    echo "FEHLER: Push auf Feature-Branch zu $REMOTE fehlgeschlagen!"

    exit 1  echo "Teste Push auf $BRANCH zu $REMOTE ..."

  fi

  git reset --hard "$REMOTE/main"  git add smoke_test.txt  git add smoke_test.txt

  git reset --hard "$REMOTE/main"

  rm -f smoke_test.txt

  echo "Repo für nächsten Test zurückgesetzt."

done  echo "Smoke-Test" > smoke_test.txt  git commit -m "Smoke-Test: commit auf Feature-Branch zu $REMOTE"  git commit -m "Smoke-Test: commit auf Feature-Branch zu $REMOTE"



git checkout main >/dev/null 2>&1  git add smoke_test.txt

git branch -D "$BRANCH" >/dev/null 2>&1 || true

  git commit -m "Smoke-Test: commit auf Feature-Branch zu $REMOTE"  echo "Teste Push auf $BRANCH zu $REMOTE ..."  echo "Teste Push auf $BRANCH zu $REMOTE ..."

exit 0



  if git push "$REMOTE" "$BRANCH"; then  if git push $REMOTE $BRANCH; then  if git push $REMOTE $BRANCH; then

    echo "OK: Push auf Feature-Branch zu $REMOTE funktioniert."

    git push "$REMOTE" --delete "$BRANCH" >/dev/null 2>&1 || true    echo "OK: Push auf Feature-Branch zu $REMOTE funktioniert."    echo "OK: Push auf Feature-Branch zu $REMOTE funktioniert."

  else

    echo "FEHLER: Push auf Feature-Branch zu $REMOTE fehlgeschlagen!"  else  else

    exit 1

  fi    echo "FEHLER: Push auf Feature-Branch zu $REMOTE fehlgeschlagen!"    echo "FEHLER: Push auf Feature-Branch zu $REMOTE fehlgeschlagen!"



  git reset --hard "$REMOTE/main"    exit 1    exit 1

  rm -f smoke_test.txt

  echo "Repo für nächsten Test zurückgesetzt."  fi  fi

done

  git reset --hard $REMOTE/$BRANCH  git reset --hard $REMOTE/$BRANCH

cd - >/dev/null 2>&1 || true

  git clean -fdx  git clean -fdx

git checkout main

git branch -D "$BRANCH" >/dev/null 2>&1 || true  rm -f smoke_test.txtdone



exit 0  git checkout mainexit 0


  git pull $REMOTE main
  git clean -fdx
  echo "Repo für nächsten Test zurückgesetzt."
done
exit 0
