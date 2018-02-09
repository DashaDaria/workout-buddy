/////Next Exercise link on each show page////
$(function () {
  $(".js-nextE").on("click", function() {
    var nextId = parseInt($(".js-nextE").attr("data-id")) + 1;
    $.get("/exercises/" + nextId + ".json", function(data) {
      $(".eName").text(data["name"]);
      $(".length").text(data["length"]);
      $(".how").text(data["how"]);
      $(".category").text(data["category"]["name"]);

      $(".js-nextE").attr("data-id", data["id"]);
    });
  });
});
