Polymer 'xeno-view',

  world: null
  course: null
  index: 0

  domReady: ->
    @world = @.querySelector 'xeno-course'
    @course = @world.course

    @index = 0

    document.onkeydown = @onKeyDown.bind(@)

  onKeyDown: (event) ->
    if event.keyCode is 32
      @index = (@index + 1) % @course.length

  indexChanged: (oldIndex, newIndex) ->
    @moveTo newIndex

  moveTo: (index) ->
    location = @course[index]
    @transform @world, "translateX(-#{location.x}px)"

  transform: (element, value) ->
    element.style.transform = element.style.webkitTransform = value
