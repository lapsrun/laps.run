#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail
IFS=$'\n\t'

set -x

main(){
  pushd ops-website
  aws s3 sync s3://laps.run-ops-data-private/ content/
  hugo
  aws s3 sync public s3://ops.laps.run/
  popd
}

main
