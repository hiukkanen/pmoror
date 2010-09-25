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

function clickable_tasks(selector){
  $(selector).click(
      function() {
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
        p = $(this).parents("td.task");
        p.attr("class", "");
        p.addClass(backgroundClass);
        p.addClass("task");
      }  
  );
}

function jeditable_fields(selector){
  $(selector).each(function(){
      var id = $(this).attr("data-id");
      var url = $(this).attr("data-url");
       $(this).editable(url + '?id=' + id,  { 
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
function jeditable_tasks(selector){
  $(selector).each(function(){
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
    clickable_tasks(".colorChanger");
    jeditable_tasks(".comment");
    jeditable_fields('td.input');
});
