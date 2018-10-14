#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

set -x

trigger_ops_website_deploy(){
  local body='{
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
     https://api.travis-ci.org/repo/tphummel%2Fops.laps.run/requests
}

if [ "$TRAVIS_SECURE_ENV_VARS" == "true" ]; then
  trigger_ops_website_deploy
else
  echo "this is an untrusted build, skipping ops website deploy"
fi
