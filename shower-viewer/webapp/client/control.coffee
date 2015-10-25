controlLockSize = ->
  $(window).off('resize').on 'resize', =>
    minDimension = if window.innerWidth < window.innerHeight then window.innerWidth else window.innerHeight
    val = minDimension / 14
    return @lock = new PatternLock '#pattern-lock', radius: val, margin: val unless @lock
    @lock.option 'radius', val
    @lock.option 'margin', val
  $(window).trigger 'resize'


Template.control.onRendered ->
  controlLockSize.call @
