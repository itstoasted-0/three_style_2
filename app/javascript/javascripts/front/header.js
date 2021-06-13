$(function () {
  const hum = $('#hamburger, .p-drawer_nav_close')
  const nav = $('.p-drawer_nav')
  hum.on('click', function () {
    nav.toggleClass('toggle')
  })
})

$(function () {
  // dropdown liにhoverメソッドを設定
  $('#dropdown')
    .children('li')
    .hover(function () {
      // 2.メニューの開閉
      $(this).children('ul').stop().slideToggle(180)
    })
})