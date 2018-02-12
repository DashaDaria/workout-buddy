/////Next Exercise link on each show page////
$(function () {
  $(".js-nextE").on("click", function() {
    var nextId = parseInt($(".js-nextE").attr("data-id")) + 1;
    $.get("/exercises/" + nextId + ".json", function(data) {
      const newExc = new Exercise(data)
      //$(".eName").text(data["name"]);
      newExc.formatName()
      $(".length").text(data["length"]);
      $(".how").text(data["how"]);
      $(".category").text(data["category"]);

      $(".js-nextE").attr("data-id", data["id"]);
    });
  });
});

/////EXERCISES CONSTRUCTOR//////
class Exercise {
  constructor(name, category, length, reps, level, how){
    this.name = name;
    this.category = category;
    this.length = length;
    this.reps = reps;
    this.level = level;
    this.how = how;
  }

formatName() {
  $(".eName").text(this.name)
}

  render(){
    return new Exercise
  }
}
