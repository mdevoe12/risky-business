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
    var textField = $(this).children(".new-input")
    var newInput = {
        body: textField.val()
    }
    var categoryId = $('.category_information').data('id');
    var inputType = $(this).children('.input-type').val();
    $.ajax({
      type:    "POST",
      url:     "/api/v1/categories/" + categoryId + "/" + inputType.toLowerCase(),
      data:    newInput,
      success: function(newInput) {
        $('#current-' + inputType.toLowerCase() + '-table').html('');
        textField.val('');
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

function renderRecentRisks(){
  var categoryId = $('.category_information').data('id');
  var categoryName = $('.category_information').data('name');
    $.ajax({
    type: "GET",
    url: "/api/v1/categories/" + categoryId + "/risk_responses",
    success: function(risks){
      $('#recent-risks-table').append('<h3 class="text-center">Recently Submitted Risks for ' + categoryName + '</h3>'
                                      + "<table class='table table-bordered'><tbody>"
                                      + generateRiskRows(risks)
                                      + "</tbody></table>")
    }
  })
}

function generateRiskRows(risks){
  var rows = ""
  $.each(risks, function(index, risk){
    rows += "<tr><td>" + risk["body"] + "</th></tr>"
  })
  return rows
}
