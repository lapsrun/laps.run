#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

set -x

main(){
  pushd ops-website
  aws s3 cp s3://laps.run-ops-data-private/ content/ --recursive
  hugo
  sed -i -e "s/123456abcdef/$TRAVIS_COMMIT/" public/index.html
  aws s3 cp public s3://ops.laps.run/ --recursive
  popd
}

main
