#!/usr/bin/env bash

# https://damien.pobel.fr/post/github-api-from-travisci/
# https://github.com/dpobel/damien.pobel.fr/blob/comment_from_travisci/bin/deploy.sh#L9-L10

main(){
  local expires_at=$(date -d "+7 days")
  local comment="Thank you for contributing!<br />
Preview these changes: $PREVIEW_URL/$TRAVIS_PULL_REQUEST_BRANCH/ <br />
Expires: $expires_at (above link will no longer work)
Note: it may take a moment for the branch to deploy. Check all pending travis builds have completed"

  curl \
    -H "Authorization: token $GITHUB_TOKEN" \
    -X POST \
    -d "{\"body\": \"$comment\"}" \
  "https://api.github.com/repos/$TRAVIS_REPO_SLUG/issues/$TRAVIS_PULL_REQUEST/comments"
}

if [[ $TRAVIS_PULL_REQUEST ]]; then
  main
else
  echo "not a pull request, skipping pull request comment"
fi
