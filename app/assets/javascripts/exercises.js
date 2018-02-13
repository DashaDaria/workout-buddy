/////SHOW Next Exercise link on exercise show page////
$(function () {
  $(".js-nextE").on("click", function() {
    var nextId = parseInt($(".js-nextE").attr("data-id")) + 1;
    $.get("/exercises/" + nextId + ".json", function(data) {
      const newExc = new Exercise(data.name, data.length, data.how, data.category)

      newExc.formatName()
      newExc.formatLength()
      newExc.formatHow()
      newExc.formatCategory()

      $(".js-nextE").attr("data-id", data["id"]);
    });
  });
});

/////EXERCISES CONSTRUCTOR//////
class Exercise {
  constructor(name, length, how, category){
    this.name = name;
    this.length = length;
    this.how = how;
    this.category = category;
  }

  formatName() {
    $(".eName").text(this.name)
  }
  formatLength() {
    let sec = " seconds | "
    $(".length").text((this.length) + sec);
  }
  formatHow() {
    $(".how").text(this.how)
  }
  formatCategory() {
    $(".category").text(this.category)
  }

}
