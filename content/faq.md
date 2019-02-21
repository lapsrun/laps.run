---
title: "FAQ"
date: 2018-05-27T13:44:33-07:00
tags: ["guide"]
toc: true
---
<!--more-->

# Q: What makes a track fast or slow?

A: There are many factors which contribute to the performance speed of an outdoor track. This database focuses on track geometry. Tracks which have more gradual turns are faster. Tracks with sharper turns are slower. There is a great deal of variability in the geometry of outdoor tracks, even those of the same distance. There are other properties of a track which can contribute to performance alongside the geometry, such as steeplechase water jump location, surface type (if available), and elevation.

# Q: What is the meaning of a track's "Speed Rating"?

A: The Speed Rating is purely based on lane one geometry - specifically the track's proportion of straightaway and turn distance. A Speed Rating of 0.00 indicates a track matches standard track proportions from section 1.2.3a of the [IAAF Track and Field Facilities Manual (2008)][0]. A standard 400m track is 168.78 meters of straightaway (42.2%) and 231.22 meters of turn (57.8%). A positive Speed Rating means a track has more than 57.8% turn. A negative Speed Rating means a track has less than 57.8% turns.

# Q: Is Speed Rating relevant for all running events?

A: No. 100m/110m races don't include a turn, so geometry is not relevant. Speed Rating is relevant to all events with at least one turn.

# Q: I ran a 200m race out of lane 4. Is the Speed Rating for lane 1 the same as lane 4?

A: No. This is an upcoming area of interest.

# Q: Can I compare Speed Ratings between tracks of different distances?

A: Yes. Speed Rating is normalized for track distance. For example, you can compare [Franklin Field]({{< ref "/track/us/pa/franklin-field.md" >}}) with [Drake Stadium]({{< ref "/track/us/ia/drake-univ.md" >}}) even though they are different distances in lane one.

# Q: Does track surface type contribute to the Speed Rating?

A: No. We want to have the most accurate information possible about each track's surface, ex: Mondo, Rekortan. However, you'll find many tracks list their surface as "artificial". The age of the track surface also contributes to the speed of a track, however there is no database field for capturing resurfacing dates presently.

# Q: Does track elevation contribute to Speed Rating?

A: No.

# Q: Are "double bend" tracks handled accurately?

A: Yes. The speed algorithm uses a check to determine if a track is single radius or a different shape. Geometry and ultimately Speed Rating account for non-uniform turns.

# Q: Are oddball track shapes handled accurately?

A: Sometimes. We intend to handle the most common 80%, not the strange 20%. The weirdest shape we automatically identify is rectangular tracks like [Beverly Hills High School]({{< ref "/track/us/ca/beverly-hills-hs.md" >}}). Anything outside our automatic checks will appear as geometry type: "Incorrect Measurement Likely".

# Q: Are inaccuracies possible because you assume most tracks are 400m?

A: Yes. However, track distance can be changed to any distance if it isn't 400m.

# Q: Where can I learn more about track geometry?

A: [IAAF Track and Field Facilities Manual (2008)][0]. See section 1.2.3 in particular for example track geometries.

# Q: Is it possible that measurements are wrong?

A: Yes. If you find an error please contribute to help make the ratings more accurate!

# Q: I ran fast on a track you said was "slow". How is that possible?

A: First, congratulations on a great run! Second, track geometry is one of many factors like your fitness, weather, what you ate for breakfast, your hydration, your recent workload, other competitors you are racing with, etc. Geometry *is* a factor. You would have run faster on a track with faster geometry. How much faster is an area of interest.


[0]: https://www.iaaf.org/download/download?filename=77c027b0-46b8-405d-9ffd-889fa28e3f6e.pdf&urlslug=IAAF%20Track%20and%20Field%20Facilities%20
