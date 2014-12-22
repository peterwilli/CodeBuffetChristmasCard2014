(->
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

    cardClick = ->
      $inner = $(".card-text-inner")
      rotate = ->
        $inner.toggleClass "flip"

      $inner.click(->
          rotate()
      )

    fetchMessage = ->
      key = $.urlParam('key')
      #console.log key
      if key?
        $.get("msgs/" + key + ".txt", (data) ->
          #$(".card-text-inner .front").text(data)
          $back = $(".card-text-inner .back");
          $back.text(data)
          $(".card-text").transit(opacity: 1, duration: 1000)
          setTimeout(->
            $(".text-scroller").css('height', ($back.height() + $back.offset().top + 100) + "px")
          , 100)
        )


    $ ->
      fetchMessage()
      moveSleigh()
      cardClick()

)()
