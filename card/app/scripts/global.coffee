window.rand = (min, max) -> min + Math.floor(Math.random() * (max-min))

# Delegate .transition() calls to .animate()
# if the browser can't do CSS transitions.
$.fn.transition = $.fn.animate  unless $.support.transition

`$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}`
