Template.registerHelper 'loggedIn', ->
  Boolean Meteor.userId()


blink = ($element) ->
  $element.fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100)


Template.loginPage.onCreated -> @data.urlSpinner = new ReactiveVar false


Template.loginPage.events
  'click .js-btn-url': (event, template) ->
    $input = template.$ '.url-input'
    url = $input.val()
    return blink $input unless url
    template.data.urlSpinner.set true
    Meteor.call 'runPresentation', url, (error, result) ->
      template.data.urlSpinner.set false


Template.loginPage.helpers
  urlSpinner: -> @urlSpinner.get()
  