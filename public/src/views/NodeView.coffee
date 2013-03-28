define ->
    class NodeView extends Backbone.View
        className: 'map-node empty'
        events:
            'click': 'placeTile'

        initialize: =>
            Backbone.Events.on 'tile:selected', @tileSelected, @

            @dnd = 'application/json'

        render: =>
            coordinateClass = "coords[#{@model.get('x')},#{@model.get('y')}]"
            @$el.addClass coordinateClass
            @$el.attr 'title', "#{@model.get('x')}, #{@model.get('y')}"
            @$el.attr 'dropzone', 'copy application/json'

            @

        dragEnter: (event) =>
            event.dataTransfer.dropEffect = 'move'
            event.preventDefault()

            false

        dragOver: (event) =>
            event.dataTransfer.dropEffect = 'move'
            event.preventDefault()

            false

        handleDrop: (event) =>
            data = event.dataTransfer.getData @dnd

            @model.set JSON.parse data

            @placeTile()

        createTileImage: =>
            image = document.createElement 'img'
            image.height = 32
            image.width = 32
            image.src = @model.get 'data'
            image.title = @model.get 'name'

            image

        tileSelected: (tile) =>
            @selectedTile = tile

        placeTile: =>
            @model.set @selectedTile

            image = @createTileImage()
            @$el.html image
            @$el.removeClass 'empty'

            Backbone.Events.trigger 'node:create', @model