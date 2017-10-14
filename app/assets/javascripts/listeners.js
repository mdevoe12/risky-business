function setListeners() {
  resolvedListener();
  scoreListener();
  slideListener();
}

var slideListener = function() {
  $('.slider').change(function() {
    $(this).next().text($(this)[0].value);
  })
};

var scoreListener = function () {
  $('.score-button').click(function(event) {
    event.preventDefault();
    var id = $(this).parent().data().id;
    var score = $(this).siblings('div.slidecontainer').children('input.slider.score-slider')[0].value;
    var button = $(this);
    var riskScore = $(this).siblings('div.slidecontainer').children('input.slider.risk-slider')[0].value;
    updateScore(id, score, button, riskScore);
  })
};

function resolvedListener() {
  $('#followups-table').on('click', function(event) {

    event.preventDefault();
    var $button = $(event.target);
    var $tableRow = $button.parent().parent()
    var id = $button.parent().data().formid;
    return $.ajax({
      method: 'PUT',
      url: "/api/v1/flras/" + id,
      data: {flra: {follow_up_status: 'resolved'}},
      success: function(data) {
        $tableRow.slideUp(300)
        if (document.URL.includes('worker')) {
          updateCounts()
        } else {
          updateSuperCounts()
        }
      }
    })
  })
}
