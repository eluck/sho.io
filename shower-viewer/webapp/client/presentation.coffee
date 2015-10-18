setupIframeSizing = ($iframe) ->
  $iframe.height(window.innerHeight)
  $(window).off('resize').on 'resize', => $iframe.height window.innerHeight


showPresentationInfoPopup = ->
  $popup = $ '#presentationInfoPopup'
  return $popup.modal 'show' if $popup.length
  Blaze.renderWithData Template.presentationInfoPopup, {}, document.body
  $popup = $ '#presentationInfoPopup'
  $popup.modal().modal 'show'



Template.presentation.onRendered ->
  $iframe = @$ 'iframe'
  setupIframeSizing $iframe
  $iframe.load => showPresentationInfoPopup()



window.addEventListener 'message', (event) -> console.log 'event:', event
