getRandomPinCode = ->
  (Random.choice '0123456789' for [1..6]).join ''



Meteor.methods
  addPresentation: (url) ->
    check url, String
    pinCode = getRandomPinCode() while Presentations.findOne pinCode: pinCode
    Presentations.insert url: url, pinCode: pinCode



  go: (pinCode, action) ->
    console.log 'go pinCode:', pinCode, 'action:', action
    check pinCode, String
    check action, Object

    presentation = Presentations.findOne pinCode: pinCode
    throw new Meteor.Error 'Presentation not found' unless presentation

    if action.name in ['next', 'prev', 'zoomIn', 'zoomOut']
      return Presentations.update presentation._id, $set: pendingAction: action.name

#    if action.name == 'go'
#      modifier = {}
#      if action.view
#        check action.view, String
#        modifier.view = action.view
#      if action.slideNumber
#        return check action.view, Match.Integer
#        modifier.slideNumber = action.slideNumber
#      throw new Meteor.Error 'Go requires "view" and/or "slideNumber" paramters' unless _.keys(modifier).length
#      return Presentations.update presentation._id, $set: modifier


  clearPendingAction: (pinCode) ->
    check pinCode, String
    Presentations.update {pinCode: pinCode}, $set: pendingAction: ''
