$('#search').on 'change keyup', (e)->
  value = @value
  cls = @className
  objects = $(".#{cls}")
  objects.splice(objects.index($("#search")), 1)
  if not value or not value.match(/[a-z]|[A-Z]|[0-9]/)
    return objects.css 'display', 'block'
  objects.each (x)->
    if objects[x].innerText.toLowerCase().match value.toLowerCase()
      objects[x].style.display = 'block'
    else
      objects[x].style.display = 'none'
