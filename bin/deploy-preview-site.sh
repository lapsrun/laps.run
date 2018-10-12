#!/usr/bin/env bash
set -x

deploy_preview_site(){
  # - provider: s3
  #   access_key_id: $AWS_ACCESS_KEY_ID
  #   secret_access_key: $AWS_SECRET_ACCESS_KEY
  #   local_dir: public/
  #   bucket: laps.run-preview
  #   upload-dir: $TRAVIS_BRANCH
  #   skip_cleanup: true
  #   on:
  #     repo: tphummel/laps.run
  #     all_branches: true
  #     condition: "$TRAVIS_BRANCH != master"

  # s3://laps.run-ops-data-private/

  aws s3 cp public/ "s3://laps.run-preview/$TRAVIS_PULL_REQUEST_BRANCH/$TRAVIS_PULL_REQUEST_SHA/" --recursive
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

deploy_preview_site
add_pull_request_comment
