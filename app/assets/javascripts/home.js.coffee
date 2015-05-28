# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#home_image_id').on 'change', (e)->
  images = $('[data-images-json]').data('images-json')
  $('#image_preview').attr('src', images[@value])
