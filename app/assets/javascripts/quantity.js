$(function() {
  $(".quantity").parent().children().css("vertical-align", "middle");
    
  $('.box').on('click', '.minus', function () {
    var $quantity = $(this).siblings('.quantity'),
        value     = +$quantity.val();
    
    if (value > 1) {
      $quantity.val(value - 1);
    }
  });
  
  $('.box').on('click', '.plus', function () {
    var $quantity = $(this).siblings('.quantity'),
        value     = +$quantity.val();
    
    if (value < 10) {
      $quantity.val(value + 1);
    }
  });
});