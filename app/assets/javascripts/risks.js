function renderCurrentInputs(inputType){
    var categoryId = $('.category_information').data('id');
    $.ajax({
    type: "GET",
    url: "/api/v1/categories/" + categoryId + "/risks",
    success: function(inputs){
      $("#current-risks-table").append('<h3 class="text-center">' + "Electric" + '</h3>'
                        + "<table class='table table-bordered'><thead>"
                        + "<tr><th>Name</th></tr></thead><tbody>"
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
