FlowRouter.route '/',
  action: ->
    BlazeLayout.render 'loginPage'



FlowRouter.route '/presentation/:presentationId',
  subscriptions: (params, queryParams) ->
    @register 'presentation', Meteor.subscribe 'presentation', presentationId: params.presentationId


  action: (params, queryParams) ->
    @waitComputation = Tracker.autorun ->
      return BlazeLayout.render 'wait' unless Presentations.findOne params.presentationId, pendingAction: 0
      BlazeLayout.render 'presentation'


  triggersExit: [
    (data) -> data.route.waitComputation.stop()
    (data) -> $('.modal-backdrop').remove()
  ]



FlowRouter.route '/control/:pinCode',
  subscriptions: (params, queryParams) ->
    @register 'presentation', Meteor.subscribe 'presentation', pinCode: params.pinCode


  action: (params, queryParams) ->
    @waitComputation = Tracker.autorun ->
      return BlazeLayout.render 'wait' unless Presentations.findOne {pinCode: params.pinCode}, pendingAction: 0
      BlazeLayout.render 'control'


  triggersExit: [
    (data) -> data.route.waitComputation.stop()
  ]
