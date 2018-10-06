#!/usr/bin/env bash

main(){
  # preparing for production deploy via travis yaml deploy block
  if [[ $TRAVIS_PULL_REQUEST == "false" && $TRAVIS_BRANCH == "master" ]]; then
    HUGO_ENV=production hugo

  # preparing for preview deploy via aws cli
  elif [[ $TRAVIS_PULL_REQUEST == "true" && $TRAVIS_BRANCH != "master" ]]; then
    # PREVIEW_URL is a travis env var set in travis web console
    # -b flag is the hugo base path
    hugo --buildFuture -b "$PREVIEW_URL/$TRAVIS_PULL_REQUEST_BRANCH/$TRAVIS_PULL_REQUEST_SHA/"
  else
    hugo
  fi
}

main
