function submitTrack() {
  let form = document.querySelector('form[name=track]')
  let inputs = ['title', 'distance', 'googleMapUrl',
    'diameter', 'shoulder', 'homeLanes', 'lapLanes',
    'surfaceType', 'surfaceColor', 'elevation'
  ]

  let opts = inputs.reduce((memo, k) => {
    memo[k] = form.querySelector(`input[name=${k}]`).value
    return memo
  }, {})

  opts.steepleLocation = form.querySelector(`select[name=steepleLocation]`).value

  document.querySelector('form[name=output] textarea').value = toYaml(opts)
}
