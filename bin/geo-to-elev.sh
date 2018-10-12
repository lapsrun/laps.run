main(){
  curl -s https://maps.googleapis.com/maps/api/elevation/json\?locations="$1","$2"\&key="$GOOGLE_MAPS_TOKEN" | jq ".results[0].elevation"
}

main "$1" "$2"
