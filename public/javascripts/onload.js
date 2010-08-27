function sortable_project_table(){
  $("#projects").dataTable({
      "aoColumns": [
        null,
        null,
        null,
        null,
        { "sType": "task"},
        { "sType": "task"},
        { "sType": "task"},
        { "sType": "task"},
        { "sType": "task"}
      ]
  });
}

function clickable_tasks(){
  $("td.task").each(function(){$(this).fixClick(function() {
      var id = $(this).attr("data-id");
      var backgroundClass = $.ajax({
        type: "GET",
        url: "/tasks/next?id="+id,
        async: false
      }).responseText;
      if( backgroundClass == "!ready") {
        location.reload();
        return;
      }
      $(this).addClass(backgroundClass);
  }, function(){;});
});
}

function jeditable_tasks(){
  $("td.task").each(function(){
      var id = $(this).attr("data-id");
       $(this).editable('/tasks/comment?id='+id,  { 
       indicator: 'Päivitetään ...',
       tooltip: '',
       cssclass: 'editing-task',
       placeholder: '',
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
