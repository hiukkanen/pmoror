function sortable_project_table(){
  $("#projects").tablesorter();
}
function clickable_tasks(){
  $("td.task").click(function() {
      var id = $(this).attr("data-id");
      var background = $.ajax({
        type: "GET",
        url: "/tasks/next?id="+id,
        async: false
      }).responseText;
      $(this).css("background-color", "red");
  });
}
$(document).ready(function() {
    sortable_project_table();
    clickable_tasks();
});
