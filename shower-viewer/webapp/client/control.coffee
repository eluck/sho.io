Template.control.onRendered ->
  element = document.getElementById 'pattern-lock'
  @hammer = new Hammer element
  @hammer.on "panleft panright tap press", (ev) ->
    element.textContent = ev.type + " gesture detected"
