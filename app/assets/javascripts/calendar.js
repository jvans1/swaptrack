$(document).ready(function(){
  $(".fc-event-inner").click(function(){
    $("#swap_tournaments").tokenInput("add", {id: 1, name: "Main Event"});
  });
})

$(".active-tourneys").click(function(){
    console.log(this)
}); 
