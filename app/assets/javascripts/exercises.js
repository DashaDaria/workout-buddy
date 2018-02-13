/////SHOW Next Exercise link on exercise show page////
$(function () {
  $(".js-nextE").on("click", function() {
    var nextId = parseInt($(".js-nextE").attr("data-id")) + 1;
    $.get("/exercises/" + nextId + ".json", function(data) {
      const newExc = new Exercise(data.name, data.how, data.category, data.length)

      newExc.formatName()
      newExc.formatHow()
      newExc.formatCategory()
      newExc.formatLength()

      $(".js-nextE").attr("data-id", data["id"]);
    });
  });
});

/////EXERCISES CONSTRUCTOR//////
class Exercise {
  constructor(name, how, category, length){
    this.name = name;
    this.how = how;
    this.category = category;
    this.length = length;
  }

  formatName() {
    $(".eName").text(this.name)
  }
  formatHow() {
    $(".how").text(this.how)
  }
  formatCategory() {
    $(".category").text(this.category)
  }
  formatLength() {
    $(".length").text(this.length)
  }
}
