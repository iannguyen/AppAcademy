(function ($) {
  $.Tabs = function (el) {
    this.$el = $(el);
    this.$contentTabs = $(".content-tabs");
    this.$active = $(".tabs .active");
    this.$el.on('click', 'a', this.clickTab.bind(this));
  };

  $.Tabs.prototype.clickTab = function(e) {
    e.preventDefault();
    this.transitionend();
    $(e.currentTarget).addClass("active tr");
    this.$active = $(e.currentTarget);
    var $activeContent = $('.content-tabs .active');
    var currentDog = e.currentTarget.text;
    var $newContent = $(".content-tabs #"+currentDog);
    $newContent.addClass("active transitioning");
    setTimeout(function () {
      $newContent.removeClass("transitioning");
    }, 0);
  };

  $.Tabs.prototype.transitionend = function () {
    var $transitioningContent = $(".content-tabs .transitioning");
    $transitioningContent.removeClass("transitioning");
    this.$active.removeClass("active");
    var $activeContent = $('.content-tabs .active');
    $activeContent.addClass("transitioning");
    $activeContent.removeClass("active");
  };

  $.fn.tabs = function () {
    return this.each(function () {
      new $.Tabs(this);
    });
  };
})(jQuery);



// $.Tabs.prototype.clickTab = function(e) {
//   e.preventDefault();
//   this.transitionend();
//   $(e.currentTarget).addClass("active tr");
//   this.$active = $(e.currentTarget);
//   var $activeContent = $('.content-tabs .active');
//   var currentDog = e.currentTarget.text;
//   var $newContent = $(".content-tabs #"+currentDog);
//   $newContent.addClass("active");
// };
//
// $.Tabs.prototype.transitionend = function () {
//   var $transitioningContent = $(".content-tabs .transitioning");
//   $transitioningContent.removeClass("transitioning");
//   this.$active.removeClass("active");
//   var $activeContent = $('.content-tabs .active');
//   $activeContent.addClass("transitioning");
//   $activeContent.removeClass("active");
// };
