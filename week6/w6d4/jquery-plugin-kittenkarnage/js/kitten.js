(function ($) {
  $.Carousel = function (el) {
    this.$el = $(el);
    this.activeIdx = 0;
    this.$active = $(".carousel .active");
    this.$el.on('click', '.slide-left', this.slide.bind(this, 'left'));
    this.$el.on('click', '.slide-right', this.slide.bind(this, 'right'));

  };

  $.fn.carousel = function() {
    return this.each(function () {
    new $.Carousel(this);
  });
};


  $.Carousel.prototype.slide = function(direction) { 
    num = (direction === 'left' ? -1 : 1); 
    event.preventDefault(); 
    this.$active.removeClass("active");
    this.activeIdx += num;
    this.setSides();  
    var $current = $("img").eq(this.activeIdx); 
    $current.addClass("active"); 
    this.$active = $current;
  };

  $.Carousel.prototype.setSides = function() {
    $(".carousel .left").removeClass("left");
    $(".carousel .right").removeClass("right");  
    var $left = $("img").eq(this.activeIdx-1);
    var $right = $("img").eq(this.activeIdx+1); 
    $left.addClass("left");
    $right.addClass("right"); 

    };

})(jQuery);
