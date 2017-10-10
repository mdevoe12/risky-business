$(document).ready(function() {
  displayNotes()
  addNotes()
})

function displayNotes(){
  var flraId = $("#flra-id").val()
  $.ajax({
    type:    "GET",
    url: '/api/v1/supervisors/flra/' + flraId,
    success: function(flra) {
      $("#note-text").remove()
      $("#flra-notes").append("<span id='note-text'>" + flra["notes"] + "</span>")
    },
    error: function(error) {
      console.error(error)
    }
  })
  $("#flra-notes").show()
}

function addNotes(){
  $("#add-notes").on("click", function() {
    $("#flra-notes").hide()
    $("#add-notes").hide()
    $("#add-flra-notes").removeClass("hidden")
    submitNotes()
  })
}

function submitNotes(){
  $("#submit-note").on("click", function(e) {
    var flraId = $("#flra-id").val()
    var noteParams = {notes: $("#note-body").val()}
    $.ajax({
      type:    "PUT",
      url: '/api/v1/supervisors/flras/' + flraId,
      data:    noteParams,
      success: function(newComment) {
        displayNotes()
        $("#add-notes").show()
        $("#add-flra-notes").addClass("hidden")
      },
      error: function(error) {
        console.error(error)
      }
    })
  })
}
