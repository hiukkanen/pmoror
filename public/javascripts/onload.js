function sortable_project_table(){
  $("#projects").tablesorter();
}

function clickable_tasks(){
  $("td.task").each(function(){$(this).fixClick(function() {
      var id = $(this).attr("data-id");
      var background = $.ajax({
        type: "GET",
        url: "/tasks/next?id="+id,
        async: false
      }).responseText;
      if( background == "!ready") {
        location.reload();
        return;
      }
      $(this).css("background-color", background);
  }, function(){$(this).html('');});
});
}

function jeditable_tasks(){
  $("td.task").each(function(){
      var id = $(this).attr("data-id");
       $(this).editable('/tasks/comment?id='+id,  { 
       indicator: 'Päivitetään ...',
       tooltip: '',
       cssclass: 'editing-task',
       placeholder: 'Tuplaklikkaa editoitavaksi',
       width: '',
       height: '',
       event: 'dblclick'
  });
      }); 
}

$(document).ready(function() {
    sortable_project_table();
    clickable_tasks();
    jeditable_tasks();
});
