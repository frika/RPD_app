(function() {

  $(function() {
    return $(".fancybox").fancybox({
      width: 320,
      padding: 0,
      helpers: {
        title: {
          type: 'outside'
        },
        overlay: {
          speedIn: 200,
          speedOut: 200
        }
      },
      openEffect: 'fade',
      closeEffect: 'fade'
    });
  });

}).call(this);
