# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#exhibit_image_id').live 'change', (e)->
  images = $('[data-images-json]').data('images-json')
  $('#image_preview').attr('src', images[@value])