$(document).ready(){
  renderCurrentInputs(risks)
}

function renderCurrentInputs(inputType){
  $.ajax({
  type: "GET",
  url:
  })
  .then(function(inputs){
    $('#current-' + inputType + '-table').append()
  })
  .catch(function(error){
    console.error(error)
  })
}
