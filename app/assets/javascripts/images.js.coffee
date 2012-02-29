# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

cycle_demo = ->
  regexp = /\d/
  img = $('.intro .left img')
  id = parseInt(regexp.exec(img.attr('src'))[0])
  id += 1
  id = 1 if id > 6
  $('.intro .left img').attr('src', "/assets/demo" + id + ".jpg")
  $('.intro .right img').attr('src', "/assets/demo" + id + "-soft.jpg")

# Preview uploading file
preview = (e, file)->
  img = $('.intro .left img')
  img.attr('src', e.target.result)
  $('#next_demo').fadeOut('fast');

# View load progression
progress = (e, file)->
  if e.lengthComputable
    percentComplete = (e.loaded / e.total) * 100;
    $('#progress').fadeIn('fast');
    $('#progress').attr("value", percentComplete);
    if percentComplete >= 100
      uploaded(e, file)

# Upload done
uploaded = (e, file)->
  $('#progress').fadeOut('fast');
  
# Image processed and returned
processed = (e, file, response)->


$ ->
  if mid = $('.middle.demo')
    div = mid.append '<div id="next_demo" class="next">next demo</div>'
    div.click -> cycle_demo()
  $("select, input:checkbox, input:radio, input:file").uniform();
  $("#dropbox").html5Uploader name: "file", postUrl: "/upload", onClientLoad: preview, onServerProgress: progress, onSuccess: processed
