Template.registerHelper 'loggedIn', ->
  Boolean Meteor.userId()


blink = ($element, ms=100) ->
  $element.fadeOut(ms).fadeIn(ms).fadeOut(ms).fadeIn(ms).fadeOut(ms).fadeIn(ms)


Template.loginPage.onCreated -> @data.urlSpinner = new ReactiveVar false


Template.loginPage.events
  'click .js-btn-url': (event, template) ->
    $input = template.$ '.url-input'
    url = $input.val()
    return blink $input unless url
    template.data.urlSpinner.set true
    Meteor.call 'runPresentation', url, (error, result) ->
      template.data.urlSpinner.set false
      if error
        console.error error
        return $.growl.error({ message: "Something went wrong" });
      FlowRouter.go '/presentation/' + result



  'click .js-btn-pin-code': (event, template) ->
    $input = template.$ '.pin-code-input'
    url = $input.val()
    return blink $input unless url



Template.loginPage.helpers
  urlSpinner: -> @urlSpinner.get()



Template.presentation.onRendered ->
  $iframe = @$ 'iframe'
  $iframe.height(window.innerHeight)
  $(window).off('resize').on 'resize', => $iframe.height(window.innerHeight)
  $(window).off('mousemove').on 'mousemove', (e) =>
    showSidebar() unless e.pageX
#  $iframe.load =>
#    blink @$('.menu-pointer'), 1000
#    .fadeOut 1000



window.addEventListener 'message', (event) -> console.log 'event:', event
