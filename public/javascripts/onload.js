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
      if( background == "!ready") {
        location.reload();
        return;
      }
      $(this).css("background-color", background);
  });
}
$(document).ready(function() {
    sortable_project_table();
    clickable_tasks();
});
