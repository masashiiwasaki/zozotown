$(function() {
  $('.bkmk').find('a').on("click",function() {
    var g = this;
    var h = [[0, 0], [-88, 0], [-176, 0], [-264, 0], [-352, 0], [-440, 0], [-528, 0], [-616, 0], [-704, 0], [-792, 0], [-880, 0], [-968, 0], [-1056, 0], [-1144, 0], [-1232, 0], [-1320, 0], [-1408, 0], [-1496, 0], [-1584, 0], [-1672, 0], [-1760, 0], [-1848, 0], [-1936, 0], [0, -80], [-88, -80], [-176, -80], [-264, -80], [-352, -80], [-440, -80], [-528, -80], [-616, -80], [-704, -80], [-792, -80], [-880, -80], [-968, -80], [-1056, -80], [-1144, -80], [-1232, -80], [-1320, -80], [-1408, -80], [-1496, -80], [-1584, -80], [-1672, -80], [-1760, -80], [-1848, -80], [-1936, -80], [0, -160], [-88, -160], [-176, -160], [-264, -160], [-352, -160], [-440, -160], [-528, -160], [-616, -160], [-704, -160]]; //背景の位置
    var i = h.length; //コマ数
    var a = ''; //タグ格納
    var b = 100; //setInterval秒数
    var e = 42063854; //商品番号

    var url = window.location.href + '/favorite_iem'
    $.ajax({
      type: "POST",
      url: url,
      dataType: "json"
    })
    if ($('#cart_did_' + e).find('.heartArrow').length == 0) {
      a = $('<a class="heartArrow" href="#"><div class="pop"></div></a>').appendTo('#cart_did_' + e);
      b = 30 * 20
      var c = 0;
      var d = setInterval(function() {
        if (i <= c) {
          clearInterval(d);
          a.addClass('fix').removeAttr('style');
          a.click(function() {
            $(this).blur();
            return false
          })
        } else {
          a.css({
            backgroundPosition: h[c][0] + 'px ' + h[c][1] + 'px'
          });
          c++
        }
      }, 30)
    }
    setTimeout(function() {
      a.find('.pop').show();
      setTimeout(function() {
        a.find('.pop').fadeOut(300, function() {
          $(this).remove()
        })
      }, 2000)
    }, b)
  })
});
