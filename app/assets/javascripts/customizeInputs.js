function renderCurrentInputs(inputType){
  var categoryId = $('.category_information').data('id');
  var categoryName = $('.category_information').data('name');
    $.ajax({
    type: "GET",
    url: "/api/v1/categories/" + categoryId + "/" + inputType.toLowerCase(),
    success: function(inputs){
      $('#current-' + inputType.toLowerCase() + '-table').append('<h3 class="text-center">Form Inputs for ' + categoryName + ' ' + inputType + '</h3>'
                        + "<table class='table table-bordered'><tbody>"
                        + generateInputRows(inputs)
                        + "</tbody></table>")
    }
  })
}

function addInput() {
  $(".input-form").on("submit", function(e) {
    e.preventDefault();
    var newInput = {
        body: $(this).children("#new-input").val()
    }
    var categoryId = $('.category_information').data('id');
    var inputType = $(this).children('.input-type').val();
    console.log(newInput)
    console.log(inputType)
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
