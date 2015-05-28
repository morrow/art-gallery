$('#visit_image_id').on 'change', (e)->
  images = $('[data-images-json]').data('images-json')
  $('#image_preview').attr('src', images[@value])
