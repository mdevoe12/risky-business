const tableHeaders = "<thead><tr><th>Submission Date</th>"
                    + "<th>Worker</th><th>Task Type</th>"
                    + "<th>Quality Score</th><th>Risk Score Differential</th>"
                    + "<th></th></tr></thead>"

function renderFollowups(){
  if($('div').is('#followups-table')) {
    $.ajax({
    type: "GET",
    url: "/api/v1/supervisors/followups",
    success: function(flras){
      $('#followups-table').append('<table class="table">'
                                  + tableHeaders
                                  + '<tbody>'
                                  + followupRows(flras)
                                  + '</tbody></table>')
                      }
                    })
    }
}


function followupRows(flras){
  var rows = ""
  $.each(flras, function(index, flra){
    rows += "<tr class='unresolved-row'>"
          + "<td scope='row'><a href='/flras/" + flra["id"] + "'>" + flra["created_at"].substr(0, 10) + "</a></td>"
          + "<td scope='row'>" + flra["worker"]["first_name"] + " " + flra["worker"]["last_name"] + "</td>"
          + "<td scope='row'>" + flra["category"]["name"] + "</td>"
          + "<td scope='row'>" + flra["points"] + "</td>"
          + "<td scope='row'>" + flra["risk_differential"] + "</td>"
          + "<td scope='row' data-formid=" + flra["id"] + "><button type='button' name='button' class='btn btn-primary resolved-button'>Mark as Resolved</button></td>"
  })
  return rows
}
