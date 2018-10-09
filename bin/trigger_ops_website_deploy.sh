#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

set -x

trigger_ops_website_deploy(){
  body='{
    "request": {
      "branch":"master"
    }
  }'

  curl -s -X POST \
     -H "Content-Type: application/json" \
     -H "Accept: application/json" \
     -H "Travis-API-Version: 3" \
     -H "Authorization: token $TRAVIS_CI_TOKEN" \
     -d "$body" \
     https://api.travis-ci.com/repo/travis-ci%2Ftphummel/ops.laps.run
}

trigger_ops_website_deploy
