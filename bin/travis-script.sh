#!/usr/bin/env bash

main(){
  if [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH == "master" ]]; then
    HUGO_ENV=production hugo
  elif [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH != "master" ]]; then
    hugo --buildFuture -b "$PREVIEW_URL/$TRAVIS_BRANCH/"
  else
    hugo
  fi
}

main
