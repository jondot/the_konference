import 'script!jquery'
import 'script!jquery.scrollto'
import 'script!lodash'
import 'foundation-sites'
$(document).foundation();

var debounced = _.debounce(
  function(){
     $('.top-bar-right').scrollTo($('a.active'), 100);
  }, 100
)
$(window).scroll(debounced)
