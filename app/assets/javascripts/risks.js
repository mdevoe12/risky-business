function renderCurrentInputs(inputType){
  var categoryId = $('.category_information').data('id');
  $.ajax({
  type: "GET",
  url: "/api/v1/categories/" + categoryId + "/risks",
  success: function(inputs){


  }
})
}
