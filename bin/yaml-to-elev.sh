# requires: `brew install yq`
# example: `find content/track/ -type f -name '[a-z]*' -exec ./bin/yaml-to-elev.sh {} \;`

main(){
  echo "file: $1"
  local lat=$(cat $1 | yq r - latitude)
  local lon=$(cat $1 | yq r - longitude)
  curl -s https://maps.googleapis.com/maps/api/elevation/json\?locations\=$lat,$lon\&key\="$GOOGLE_MAPS_TOKEN" | jq ".results[0].elevation"
}

main $1
