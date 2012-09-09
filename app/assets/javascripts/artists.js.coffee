# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#artist_image_id').live 'change', (e)->
  images = $('[data-images-json]').data('images-json')
  $('#image_preview').attr('src', images[@value])

$('#search').live 'change keyup', (e)->
  value = @value
  cls = @className
  objects = $(".#{cls}")
  console.log objects
  objects.splice(objects.index($("#search")), 1)
  console.log objects
  if not value or not value.match(/[a-z]|[A-Z]|[0-9]/)
    return objects.css 'display', 'block'
  objects.each (x)->
    if objects[x].innerText.toLowerCase().match value.toLowerCase()
      objects[x].style.display = 'block'
    else
      objects[x].style.display = 'none'