define ->
    class TileView extends Backbone.View
        className: 'paletteTile'
        events:
            'dragstart': 'dragStart'

        initialize: =>
            jQuery.event.props.push 'dataTransfer'
            this.$el.attr 'id', @options.name

            @model =
                name: @options.name
                data: @options.data

            @dnd = 'application/json'

        render: =>
            image = @createTileImage()
            this.$el.append image
            this.$el.attr 'draggable', true

            this

        createTileImage: =>
            image = document.createElement 'img'
            image.height = 32
            image.width = 32
            image.src = @model.data
            image.title = @model.name

            image

        dragStart: (evet) =>
            if event.target instanceof HTMLImageElement
                data = JSON.stringify @model
                event.dataTransfer.setData @dnd, data
                event.dataTransfer.setDragImage event.target, 0, 0
                return
            else
                event.preventDefault()