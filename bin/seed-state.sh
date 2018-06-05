# lay down folders and _index.md files for each us state
# depends on this csv file in root of project: https://raw.githubusercontent.com/jasonong/List-of-US-States/master/states.csv
# example run: `q -H -d "," "select State, lower(Abbreviation) from states.csv" | tr '\n' '\0' | xargs -0 -n1 ./bin/seed-state.sh`

main(){
  echo "input: $1"
  local state=$(echo "$1" | cut -d"," -f1)
  local abbrev=$(echo "$1" | cut -d"," -f2)
  echo "abbrev: $abbrev"
  echo "state: $state"
  echo "---"

  mkdir -p content/track/us/$abbrev/
  cat > content/track/us/$abbrev/_index.md <<EOF
---
title: "$state"
---
EOF
}

main "$1"
