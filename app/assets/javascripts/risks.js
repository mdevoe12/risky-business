function renderCurrentInputs(inputType){
  var categoryId = $('.category_information').data('id');
  var categoryName = $('.category_information').data('name');
    $.ajax({
    type: "GET",
    url: "/api/v1/categories/" + categoryId + "/risks",
    success: function(inputs){
      $("#current-risks-table").append('<h3 class="text-center">Form Inputs for ' + categoryName + ' Risks</h3>'
                        + "<table class='table table-bordered'><tbody>"
                        + generateInputRows(inputs)
                        + "</tbody></table>")
    }
  })
}

function generateInputRows(inputs){
  var rows = ""
  $.each(inputs, function(index, input){
    rows += "<tr><td>" + input["body"] + "</th></tr>"
  })
  return rows
}
