Polymer 'xeno-view',

  world: null
  spaces: null
  course: null
  index: null

  domReady: ->
    @world = @.querySelector 'xeno-course'
    @spaces = @world.spaces

    @course = @world.course

    @index = 0

    document.onkeydown = @onKeyDown.bind(@)

  onKeyDown: (event) ->
    if event.keyCode is 32
      @index = (@index + 1) % @course.length

  indexChanged: (oldIndex, newIndex) ->
    @moveTo newIndex

    @spaces[oldIndex]?.classList.remove 'focus'
    @spaces[newIndex]?.classList.add 'focus'

  moveTo: (index) ->
    location = @course[index]
    @transform @world, "translateX(-#{location.x}px)"

  transform: (element, value) ->
    element.style.transform = element.style.webkitTransform = value
