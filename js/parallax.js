$(function(){
  var scheduled = false;
  $(window).on('scroll touchmove mousewheel', function(){
    if (!scheduled) {
      requestAnimationFrame(function(){
        var $el = $('.parallax .foreground');
        var scrollTop = $(this).scrollTop();
        var offset = $el.offset();

        var yOffset = 50 + 100 * ((scrollTop-offset.top)/$el.height());

        $el.css('background-position-y', yOffset + '%');
        scheduled = false;
      })
      scheduled = true;
    }
  });
});
