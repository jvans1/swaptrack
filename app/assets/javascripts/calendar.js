$(document).ready(function(){
  $(".fc-event-inner").click(function(){
    console.log($(this).attr("class"))
    $(".swap_tournaments").tokenInput("add", {id: 1, name: "Main Event"});
  });
})


