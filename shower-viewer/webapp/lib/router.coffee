FlowRouter.route '/',
  action: ->
    BlazeLayout.render 'loginPage'


FlowRouter.route '/presentation/:presentationId',
  subscriptions: (params, queryParams) ->
    @register 'presentation', Meteor.subscribe 'presentation', params.presentationId


  action: (params, queryParams) ->
    Tracker.autorun ->
      return BlazeLayout.render 'wait' unless Presentations.findOne params.presentationId
      BlazeLayout.render 'presentation'
    