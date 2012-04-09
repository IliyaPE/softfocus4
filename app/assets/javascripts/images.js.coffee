# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Cycle through demo images set
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
  $('#next_demo').fadeOut('fast')

# View load progression
progress = (e, file)->
  if e.lengthComputable
    percentComplete = (e.loaded / e.total) * 100;
    $('#upload-progress').fadeIn('fast')
    $('#upload-progress').attr("value", percentComplete)
    if percentComplete >= 100
      uploaded(e, file)

# Upload done
uploaded = (e, file)->
  $('#upload-progress').fadeOut('fast')
  $('#process-progress').fadeIn('fast')
  
  
# Image processed and returned
processed = (e, file, response)->
  $('#process-progress').fadeOut('fast')
  obj = JSON.parse(response)
  if obj['id']
    window.location = '/' + obj['id']
  else
    img = $('.intro .left img')
    img.attr('src', '/assets/error.png')
    $('.intro .left').append('<div class="error">' + obj['error'] + '</div>')

# Add javascript upload info markup
prepare_loader = ->
  left = $('.intro .left')
  right = $('.intro .right')
  if left and right
    left.append '<div id="dropbox"><p>You can drop now</p></div><progress id="upload-progress" max="100" value="60"></progress>'
    img = left.find('img')
    img.load ->
      if this.width > 0 and this.height > 0
        left.find('#dropbox').css {width: this.width, height: this.height, left: $(this).position().left + 3}
        left.find('.picture').css {'background-size': this.width + 'px 16px'}
        $('.intro .middle').css 'height', this.height
      else
        setTimeout("$('.intro .left img').trigger('load')", 100)
    right.append '<div id="process-progress"><p>Generating preview...</p></div>'
    img2 = right.find('img')
    img2.load ->
      if this.width > 0 and this.height > 0
        right.find('#process-progress').css {width: this.width, height: this.height, left: $(this).position().left + 3}
        right.find('.picture').css {'background-size': this.width + 'px 16px'}
      else
        setTimeout("$('.intro .right img').trigger('load')", 100)

$ ->
  if mid = $('.middle.demo')
    mid.append '<a id="next_demo" class="button">↺ Next demo</a>'
    mid.find('a').click -> cycle_demo()
  prepare_loader()
  $("select, input:checkbox, input:radio, input:file").uniform();
  $("#dropbox").html5Uploader name: "file", postUrl: "/upload", onClientLoad: preview, onServerProgress: progress, onSuccess: processed
  $(".download a").click ->
    text = $(this).text().replace("⇣", "✓");
    $(this).text(text);
    if ($(this).hasClass('disabled'))
      $(this).attr('href', 'javascript: void(0);');
      return false;
    else
      $(this).addClass('disabled');
  $("form input[type=submit]").click ->
    $(this).attr("value", "Sending ... ⌛");
    if ($(this).hasClass('disabled'))
      $(this).attr('href', 'javascript: void(0);');
      return false;
    else
      $(this).addClass('disabled');