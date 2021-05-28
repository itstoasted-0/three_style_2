$(function () {
  const hum = $('#hamburger, .p-drawer_nav_close')
  const nav = $('.p-drawer_nav')
  hum.on('click', function () {
    nav.toggleClass('toggle')
  })
})
