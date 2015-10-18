Meteor.methods
  runPresentation: (url) ->
    check url, String
    Presentations.insert url: url
