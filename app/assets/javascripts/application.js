// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.

//= require jquery
//= require jquery_ujs
//= require fullcalendar
//= require fullcalendar.min
//= require gcal
//= require bootstrap
//= require bootstrap.min
//= require jquery-ui-1.8.23.custom.min
//= require tournaments
//= require calendar
//= require users
//= require jquery.slideinout-0.1
//= require recuests
//= require jquery.tokeninput
//= require_self


$("#swap_receivers").tokenInput("users.json", {
  crossDomain:false,
  theme: "facebook"
});

$("#swap_tournaments").tokenInput("tournaments.json", {
  crossDomain:false,
  theme: "facebook"
});

// $(function(){
//   $("#tabs").tabs();  
// })
