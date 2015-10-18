Template.presentation.onRendered ->
  $iframe = @$ 'iframe'
  $iframe.height(window.innerHeight)
  $(window).off('resize').on 'resize', => $iframe.height(window.innerHeight)
  #  $(window).off('mousemove').on 'mousemove', (e) =>
  #    showSidebar() unless e.pageX
  $iframe.load =>
    Helpers.blink @$('.menu-pointer'), delay: 1000, hide: true, times: 3



window.addEventListener 'message', (event) -> console.log 'event:', event
