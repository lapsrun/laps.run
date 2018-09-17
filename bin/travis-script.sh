#!/usr/bin/env bash

main(){
  if [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH == "master" ]]; then
    HUGO_ENV=production hugo
  elif [[ $TRAVIS_PULL_REQUEST ]]; then
    hugo --buildFuture -b "$PREVIEW_URL/$TRAVIS_PULL_REQUEST_BRANCH/$TRAVIS_COMMIT/"
  else
    hugo
  fi
}

main
