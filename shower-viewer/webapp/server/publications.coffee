Meteor.publish 'presentation', (selector) ->
  return Presentations.find selector.presentationId if selector.presentationId
  return Presentations.find pinCode: selector.pinCode if selector.pinCode

