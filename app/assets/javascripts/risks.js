$(document).ready(function(){
  console.log("hi")
  renderCurrentInputs("risks")
})

function renderCurrentInputs(inputType){
  var categoryId = $('.category_information').data('id')
  $.ajax({
  type: "GET",
  url: "/api/v1/categories/" + categoryId + "/risks"
  })
  .then(function(inputs){
    console.log("yay")
    // $('#current-' + inputType + '-table').append()
  })
  .catch(function(error){
    console.error(error)
  })
}
