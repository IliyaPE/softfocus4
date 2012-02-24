# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

cycle_demo = ->
  regexp = /\d/
  img = $('.left img')
  id = parseInt(regexp.exec(img.attr('src'))[0])
  id += 1
  id = 1 if id > 6
  $('.left img').attr('src', "/assets/demo" + id + ".jpg")
  $('.right img').attr('src', "/assets/demo" + id + "-soft.jpg")

$ ->
  if mid = $('.middle')
    div = mid.append '<div class="next">next demo</div>'
    div.click -> cycle_demo()
  $("select, input:checkbox, input:radio, input:file").uniform();
  $("#dropbox").html5Uploader name: "file", postUrl: "/upload"
