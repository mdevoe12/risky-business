function resolvedListener() {
  $('.resolved-button').on('click', function(event) {

    event.preventDefault();
    let $button = $(event.target);
    let $tableRow = $button.parent().parent()
    let id = $button.parent().data().formid;
    return $.ajax({
      method: 'PUT',
      url: `/api/v1/flras/${id}`,
      data: {flra: {follow_up_status: 'resolved'}},
      success: function(data) {
        $tableRow.slideUp(300)
        if (document.URL.includes('worker')) {
          updateCounts()
        } else {
          updateSuperCounts()
        }
      }
    })
  })
}
