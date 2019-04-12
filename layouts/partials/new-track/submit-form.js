function submitTrack() {
  let form = document.querySelector('form[name=track]')
  let inputs = ['title', 'distance', 'googleMapUrl',
    'diameter', 'shoulder', 'homeLanes', 'lapLanes',
    'surfaceType', 'surfaceColor'
  ]
  let selects = ['steepleLocation']

  let opts = inputs.reduce((memo, k) => {
    memo[k] = form.querySelector(`input[name=${k}]`).value
    return memo
  }, {})

  opts = selects.reduce((memo, k) => {
    memo[k] = form.querySelector(`select[name=${k}]`).value
    return memo
  }, opts)

  toYaml(opts, (err, yaml) => {
    if(err) console.log(err)
    document.querySelector('form[name=output] textarea').value = yaml
  })

}
