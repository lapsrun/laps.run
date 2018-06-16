---
title: "Week of 2018-06-11 Notes"
date: 2018-06-16T12:13:42-07:00
tags: []

---

'A:'B ratio. staging site.

<!--more-->

## 2018-06-11

Should I track which type of sports field is visible on the infield, if any? Probably so.

types of visible fields:

- american football.
- track infield (javelin, hammer, shot, disc).
- soccer/football.

---

I've updated all the tracks in my google sheet with apex radius measurements. Seeing some interesting configurations, clear ratio of A' to B' should indicate the configuration.

Next:

- I need to figure out which fields I want to add to each track.
- Update templates for new fields.
  - ratio of A' to B'
  - double bend vs. single radius.

---

## 2018-06-12

- I don’t think we want to do or can do more complicated math in hugo/go-template. No exponents, no square root.
- Updated the track single and list templates for turn shape ratio. With radius b as a component field.
- Updating all tracks with steeple location, and radius b. I intend to push all updates once I’m done. Probably one more work session
- Then track type based on ratio thresholds. Single radius vs doublebend
- Then finally to adjust speed rating based on the track type.
- Screencast for taking a measurement

---

## 2018-06-13

- Glossary links next to fields on single track page. Glossary page with anchors
- Ci which publishes affected files somewhere for review
- Contact let’s run and flotrack to publicize
- Add empty track_year field to every track. Add to single page view and list
- Auto tweet should only tweet tracks

---

## 2018-06-15

- Finished adding radius b measurements to all tracks
- How should turn shape ratio impact speed rating?
- Then we need to figure out how to make a single speed calculation in hugo.
- Remove duplicate speed rating field in all tracks
- Add track_year field. Default empty. Add to single track page
- Glossary
- Staging s3 website with age out. If not master branch and is pull request build, deploy to staging. Post the link and expiration info to github PR as comment text.
- Web tool to generate yaml from a form submission. Copy paste to pull request.
- /metrics static Prometheus endpoint
- Github links for individual track pages. View history, blame, contribute.
- Ads on speed listing and individual track pages.

---

## 2018-06-16

a:b ratios
- 1.2.3b -14.10
- 1.2.3c -32.26
- 1.2.3d -17.45

difference in turn distance. actual vs simple (single radius) method
- 1.2.3b -5.62%
- 1.2.3c -12.50%
- 1.2.3d -7.64%

anything over 3% positive a:b is almost certainly an error

double bend tracks have 5-12% less turn than their simple turn diameter would indicate. We credit too much turn distance when using a simple single radius measurement on these tracks. We should adjust.

A:B thresholds for track types

min max type

- 1000 -> 5 = error
- 5 -> -10 = single radius
- -10 -> -20 = double bend 1.2.3 b/d
- -20 -> -40 = double bend 1.2.3 c
- -40 -> -1000 = error

1. based on a:b, label each track as "single radius" or "double bend".
2. if double bend
    1. if A:B > -20, subtract 6.5% from turn distance (1.2.3b/1.2.3d)
    2. if A:B <= -20, subtract 12.5% from turn distance (1.2.3c)

These adjustments will ripple out to speed rating. And make these tracks slower.

key to accuracy is not a perfect isosceles triangle. i'm pretty good at nailing the apex by sight. the key is getting the exact shoulder of the turn as the base of the triangle. it isn't always at the common finish!
