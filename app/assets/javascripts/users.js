////USER'S WORKOUT INDEX PAGE///
$(function(){
  $("a.js-showWorkouts").on("click", function(e){
    e.preventDefault();

    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(data){
      var workoutsTableHTML = HandlebarsTemplates['workouts_table']({
        workouts: data
      });
      $("#js-workoutsTable").html(workoutsTableHTML)
    })
  })
})
