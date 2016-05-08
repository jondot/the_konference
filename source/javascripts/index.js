import 'script!jquery'
import 'script!jquery.scrollto'
import 'script!lodash'
import 'foundation-sites'
$(document).foundation();

var debounced = _.debounce(
  function(){
      var topbar = document.getElementById('sticky');
      var yPos = window.pageYOffset;
      if(yPos > 150){
          topbar.style.backgroundColor = "rgba(0,0,0,0.3)";
      } else {
          topbar.style.backgroundColor = "transparent";
      }
     $('.top-bar-right').scrollTo($('a.active'), 100);
  }, 100
)
$(window).scroll(debounced)
