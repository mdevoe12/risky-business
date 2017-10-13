$(document).ready(function() {
  addNotes()
})

function displayNotes(flraId, $button){
  var $notes = $button.parent().siblings('.flra-notes')
  $.ajax({
    type:    "GET",
    url: '/api/v1/supervisors/flra/' + flraId,
    success: function(flra) {
      debugger
      $notes.children('.note-text').remove()
      $notes.append("<span class='note-text'>" + flra["notes"] + "</span>")
    },
    error: function(error) {
      console.error(error)
    }
  })
  $notes.show()
}

function addNotes(){
  $(".add-notes").on("click", function() {
    $(this).siblings(".flra-notes").hide()
    $(this).hide()
    $(this).siblings(".add-flra-notes").removeClass("hidden")
    submitNotes()
  })
}

function submitNotes(){
  $(".submit-note").on("click", function(e) {
    var $button = $(this)
    var flraId = $button.siblings(".flra-id").val()
    var noteParams = {notes: $button.siblings('#note-body').val()}
    $.ajax({
      type:    "PUT",
      url: '/api/v1/supervisors/flras/' + flraId,
      data:    noteParams,
      success: function(newComment) {
        displayNotes(flraId, $button)
        $(".add-notes").show()
        $(".add-flra-notes").addClass("hidden")
      },
      error: function(error) {
        console.error(error)
      }
    })
  })
}
