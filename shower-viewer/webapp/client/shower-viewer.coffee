Template.registerHelper 'loggedIn', ->
  Boolean Meteor.userId()


Template.loginPage.events
  'click .js-button-login': _.debounce ((e) ->
    e.stopPropagation()
    $('#login-dropdown-list a.dropdown-toggle').click()
  ), 100, true



Template.mainPage.onRendered ->
  @$('.presentations-list').isotope
    itemSelector: '.presentation-preview'



Template.mainPage.helpers
  presentations: ->
    Presentations.find()