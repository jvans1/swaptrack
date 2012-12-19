//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

  

 $(document).ready(function() {

  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();
  
  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    editable: true,
    events: [
      {
        className: "5",
        title: 'Seniors',
        start: new Date(y, m, 1)
      },
      {
        className: "1 Main event",
        title: 'Main event',
        start: new Date(y, m, d-5),
        end: new Date(y, m, d-2)
      },
      {
        className: "5",
        title: 'Nightly 100',
        start: new Date(y, m, d-3, 16, 0),
        allDay: false
      },
      {
        className: "6",
        title: 'Satellite',
        start: new Date(y, m, d+4, 16, 0),
        allDay: false
      },
      {
        className: "3",
        title: '2500 HA',
        start: new Date(y, m, d, 10, 30),
        allDay: false
      },
      {
        className: "7",
        title: '2500 6max',
        start: new Date(y, m, d, 12, 0),
        end: new Date(y, m, d, 14, 0),
        allDay: false
      },
      {
        className: "8",
        title: '4max',
        start: new Date(y, m, d+1, 19, 0),
        end: new Date(y, m, d+1, 22, 30),
        allDay: false
      },
      {
        className: "9",
        title: '1k Turbo',
        start: new Date(y, m, 28),
        end: new Date(y, m, 29),
        url: 'http://google.com/'
      }
    ]

  });  

});
