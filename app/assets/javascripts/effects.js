// Effects

$(document).ready(function() {
  var height = $(window).height();
  var width = $(window).width();
  var lst = 0;

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
    $('.important').css('top', 685);
    $('.counting').css('top', 685);
  }

  if (width == 1024 && height == 768) {
    alert('hello');
    $('.mask').css('width', '50%');
  }

  $(this).keyup(function(e) {
    if ((event.which == 27) && ($('#cont_lists').is(':visible'))) {
      close_popup();
    }
  });

  // Pagination
  function pagination() {
    $('#pagination').html(render("cfp/application/pagin"));
  }

  function down(s) {
    $('#cont_lists').css('margin-top', '-' + s + 'px');
  }

  function top(s) {
    $('#cont_lists').css('margin-top', '-' + s + 'px');
  }

  if (height > 617) {
    $(window).scroll(function() {
      st = $(this).scrollTop();

      st > lst ? down(st) : top(st);
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
      scrollTop: '488'
    });
  });
});
