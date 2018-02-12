////USER'S WORKOUT INDEX PAGE///
$(function(){
  $("a.js-showWorkouts").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(data){
      debugger
      console.log(data);
    });
      e.preventDefault();
  })
})
