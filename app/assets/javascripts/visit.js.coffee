

$('#visit_image_id').live 'change', (e)->
  images = $('[data-images-json]').data('images-json')
  $('#image_preview').attr('src', images[@value])