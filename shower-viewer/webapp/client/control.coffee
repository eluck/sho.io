Template.control.onRendered ->
  element = document.getElementById 'pattern-lock'
  presentation = Presentations.findOne()

  @hammer = new Hammer element
  @hammer.get('pinch').set enable: true
  @hammer.get('swipe').set velocity: 0.2
  @hammer.on "swipeleft", (ev) ->
    window.navigator?.vibrate? [30]
    Meteor.call 'go', presentation.pinCode, name: 'next'
  @hammer.on "swiperight", (ev) ->
    window.navigator?.vibrate? [30, 10, 30]
    Meteor.call 'go', presentation.pinCode, name: 'prev'
  @hammer.on "pinchin", (ev) ->
    if ev.eventType == 4
      window.navigator?.vibrate? [30, 10, 30]
      Meteor.call 'go', presentation.pinCode, name: 'zoomOut'
  @hammer.on "pinchout", (ev) ->
    if ev.eventType == 4
      window.navigator?.vibrate? [30]
      Meteor.call 'go', presentation.pinCode, name: 'zoomIn'

  window.navigator?.vibrate? [30]

