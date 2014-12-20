$body = $ "body"
doSnow = (amount) ->
  snow = []

  $flakes = $(".flakes")
  w = $body.width()
  h = $body.height()

  for i in [0..amount]
    $f = $("<div />")
    $f.addClass "flake"
    $f.css(
      left: Math.round(Math.random() * w)
    )
    speed = rand(3, 5)
    $f.data("speed", speed)
    $f.data("i", Math.round((h / speed) * Math.random()))

    $flakes.append $f

  setInterval ->
    flakesFall()
  , 100

  setInterval ->
    flakeReuseCheck()
  , 1000

flakeReuseCheck = ->
  w = $body.width()
  h = $body.height()
  $(".flakes .flake").each(->
    $this = $ this
    pos = $this.offset()

    if pos.top > h
      $this.css(
        left: Math.round(Math.random() * w)
      )
      speed = rand(3, 5)
      $this.data("speed", speed)
      $this.data("i", 0)
  )

flakesFall = ->
  $(".flakes .flake").each(->
    $this = $ this

    $this.css(
      top: Math.round($this.data("i") * $this.data("speed"))
    )
    $this.data("i", $this.data("i") + 1)
  )

$ ->
  doSnow(30)
