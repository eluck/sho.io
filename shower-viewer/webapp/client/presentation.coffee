setupIframeSizing = ($iframe) ->
  $iframe.height(window.innerHeight)
  $(window).off('resize').on 'resize', => $iframe.height window.innerHeight


showPresentationInfoPopup = ->
  $popup = $ '#presentationInfoPopup'
  return $popup.modal 'show' if $popup.length
  Blaze.renderWithData Template.presentationInfoPopup, Presentations.findOne(), document.body
  $popup = $ '#presentationInfoPopup'
  $popup.modal().modal 'show'



Template.presentation.onRendered ->
  $iframe = @$ 'iframe'
  setupIframeSizing $iframe
  $iframe.load => showPresentationInfoPopup()



Template.presentationInfoPopup.onRendered ->
  $text = @$("input:text").get(0)
  length = $text.value.length
  console.log 'length:', length
  $text.selectionStart = 0
  $text.selectionEnd = length
  $text.focus()



Template.presentationInfoPopup.helpers
  baseUrl: -> Meteor.absoluteUrl()



window.addEventListener 'message', (event) -> console.log 'event:', event
