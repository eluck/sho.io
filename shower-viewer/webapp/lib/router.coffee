FlowRouter.route '/',
  action: ->
    BlazeLayout.render 'loginPage'


FlowRouter.route '/presentation/:presentationId',
  subscriptions: (params, queryParams) ->
    @register 'presentation', Meteor.subscribe 'presentation', params.presentationId


  action: ->
    BlazeLayout.render 'presentation'
    