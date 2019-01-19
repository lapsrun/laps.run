---
title: "FAQ"
date: 2018-05-27T13:44:33-07:00
tags: ["guide"]
toc: true
---
<!--more-->

# Q: What makes a track fast or slow?

A: There are many factors which contribute to the performance speed of an outdoor track. This database focuses on track geometry. Tracks which have more gradual turns are faster. Tracks with sharper turns are slower. There is a great deal of variability in the geometry of outdoor tracks, even those of the same distance. There are other properties of a track which can contribute to performance alongside the geometry, such as steeplechase water jump location, surface type (if available), and elevation.

# Q: What does the Speed Rating indicate about a track?

A: The Speed Rating is purely based on lane 1 geometry. A Speed Rating of 0.00 indicates that a track is exactly 50% turn and 50% straight (equal quadrant). A positive Speed Rating indicates a track is majority turn. A negative Speed Rating indicates a track is majority straight.

# Q: Is Speed Rating relevant for all running events?

A: No. 100m/110m races don't include a turn, so geometry is not relevant. Speed Rating is relevant to all events with at least one turn.  

# Q: I ran a 200m race out of lane 4. Is the Speed Rating for lane 1 the same as lane 4?

A: No. This is an upcoming area of interest.

# Q: Can I compare Speed Ratings between tracks of different distances?

A: Yes. Speed Rating is normalized for track distance. For example, you can compare [Franklin Field](/track/us/pa/franklin-field/) with [Drake Stadium](/track/us/ia/drake-univ/) even though they are different distances at the rail.

# Q: Does track surface type contribute to the Speed Rating?

A: No. We want to have the most accurate information possible about each track's surface, ex: Mondo, Rekortan. However, you'll find many tracks list their surface as "artificial". The age of the track surface also contributes to the speed of a track, however there is no database field for capturing resurfacing dates.

# Q: Does track elevation contribute to Speed Rating?

A: No.

# Q: Are "double bend" tracks handled accurately?

A: Yes. The speed algorithm uses a check to determine if a track is single radius or a different shape. Geometry and ultimately speed rating account for non-uniform turns

# Q: Are oddball track shapes handled accurately?

A: Sometimes. We intend to handle the most common 80% - not the strange 20%. The weirdest shape we automatically identify is rectangular tracks like [Beverly Hills High School](/track/us/ca/beverly-hills-hs/). Anything outside our automatic checks will appear as geometry type: "Incorrect Measurement Likely"

# Q: Are inaccuracies possible because you assume most tracks are 400m?

A: Yes. However, track distance can be set to any distance if it isn't 400m.

# Q: Where can I learn more about track geometry?

A: [IAAF Track and Field Facilities Manual (2008)](https://www.iaaf.org/download/download?filename=77c027b0-46b8-405d-9ffd-889fa28e3f6e.pdf&urlslug=IAAF%20Track%20and%20Field%20Facilities%20). See section 1.2.3 in particular for example track geometries.

# Q: Is it possible that measurements are wrong?

A: Yes. If you find an error please contribute to help make the ratings more accurate!

# Q: I ran fast on a track you said was "slow". How is that possible?

A: First, congratulations on a great run! Second, track geometry is one of many factors like like your fitness, weather, what you ate for breakfast, your hydration, your recent workload, other competitors you are racing with, etc. Geometry *is* a factor. You would have run faster on a track with faster geometry.
