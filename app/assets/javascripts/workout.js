$(function () {
  $('form').submit(function(event){
    event.PreventDefault();
    alert("does not submit");
  });
});
