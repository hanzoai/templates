$(function(){
  $(window).on('scroll touchmove mousewheel', function(){
    var $el = $('.hero.parallax .foreground');
    var scrollTop = $(this).scrollTop();
    var offset = $el.offset();

    var yOffset = 50 + 300 * ((scrollTop-offset.top)/offset.top);

    $el.css('background-position-y', yOffset + '%');
  });
});
