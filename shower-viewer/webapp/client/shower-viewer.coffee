Template.registerHelper 'loggedIn', ->
  Boolean Meteor.userId()


Template.loginPage.events
  'click .js-button-login': _.debounce ((e) ->
    e.stopPropagation()
    $('#login-dropdown-list a').click()
  ), 100, true
