function toYaml (opts={}, cb) {
  let {title, googleMapUrl, diameter = 2, distance, shoulder = 4, features} = opts

  googleMapUrl = googleMapUrl.replace(/\s/g, '')

  // acceptable values:
    // 34.0471033,-118.3759368
    // 34.0471033,    -118.3759368
    // https://www.google.com/maps/@34.0471033,-118.3759368,16z
    // https://www.google.com/maps/place/A+Food+Affair/@34.0517905,-118.3887014,16z/data=!4m5!3m4!1s0x80c2b9670a44a0d7:0x89cfb823c90e52fd!8m2!3d34.0517905!4d-118.384324

  // https://stackoverflow.com/questions/3518504/regular-expression-for-matching-latitude-longitude-coordinates
  let latLonPat = /[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)/
  let latLon = googleMapUrl.match(latLonPat)[0]

  let [latitude, longitude] = latLon.split(',')

  let a = diameter / 2
  let c = shoulder - diameter
  let b = Math.sqrt(Math.pow(c, 2) - Math.pow(a, 2))
  let ab = (1 - a/b) * 100

  let shape = 1 - ((diameter / 2) / b)
  console.log('shape', shape)

  if (shape >= .05) {
    console.log('Incorrect Measurement Likely')
  } else if (shape >= -.10) {
    console.log('Single Radius')
  } else if (shape >= -.20) {
    console.log('Double Bend (1.2.3b/d)')
  } else if (shape >= -.40) {
    console.log('Double Bend (1.2.3c)')
  } else {
    console.log('Rectangle')
  }

  let elevationSvc = new google.maps.ElevationService

  let elevOpts = {
    locations: [{
      lat: parseFloat(latitude),
      lng: parseFloat(longitude)
    }]
  }

  elevationSvc.getElevationForLocations(elevOpts, (results, status) => {
    console.log(`elevation service status: ${status}`)
    let elevation = results[0].elevation

    return cb(null, `---
title: "${title}"
date: ${(new Date).toISOString()}
tags: [${features.map(f => `"${f}"`).join(", ")}]
latitude: ${latitude}
longitude: ${longitude}
elevation_meters: ${round(elevation)}
distance_meters: ${distance}
lap_lanes: ${opts.lapLanes}
home_lanes: ${opts.homeLanes}
surface_type: ${opts.surfaceType}
colors:
  - ${opts.surfaceColor}
turn_diameter_meters: ${round(diameter, 2)}
turn_radius_b_meters: ${round(b, 2)}
steeple_water_location: ${opts.steepleLocation}
---

<!--more-->`)
  })
}
