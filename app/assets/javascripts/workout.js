////ADD AN EXERCISE TO AN EXISTING WORKOUT/////
$(function () {
  $('form.add_exercise').submit(function(event){
    event.preventDefault();
    var workout_id = $(this).data("workout");
    var values = $(this).serialize();
    var posting = $.post("/workouts/" + workout_id + "/exercises", values);

    posting.done(function(data){
      var exercise = data
      var trHTML = '';
      trHTML +=
      `<tr>
      <td><a href="/exercises/${exercise.id}">${exercise.name}</a></td>
      <td>${exercise.category}</td>
      <td>${exercise.level}</td>
      <td>${exercise.length}</td>
      <td>${exercise.reps}</td>
      <td>${exercise.how}</td>
      </tr>`
      $('#js-exercisesTable tr:last').after(trHTML);
      $(".add_exercise").toggle();
      });
    });
  });

////SHOW MORE TEXT FOR EXERCISE INSTRUCTIONS (HOW)////
$(function () {
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    $.get("/exercises/" + id + ".json", function(data) {
      $("#body-" + id).html(data["how"])
    });
  });
});

////LINK TO SHOW NEXT WORKOUT////
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/workouts/" + nextId + ".json", function(data) {
      $(".wName").text(data["name"]);
      for(let i = 0; i < data["exercises"].length; i++){
        $(`.eName-${i}`).text(data["exercises"][i].name);
        $(`.category-${i}`).text(data["exercises"][i].category);
        $(`.level-${i}`).text(data["exercises"][i].level);
        $(`.length-${i}`).text(data["exercises"][i].length);
        $(`.reps-${i}`).text(data["exercises"][i].reps);
        $(`.how-${i}`).text(data["exercises"][i].how);
      };
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
