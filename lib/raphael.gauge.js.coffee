# Raphaël Gauge 
# * Author: Renato Albano (renatoalbano.com) ~ http://github.com/renatoalbano 
# * Author: Vincent van Haaff (flyingoctopus.net) ~ http://github.com/flyingoctopus 
# * Licensed under the MIT (http://www.opensource.org/licenses/mit-license.php) license.
# * Version: 1.1 (Mar 13 2012)
# * Version: 1.1.1a (Mar 30 2013)
# 
((Raphael) ->
  Raphael.fn.gauge = (minAngle, maxAngle) ->
    minAngle = minAngle or 0
    maxAngle = maxAngle or 360
    actualAngle = minAngle
    bgCenter = undefined
    pointerCenter = null
    bg = @set()
    pointer = @set()
    @animateMS = 1000
    @animateEasing = "elastic"
    @bg = (el, center) ->
      bgCenter = center
      if pointerCenter?
        pointer.toFront()
        pointer.attr
          x: bgCenter[0] - pointerCenter[0]
          y: bgCenter[1] - pointerCenter[1]

        @moveToAngle actualAngle
      bg.push el

    @pointer = (el, center) ->
      
      # if bg not exists use center point
      bgCenter = bgCenter or [parseInt(@width / 2), parseInt(@height / 2)]
      pointerCenter = center
      el.attr
        x: bgCenter[0] - center[0]
        y: bgCenter[1] - center[1]
        rotation: minAngle + " " + bgCenter[0] + " " + bgCenter[1]

      pointer.push el

    @moveToAngle = (angle) ->
      pointer.animate
        transform: "r" + angle + "," + bgCenter[0] + "," + bgCenter[1]
      , 0

    @animateToAngle = (angle) ->
      actualAngle = angle
      pointer.animate
        transform: "r" + angle + "," + bgCenter[0] + "," + bgCenter[1]
      , @animateMS, @animateEasing

    @move = (percent, animate) ->
      animate = (if not animate? then true else animate)
      if percent < 0
        percent = 0
      else percent = 100  if percent > 100
      angle = (percent * ((maxAngle - minAngle) / 100)) + minAngle
      if animate
        @animateToAngle angle
      else
        @moveToAngle angle

    @minAngle = (angle) ->
      minAngle = angle

    @maxAngle = (angle) ->
      maxAngle = angle

    this
) window.Raphael
