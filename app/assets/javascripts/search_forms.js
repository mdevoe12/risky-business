function searchToggleListener() {
  $('.form-header').on('click', function() {
    debugger
    $(this).next().slideToggle('slow')
  })
}
