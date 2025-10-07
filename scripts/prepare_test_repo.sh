#!/bin/bash#!/bin/bash#!/bin/bash

set -e

set -eset -e

# Ensure the smoke test branch exists locally

git fetch --all --quietgit checkout main



if ! git rev-parse --verify smoke-tests >/dev/null 2>&1; then# Ensure we are on main before validating branch protectionsfor REMOTE in bitbucket github; do

  echo "Smoke-Test-Branch fehlt lokal; bitte smoke-tests anlegen." >&2

  exit 1git checkout main >/dev/null 2>&1	git fetch $REMOTE

fi

	git reset --hard $REMOTE/main

git checkout smoke-tests >/dev/null 2>&1

for REMOTE in bitbucket github; dodone

git reset --hard

  git fetch "$REMOTE"
  git reset --hard "$REMOTE/main"
done
