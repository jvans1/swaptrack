/* SlideIn SlideOut v.0.1
 * 19 jun 2011
 * (c)2011 by Alejandro Vasquez - Digitart
 * admin [at] digitart.net
 * 
 * This jQuery plugin adds slideIn() and slideOut() functionality much
 * in the same smoth way Mootool's fx do.
 * WARNING: This plugin contravenes the recommendations of jQuery guys of
 * keeping only one namespace for each plugin. If you are too picky about
 * namespacing cluttering you may not want to use it in it's current state.
 * I took the decision of keeping it that way in order to make it easy to
 * use while programming.
 * Use:
 * $('#element').slideOut(speed[,mode]);
 * $('#element').slideIn(speed[,mode]);
 * speed = miliseconds for the effect. It may also be 'slow' or 'fast' though. Defaults to 'slow'
 * mode = Defaults to slide vertical. You may use 'horizontal' to make horizontal movements
 * 
 * Licensed under the GNU Lesser General Public License:
 *     http://www.gnu.org/licenses/lgpl-3.0.html
 * Author website:
 *     http://www.digitart.net
 * Compressed with http://dean.edwards.name/packer/
 * 
 * The plugin stores a flag in the slided element that let you know ir's current visibility
 * status. It can be readed using:
 * $('#element').data('isOut');
 * wich is true if the element has being slidedOut by this plugins
 */
(function ($){
  $.fn.slideOut = function(vel, mode){
    if(vel === 0) vel = 1;
    if(!vel) vel = 'slow';
    if(vel == 'horizontal'){
      mode = vel;
      vel = 'slow';
    }
    wrapper = getWrapperFor(this);
    inner = this;

    wrapper.stop();
    inner.stop();
    myHeight = inner.outerHeight();
    myWidth = inner.outerWidth();
    if(mode=='horizontal'){
      wrapper.animate({
        width: 0
      },vel);
      inner.animate({
        marginLeft: -myWidth
        },vel);
    }else{
      wrapper.animate({
        height: 0
      },vel);
      inner.animate({
        marginTop: -myHeight
        },vel);
    }
    inner.data('isOut',true);
  };
  $.fn.slideIn = function(vel, mode){
    if(vel === 0) vel = 1;
    if(vel == 'horizontal'){
      mode = vel;
      vel = 'slow';
    }
    if(!vel) vel = 'slow';
    wrapper = getWrapperFor(this);
    inner = this;

    wrapper.stop();
    inner.stop();
    myHeight = inner.outerHeight();
    myWidth = inner.outerWidth();
    if(mode=='horizontal'){
      wrapper.animate({
        width: myWidth
      },vel);
      inner.animate({
        marginLeft: 0
      },vel);
    }else{
      wrapper.animate({
        height: myHeight
      },vel);
      inner.animate({
        marginTop: 0
      },vel);
    }
    inner.data('isOut',false);
  };
  
  function getWrapperFor(obj){
    if(obj.data('isWrapped')){
      return obj.parent();
    }
    //create the anobymous wrapper
    $('<div style="overflow:hidden;position:static;margin:0;padding:0;border:0"></div>').insertBefore(obj);
    wrapper = obj.prev();
    inner = obj;
    //inherit element's margins to the wrapper
    wrapper.css('marginTop', inner.css('marginTop'));
    wrapper.css('marginLeft', inner.css('marginLeft'));
    wrapper.css('marginRight', inner.css('marginRight'));
    wrapper.css('marginBottom', inner.css('marginBottom'));
    inner.css('margin','0');
    //Make wrapper match the exact size of the contained element
    wrapper.width(inner.outerWidth());
    
    //finally put content inside the container
    inner.prependTo(wrapper);
    obj.data('isWrapped',true);
    //return the object for future references
    return wrapper;
  }
  
  function wrapperName(obj){
    prefix = 'slidewrapper-';
    id = obj.attr('id');
    return prefix + id;
  }
  
})(jQuery);
