function renderCurrentInputs(inputType){
  var categoryId = $('.category_information').data('id');
  var categoryName = $('.category_information').data('name');
    $.ajax({
    type: "GET",
    url: "/api/v1/categories/" + categoryId + "/" + inputType.toLowerCase(),
    success: function(inputs){
      $("#current-risks-table").append('<h3 class="text-center">Form Inputs for ' + categoryName + ' ' + inputType + '</h3>'
                        + "<table class='table table-bordered'><tbody>"
                        + generateInputRows(inputs)
                        + "</tbody></table>")
    }
  })
}

function addInput() {
  $("#add-input").on("click", function() {
    var newInput = {
        body: $("#new-input").val()
    }
    var categoryId = $('.category_information').data('id');
    var inputType = $('.input-type').val();

    $.ajax({
      type:    "POST",
      url:     "/api/v1/categories/" + categoryId + "/" + inputType,
      data:    newInput,
      success: function(newInput) {
        $('#current-' + inputType + '-table').html('');
        $("#new-input").val('');
        renderCurrentInputs(inputType)
      },
      error: function(xhr) {
        console.log(xhr.responseText)
      }
    })
  })
}

function generateInputRows(inputs){
  var rows = ""
  $.each(inputs, function(index, input){
    rows += "<tr><td>" + input["body"] + "</th></tr>"
  })
  return rows
}
