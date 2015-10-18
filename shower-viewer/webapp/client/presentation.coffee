setupIframeSizing = ($iframe) ->
  $iframe.height(window.innerHeight)
  $(window).off('resize').on 'resize', => $iframe.height window.innerHeight


showWhereSidebarIs = ($sidebar, $menuPointer) ->
  $sidebar.trigger 'sidebar:open'
  setTimeout =>
    $sidebar.trigger 'sidebar:close', {speed: 500}
    setTimeout =>
      $menuPointer.fadeOut duration: 10, complete: ->
        $menuPointer = $menuPointer.removeClass('invisible').fadeIn 500
        Helpers.blink $menuPointer, delay: 500, hide: true, times: 3
    , 600
  , 1000



Template.presentation.onRendered ->
  $iframe = @$ 'iframe'
  $sidebar = @$('.sidebar').sidebar()
  $menuPointer = @$ '.menu-pointer'
  setupIframeSizing $iframe
  $iframe.load => showWhereSidebarIs $sidebar, $menuPointer

#  $(window).off('mousemove').on 'mousemove', (e) =>
#    $sidebar.trigger "sidebar:open" unless e.pageX
#  $iframe.load =>
#    Helpers.blink @$('.menu-pointer'), delay: 1000, hide: true, times: 3




window.addEventListener 'message', (event) -> console.log 'event:', event
