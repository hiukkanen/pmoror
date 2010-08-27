function getSortAttribute(element) {
  return $('<div>'+element+'</div>').find("span:last").attr("data-code");
}
function sort(direction, a, b) {
  x = getSortAttribute(a);
  y = getSortAttribute(b);
  return ((x < y) ? direction : ((x > y) ?  1 : 0));
}
jQuery.fn.dataTableExt.oSort['task-asc']  = function(a,b) {
  return sort(-1, a, b);
};

jQuery.fn.dataTableExt.oSort['task-desc'] = function(a,b) {
  return sort(1, a, b);
};
