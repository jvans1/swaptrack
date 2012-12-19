//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



//only show swaps when clicking on the swap tab
$(function(){
  $(".swaps-tab").click(function(){
    $(".Prop").hide()
    $(".Lastlonger").hide()
    $(".Piece").hide()
  })
})

//show everything when clicking on the all-active tab

$(function(){
  $(".all-active").click(function(){
    $(".Prop").show()
    $(".Lastlonger").show()
    $(".Piece").show()
    $(".Swap").show()

  })
})


$(function(){
  $(".swap").click(function(){
    $(".dashboard-info").slideOut("horizontal", 250);
    $(".swap-list").show()
  })
})

// $(function(){
//   $(".")
// })