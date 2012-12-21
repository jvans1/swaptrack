$(function(){
  $(".swap_receivers").tokenInput("users.json", {
    crossDomain:false,
    theme: "facebook",
    preventDuplicates: true
  });

  $(".swap_tournaments").tokenInput("tournaments.json", {
    crossDomain:false,
    theme: "facebook",
    preventDuplicates: true
  });
})

