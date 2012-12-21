$(function(){
  $(".dashboard-info div").on("click", function(){
      $(".dashboard-info div").slideToggle(300);
      var newClass = $(this).attr("class").split(" ")[1]
      console.log(newClass)
      $(".dash-details."+newClass).attr("style", "display:block")
      $(".dash-details."+newClass).slideToggle
      console.log("else block ran")
  });
  $(".dash-titles").on("click", function(){
    $(this).slideToggle
    $(".dashboard-info div").slideToggle();
    $(".dash-details").attr("style", "display:none")
  })
});



// $(function(){
//   $(".dash-details").slideOut()
  
//   $(".dashboard-info div").on("click", function(){
//     $(".dashboard-info").slideOut("horizontal");
//     var newClass = $(this).attr("class").split(" ")[1]
//     $(".dash-details."+newClass).attr("style", "display:block")
//     $(".dash-details."+newClass).slideIn()

//   });

//   $(".hero-unit.non-index").on("click", function(){
    
//   })
// });