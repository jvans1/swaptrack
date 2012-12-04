//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

    switcher_div = $('#color-switcher');
    switcher_control = $('#color-switcher-control');
    switcher_is_transitioning = false;
    
    switcher_div_style = {
      'width': switcher_control.children('a:first').width(),
      'z-index': 2,
      'top': '+=78px',
      'left': '-=5px'
    };
    
    switcher_control_style = {
      'z-index': 3,
      'position': 'relative'
    };

    
    
    function get_flot_colors() {
        if(radmin_current_theme === 'pink') {
            return ['#E63E5D', '#97AF22', '#9D3844', '#533436', '#082D35'];
        } else if(radmin_current_theme === 'green') {
            return ['#42826C', '#FFC861', '#A5C77F', '#6d9f00', '#002F32'];
        } else {
            return ['#49AFCD', '#FF6347', '#38849A', '#BF4A35', '#999', '#555'];
        }
    
        return ['#49AFCD', '#FF6347', '#38849A', '#BF4A35', '#999', '#555'];
    }
    
    function get_sparkline_colors(){
      if(radmin_current_theme === 'pink') {
            return ['#E63E5D', '#97AF22'];
        } else if(radmin_current_theme === 'green') {
            return ['#42826C', '#FFC861'];
        } else {
            return ['#49AFCD', '#FF6347'];
        }
    
        return ['#49AFCD', '#FF6347'];
    }
     
      var sparkline_colors = get_sparkline_colors();
      
      /**
     *  Jquery Load Event
     *
     */
    jQuery(function($){
      // format date inputs
      $( "a[rel=popover]" ).popover();
      
          $('.bar1-sparkline').sparkline([12, 8, 10, 13, 15, -6, -8, 10, 18, 10, -8, -7 ], {type: 'bar', barColor: sparkline_colors[0], negBarColor: sparkline_colors[1], barWidth: '5', height: '20'} );
         
          $('.bar2-sparkline').sparkline([ [5,6],[7,9],[9,5],[6,2],[10,4],[6,7],[5,4],[6,7] ], {type: 'bar',stackedBarColor: sparkline_colors, barWidth: '5', height: '20'} );
         
          $('.discrete-sparkline').sparkline([ 12,11,13,14,13,12,11,12,13,14,15,16,15,14,13,14,15,16,17,18,17,16,17 ], {type: 'discrete', lineColor: sparkline_colors[0], height: '20'} );
         
          $('.line-sparkline').sparkline([ 12,11,13,14,13,12,11,12,13,14,15,16,15,14,13,12,11,12,13,14,15,16,17,18 ], {type: 'line', lineColor: sparkline_colors[0], fillColor: sparkline_colors[0], height: '20'} );
          
          $('#user-popover').popover();
          
          /**
           * Sets active and expands menu items based on id of body tag of current page
           * e.g. <body id="body-index-page"> will result in the menu item with the id="navigation-index-page" having the 
           * class 'active' added, subsequently it will look for a child div with a class of collapse and add the class 'in' 
           * and set the height to auto
           */
          var body_id = $('body').attr('id');
      if(body_id != null){
        var nav_element = $('#navigation-' + body_id.replace('body-',''));
            nav_element.addClass('active');
            if(nav_element.has('div.collapse')){
              var child_nav = nav_element.find('div.collapse');
              child_nav.addClass('in');
              child_nav.css('height: auto;');
              
            }
            
          }
          
          //hide the top-stats when the arrow is clicked
          var item = $('.top-stats');
          var target = $('#hide-top-stats');
          if(item.length > 0 && target.length > 0){
              target.on('click', function() {
          item.css('position', 'relative');
          item.animate({
              left: '-=1200',
              }, 1000, function() {
              // Animation complete.
              item.hide('slow');
          });
        });
      }
      
      //display the color-switcher and change theme (plus anything with comments of //used in theming logic )
      position_color_switcher(true);
      switcher_div.show();
      
      switcher_control.on('click', toggle_color_switcher);
      
      $(window).resize(function() {
        switcher_div.hide();
      });
      
      $('.color-switcher-color').bind('click', set_theme_url);
      
      
    });
  
  jQuery(function($){
    flot_sin_cos('flot-line-graph', flot_options_sin_cos);
  });


