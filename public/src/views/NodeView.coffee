define ['modules/Tiles', 'modules/createTileImage'], (Tiles, createTileImage) ->
    class NodeView extends Backbone.View
        className: 'map-node empty'
        events:
            'click': 'placeTile'

        initialize: =>
            Backbone.Events.on 'tile:selected', @tileSelected

            @dnd = 'application/json'

        render: =>
            @$el.attr 'title', "#{@model.get('x')}, #{@model.get('y')}"
            @$el.attr 'dropzone', 'copy application/json'

            tileName = @model.get 'name'
            if tileName?
                image = createTileImage tileName
                @$el.html image
                @$el.removeClass 'empty'
            else
                @$el.html "#{@model.get('x')},#{@model.get('y')}"

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

        tileSelected: (tile) =>
            @selectedTile = tile

        placeTile: =>
            @model.set @selectedTile

            image = createTileImage @model.get 'name'
            @$el.html image
            @$el.removeClass 'empty'

            Backbone.Events.trigger 'node:create', @model