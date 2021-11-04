$(function() {
  $('.item-image-mini').click(function() {
    var src = $(this).find('img').attr('src');
    $('#item-image').attr('src', src);
  });
});