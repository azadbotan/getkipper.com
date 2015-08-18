$overlay      = $('#overlay')
$overlayClose = $('#overlay-close')
$video        = $('.kipper-video')
$videoTrigger = $('#play-kipper-video')
$videoClose   = $('#close-kipper-video')
player = null

window.onYouTubeIframeAPIReady = (target, videoId) ->
  player = new YT.Player target,
    height: '720'
    width: '1280'
    videoId: videoId
    playerVars:
      rel: 0
    events:
      'onReady': onPlayerReady
      'onStateChange': onPlayerStateChange

window.onPlayerReady = (e) ->
  $video.addClass 'is-playing'
  $overlay.addClass 'is-visible'
  # e.target.playVideo()

window.onPlayerStateChange = (e) ->
  if e.data == YT.PlayerState.PLAYING
    # do stuff

  else if e.data == YT.PlayerState.PAUSED
    # do stuff

  else if e.data == YT.PlayerState.ENDED
    $video.removeClass 'is-playing'
    $overlay.removeClass 'is-visible'
    e.target.destroy()


$videoTrigger.on 'click', ->
  onYouTubeIframeAPIReady 'video', 'Z-48u_uWMHY'
  return false

$overlayClose.on 'mouseup touchend', ->
  $video.removeClass 'is-playing'
  $overlay.removeClass 'is-visible'
  player.destroy()
  return false