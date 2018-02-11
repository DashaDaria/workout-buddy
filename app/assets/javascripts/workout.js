////CREATE NEW WORKOUT/////
$(function () {
  $('form.add_exercise').submit(function(event){
    event.preventDefault();
    var workout_id = $(this).data("workout");
    var values = $(this).serialize();
    var posting = $.post("/workouts/" + workout_id + "/exercises", values);

    posting.done(function(response){
      exerciseRowHTML = HandlebarsTemplates['exercise_row']({
        exercise: response
      });
      $("#js-exercisesTable tr:last").after(exerciseRowHTML);
    });
  });
});


////jQUERY FOR MORE TEXT FOR EXERCISE INSTRUCTIONS (HOW)////
$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/exercises/" + id + ".json", function(data) {
      $("#body-" + id).html(data["how"])
    });
  });
});

////jQUERY FOR NEXT WORKOUT LINK////
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/workouts/" + nextId + ".json", function(data) {
      $(".wName").text(data["name"]);

        $(".eName").text(data["exercises"]["name"]);
        $(".category").text(data["exercises"]["category"]);
        $(".level").text(data["exercises"]["level"]);
        $(".length").text(data["exercises"]["length"]);
        $(".reps").text(data["exercises"]["reps"]);
        $(".how").text(data["exercises"]["how"]);

      $(".js-next").attr("data-id", data["id"]);
    });
  });
});

/////SHOW FORM////
$(function(){
  $("#showForm").on("click",function(){
    $(".add_exercise").toggle();
  })
})
