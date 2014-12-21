$body = $ "body"
moveSleigh = ->
  $s = $ ".sleigh"

  setInterval ->
    bw = $body.width()
    l = parseInt $s.css("left")
    rl = l
    if rl < 0
      rl = 0
    if rl > bw
      rl = bw
    $s.css(
      left: l + 1
      rotate: (((rl / bw) * 40) - 20) + "deg"
    )
  , 50

fetchMessage = ->
  key = $.urlParam('key')
  #console.log key
  if key?
    $.get("msgs/" + key + ".txt", (data) ->
        $(".card-text-inner").text(data)
    )


$ ->
  fetchMessage()
  moveSleigh()
