# requires: `brew install yq`
# example: `find content/track/ -type f -name '[a-z]*' -exec ./bin/yaml-to-elev.sh {} \;`
# set -x

main(){
  echo "file: $1"
  local lat=$(yq r "$1" latitude)
  local lon=$(yq r "$1" longitude)
  # echo "lat: $lat"
  # echo "lon: $lon"
  local elevation=$(curl -s https://maps.googleapis.com/maps/api/elevation/json\?locations="$lat","$lon"\&key="$GOOGLE_MAPS_TOKEN" | jq ".results[0].elevation")
  # echo "elevation: $elevation"
  local elevation_rounded=$(printf "%.2f" "$elevation")
  echo "elevation_rounded: $elevation_rounded"

  # [[:space:]] is an osx sed-ism
  # see: https://superuser.com/questions/112834/how-to-match-whitespace-in-sed
  sed -i '' "s/^elevation_meters:[[:space:]]*\$/elevation_meters: $elevation_rounded/" "$1"
}

main "$1"
