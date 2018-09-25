#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

lint_tracks(){
  yamllint -d relaxed content/track/**/*.md
}

build(){
  if [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH == "master" ]]; then
    echo "production build"
    HUGO_ENV=production hugo
  elif [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH != "master" ]]; then
    echo "review build"
    hugo --buildFuture -b "$PREVIEW_URL/$TRAVIS_BRANCH/"
  else
    echo "non-production, non-review build"
    hugo
  fi
}

lint_tracks
build
