function submitTrack() {
  let form = document.querySelector('form[name=track]')
  let inputs = ['title', 'distance', 'googleMapUrl',
    'diameter', 'shoulder', 'homeLanes', 'lapLanes',
    'surfaceType', 'surfaceColor'
  ]

  let opts = inputs.reduce((memo, k) => {
    memo[k] = form.querySelector(`input[name=${k}]`).value
    return memo
  }, {})

  opts.steepleLocation = form.querySelector(`select[name=steepleLocation]`).value

  toYaml(opts, (err, yaml) => {
    if(err) console.log(err)
    document.querySelector('form[name=output] textarea').value = yaml
  })

}
