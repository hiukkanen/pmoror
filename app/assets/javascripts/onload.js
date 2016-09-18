function sortable_project_table(){
  $("#projects").each(function(index, element) {
      columns = [
        null
      ];
      tasks = $(element).attr('data-tasks');
      tasks = parseInt(tasks);
      for(var i = 0; i < tasks; i += 1) {
        columns.push({ "sType": "task"});
      }
      $(element).dataTable({
        "bPaginate": false,
        "bInfo": false,
        "aoColumns": columns
        })
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

function addJeditable(element, url, custom_event) {
  element.editable(url,  { 
      indicator: 'Päivitetään ...',
      tooltip: '',
      cssclass: 'editing-task',
      placeholder: '',
      width: '',
      height: '',
      event: custom_event,
      onblur: 'submit',
      callback: function() { location.reload(); }
  });
};

function jeditable_fields(selector){
  $(selector).each(function(){
      var id = $(this).attr("data-id");
      var url = $(this).attr("data-url");
      url += '?id=' + id;
      addJeditable($(this), url, 'dblclick');
  }); 
}
function jeditable_tasks(selector){
  $(selector).each(function(){
      var id = $(this).attr("data-id");
      var url = '/tasks/comment?id='+id;
      addJeditable($(this), url, 'click');
  }); 
}

$(document).ready(function() {
	  console.log('uliu');
    sortable_project_table();
    clickable_tasks(".colorChanger");
    jeditable_tasks(".comment");
    jeditable_fields('td.input');
});
