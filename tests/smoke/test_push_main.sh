#!/bin/bash#!/bin/bash#!/bin/bash#!/bin/bash#!/bin/bash#!/bin/bash

set -euo pipefail

set -euo pipefail

BRANCH="main"

TMP_PREFIX="tmp_smoke_main"set -e



git checkout smoke-tests >/dev/null 2>&1BRANCH="main"



for REMOTE in bitbucket github; doTMP_BRANCH_PREFIX="tmp/smoke-main"set -e

  TMP_BRANCH="${TMP_PREFIX}_${REMOTE}"

  echo "[main-protect] Versuch push auf ${REMOTE}/${BRANCH}"



  git fetch "$REMOTE" "$BRANCH"for REMOTE in bitbucket github; doBRANCH="main"

  git checkout -B "$TMP_BRANCH" "$REMOTE/$BRANCH" >/dev/null 2>&1

  TMP_BRANCH="${TMP_BRANCH_PREFIX}-${REMOTE}"

  echo "smoke" > smoke_test.txt

  git add smoke_test.txt  echo "[Main-Protect] Prüfe Push auf $BRANCH zu $REMOTE …"set -eset -e

  git commit -m "smoke test push to $REMOTE/$BRANCH" >/dev/null 2>&1



  if git push "$REMOTE" HEAD:"$BRANCH"; then

    echo "FAIL: push to $REMOTE/$BRANCH succeeded"  git fetch "$REMOTE" "$BRANCH"for REMOTE in bitbucket github; do

    git checkout smoke-tests >/dev/null 2>&1

    git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true  git checkout -B "$TMP_BRANCH" "$REMOTE/$BRANCH" >/dev/null 2>&1

    rm -f smoke_test.txt

    exit 1  echo "Teste Push auf $BRANCH zu $REMOTE ..."BRANCH="main"

  fi

  echo "Smoke-Test" > smoke_test.txt

  echo "PASS: push to $REMOTE/$BRANCH was rejected"

  git add smoke_test.txt  git checkout "$BRANCH" >/dev/null 2>&1

  git checkout smoke-tests >/dev/null 2>&1

  git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true  git commit -m "Smoke-Test: push main zu $REMOTE"

  rm -f smoke_test.txt

done  git reset --hard "$REMOTE/$BRANCH"BRANCH="main"BRANCH="main"



git checkout smoke-tests >/dev/null 2>&1  if git push "$REMOTE" HEAD:"$BRANCH"; then

exit 0

    echo "FEHLER: Push auf $BRANCH bei $REMOTE war möglich – Schutz fehlt!"

    git push "$REMOTE" --force "$REMOTE/$BRANCH":"$BRANCH" >/dev/null 2>&1 || true

    git checkout smoke-tests >/dev/null 2>&1  echo "Smoke-Test" > smoke_test.txtfor REMOTE in bitbucket github; do

    git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true

    rm -f smoke_test.txt  git add smoke_test.txt

    exit 1

  else  git commit -m "Smoke-Test: commit auf main zu $REMOTE"  echo "Teste Push auf $BRANCH zu $REMOTE ..."for REMOTE in bitbucket github; dofor REMOTE in bitbucket github; do

    echo "OK: $REMOTE blockiert direkten Push auf $BRANCH"

  fi



  git checkout smoke-tests >/dev/null 2>&1  if git push "$REMOTE" "$BRANCH"; then  git checkout "$BRANCH"

  git branch -D "$TMP_BRANCH" >/dev/null 2>&1 || true

  rm -f smoke_test.txt    echo "FEHLER: Push auf main zu $REMOTE war erfolgreich, Schutz fehlt!"



done    exit 1  git reset --hard "$REMOTE/$BRANCH"  echo "Teste Push auf $BRANCH zu $REMOTE ..."  echo "Teste Push auf $BRANCH zu $REMOTE ..."



git checkout smoke-tests >/dev/null 2>&1  else

exit 0

    echo "OK: Push auf main zu $REMOTE wurde blockiert."

  fi

  echo "Smoke-Test" > smoke_test.txt  git checkout $BRANCH  git checkout $BRANCH

  git reset --hard "$REMOTE/$BRANCH"

  rm -f smoke_test.txt  git add smoke_test.txt

  echo "Repo für nächsten Test zurückgesetzt."

done  git commit -m "Smoke-Test: commit auf main zu $REMOTE"  echo "Test-Commit" > smoke_test.txt  echo "Test-Commit" > smoke_test.txt



git checkout "$BRANCH" >/dev/null 2>&1

exit 0

  if git push "$REMOTE" "$BRANCH"; then  git add smoke_test.txt  git add smoke_test.txt

    echo "FEHLER: Push auf main zu $REMOTE war erfolgreich, Schutz fehlt!"

    exit 1  git commit -m "Smoke-Test: commit auf main zu $REMOTE"  git commit -m "Smoke-Test: commit auf main zu $REMOTE"

  else

    echo "OK: Push auf main zu $REMOTE wurde blockiert."  if git push $REMOTE $BRANCH; then  if git push $REMOTE $BRANCH; then

  fi

    echo "FEHLER: Push auf main zu $REMOTE war erfolgreich, Schutz fehlt!"    echo "FEHLER: Push auf main zu $REMOTE war erfolgreich, Schutz fehlt!"

  git reset --hard "$REMOTE/$BRANCH"

  rm -f smoke_test.txt    exit 1    exit 1

  echo "Repo für nächsten Test zurückgesetzt."

done  else  else



git checkout "$BRANCH"    echo "OK: Push auf main zu $REMOTE wurde blockiert."    echo "OK: Push auf main zu $REMOTE wurde blockiert."

exit 0

  fi  fi

  git reset --hard $REMOTE/$BRANCH  git reset --hard $REMOTE/$BRANCH

  git clean -fdx  git clean -fdx

  rm -f smoke_test.txtdone

  git checkout $BRANCHexit 0

  git pull $REMOTE $BRANCH
  git clean -fdx
  echo "Repo für nächsten Test zurückgesetzt."
done
exit 0
