FlowRouter.route '/',
  action: ->
    BlazeLayout.render 'loginPage'



FlowRouter.route '/presentation/:presentationId',
  subscriptions: (params, queryParams) ->
    @register 'presentation', Meteor.subscribe 'presentation', presentationId: params.presentationId


  action: (params, queryParams) ->
    Tracker.autorun ->
      return BlazeLayout.render 'wait' unless Presentations.findOne params.presentationId
      BlazeLayout.render 'presentation'



FlowRouter.route '/control/:pinCode',
  subscriptions: (params, queryParams) ->
    @register 'presentation', Meteor.subscribe 'presentation', pinCode: params.pinCode


  action: (params, queryParams) ->
    Tracker.autorun ->
      return BlazeLayout.render 'wait' unless Presentations.findOne pinCode: params.pinCode
      BlazeLayout.render 'control'
