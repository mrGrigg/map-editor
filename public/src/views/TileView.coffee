define ->
    class TileView extends Backbone.View
        className: 'paletteTile'
        events:
            'dragstart': 'dragStart'
            'click': 'selectTile'

        initialize: =>
            jQuery.event.props.push 'dataTransfer'
            @$el.attr 'id', @options.name

            @model =
                name: @options.name
                data: @options.data

            @dnd = 'application/json'

        render: =>
            image = @createTileImage()
            @$el.append image
            @$el.attr 'draggable', true

            @

        createTileImage: =>
            image = document.createElement 'img'
            image.height = 32
            image.width = 32
            image.src = @model.data
            image.title = @model.name

            image

        dragStart: (event) =>
            if event.target instanceof HTMLImageElement
                data = JSON.stringify @model
                event.dataTransfer.setData @dnd, data
                event.dataTransfer.setDragImage event.target, 0, 0
                return
            else
                event.preventDefault()

        selectTile: =>
            Backbone.Events.trigger 'tile:selected', @model