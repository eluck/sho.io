getRandomPinCode = ->
  (Random.choice '0123456789' for [1..6]).join ''



Meteor.methods
  addPresentation: (url) ->
    check url, String
    console.log 'addPresentation url:', url
    pinCode = getRandomPinCode() while Presentations.findOne pinCode: pinCode
    Presentations.insert url: url, pinCode: pinCode



  go: (pinCode, action) ->
    check pinCode, String
    check action, Object
    console.log 'go pinCode:', pinCode, 'action:', action
    presentation = Presentations.findOne pinCode: pinCode
    throw new Meteor.Error 'Presentation not found' unless presentation

    if action.name in ['next', 'prev', 'zoomIn', 'zoomOut']
      return Presentations.update presentation._id, $set: pendingAction: action.name



  clearPendingAction: (pinCode) ->
    check pinCode, String
    console.log 'clearPendingAction pinCode:', pinCode
    Presentations.update {pinCode: pinCode}, $set: pendingAction: ''
