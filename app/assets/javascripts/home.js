$(document).on('page:change', function() {
  $('.post-it a').bind('click', function() {
      $('.selected').removeClass('selected');
      $(this).parent().addClass('selected');
  });
});
