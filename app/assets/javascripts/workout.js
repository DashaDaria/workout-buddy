$(function () {
  $('form.create_workout').submit(function(event){
    event.preventDefault();
    event.stopPropagation();
    alert("does not submit");
  });
});
