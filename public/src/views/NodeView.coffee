define ['models/Node'], (Node) ->
    class NodeView extends Backbone.View
        className: 'map-node empty'
        #events:

        initialize: =>
            @model = new Node x: @options.x, y: @options.y
            @dnd = 'application/json'

        render: =>
            coordinateClass = "coords[#{@model.x},#{@model.y}]"
            @.$el.addClass coordinateClass
            @.$el.attr 'title', "#{@model.x}, #{@model.y}"
            @.$el.attr 'dropzone', 'copy application/json'

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

            image = @createTileImage()
            @.$el.html image
            @.$el.removeClass 'empty'

            Backbone.Events.trigger 'node:create', @model

        createTileImage: =>
            image = document.createElement 'img'
            image.height = 32
            image.width = 32
            image.src = @model.get 'data'
            image.title = @model.get 'name'

            image