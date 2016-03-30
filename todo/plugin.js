(function($) {

  $.fn.changeColor = function(color) {
    this.css('color', color);
    return this;
  }

  $.fn.changeSize = function(size) {
    this.css('font-size', size + 'px');
  }
}(jQuery));