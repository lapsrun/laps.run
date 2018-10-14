#!/usr/bin/env bash
set -x

deploy_preview_site(){
  aws s3 cp public/ s3://laps.run-preview/$TRAVIS_PULL_REQUEST_BRANCH/$TRAVIS_PULL_REQUEST_SHA/ --recursive
}

add_pull_request_comment(){
  # https://damien.pobel.fr/post/github-api-from-travisci/
  # https://github.com/dpobel/damien.pobel.fr/blob/comment_from_travisci/bin/deploy.sh#L9-L10

  local expires_at=$(date -d "+7 days")
  local comment="Thank you for contributing!<br />[Preview]($PREVIEW_URL/$TRAVIS_PULL_REQUEST_BRANCH/$TRAVIS_PULL_REQUEST_SHA/) these changes<br />Link expires: $expires_at"

  curl \
    -H "Authorization: token $GITHUB_TOKEN" \
    -X POST \
    -d "{\"body\": \"$comment\"}" \
  "https://api.github.com/repos/$TRAVIS_REPO_SLUG/issues/$TRAVIS_PULL_REQUEST/comments"
}

if [ "$TRAVIS_SECURE_ENV_VARS" == "true" ]; then
  deploy_preview_site
  add_pull_request_comment
else
  echo "this is an untrusted build, skipping preview website deploy"
fi
