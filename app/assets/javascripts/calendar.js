$(document).ready(function(){
  $(".fc-event-inner").click(function(){
    $this = $(this)
    class_array = $this.parent().attr("class").split(" ")
    var name = $($this.children()).text()
    //Returns and array of the classes inherited in the div, id var digs the "correct" id, i.e. the one from the database out of the class
    var id = class_array[class_array.length - 2]
    $(".swap_tournaments").tokenInput("add", {id: id, name: name});

  });
})


