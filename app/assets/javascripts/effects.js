// Effects

$(document).ready(function() {
  var height = $(window).height();
  var width = $(window).width();
  var middle = height / 2;
  var lst = 0;
  var big_height = $(document).height() - height - 26;

  $('#my_modal').popup();

  $('#my_modal').tabs();

  window.currentLocale = "#{I18n.locale}";

  if (height > 727 && height < 897) {
    $('#home-top').css('height', 600);
    $('.mask').css({
      'width': '30%',
      'margin-top': '10px'
    });
    $('.circle').css('top','535px');
    $('.important').css('top','650px');
    $('.counting').css('top','650px');
    $('#lists').css('margin-top', height - 690);
  } else if (height > 897) {
    $('#lists').css('margin-top', height - 740);
    $('#home-top').css('height', 650);
    $('.mask').css('width', '40%');
    $('.important, .counting').css('top', 685);
  }

  if (width == 1024 && height == 768) {
    $('.mask').css('width', '50%');
  }

  // MOBILE VERSION
  if (height > width && width < 760) {
    $('#cont_lists, #lists, .counting, .important, .ready, .you, .mask').css('display', 'none');
    $('#home-top').css({height: middle, 'border-bottom': '5px solid #fff'});
    $('.circle').css('top', middle - 80);
    $('.magma_logo').css('margin', '5% auto 1%');
    $('.cfp').css('width', '60%');
    $('.welcome').css('margin-bottom', 0);
  } else if (height < width && width < 760) {
    $('#cont_lists, #lists, .counting, .important').css('display', 'none');
    $('.circle').css('top', '497px');
    $('#list_phone .numbers a').css('padding-bottom', '20px');
  }

  if (width < 1370 && width > 768 && height < 800) {
    $('.circle').css('top', '510px');
  }

  $('.open_propos_phone').click(function(e) {
    e.preventDefault();
    $('#proposals_phone').slideDown();
  });

  $('.close_propos_phone').click(function(e) {
    e.preventDefault();
    $('#proposals_phone').slideUp();
  });

  $('.info_phone').click(function(e) {
    e.preventDefault();
    $('#info_phone').animate({
      left: '0%'
    });
  });

  $('.close_info_phone').click(function(e) {
    e.preventDefault();
    $('#info_phone').animate({
      left: '-100%'
    });
  });

  var state = true;

  $('.head').click(function(e) {
    state = !state;

    if(state) {
      e.preventDefault();
      $(e.target).parents('article').find('.info_hidden').slideToggle();
      $(e.target).parents('article').find('.left').css('color', '#8b8a89');
      $(e.target).parents('article').find('a').removeClass('hide_info');
      $(e.target).parents('article').find('a').addClass('show_info');
    } else {
      e.preventDefault();
      $(e.target).parents('article').find('.info_hidden').slideToggle();
      $(e.target).parents('article').find('.left').css('color', '#000');
      $(e.target).parents('article').find('a').removeClass('show_info');
      $(e.target).parents('article').find('a').addClass('hide_info');
    }
  });

  // Pagination
  function pagination() {
    $('#pagination').html(render("cfp/application/pagin"));
  }

  function down() {
    $(document).scrollTop();
  }

  function top(s) {
    $('#cont_lists').css('margin-top', '-' + s + 'px');
  }

  if (height > 617) {
    $(window).scroll(function() {
      st = $(this).scrollTop();

      st > lst ? down() : top(st);
    });
  }

  $('.lists_close').click(function(e) {
    e.preventDefault();
    $('html, body').animate({
      scrollTop: '0'
    });
  });

  $('.lists_open').click(function(e) {
    e.preventDefault();
    $('html, body').animate({
      scrollTop: '900'
    });
  });
});
