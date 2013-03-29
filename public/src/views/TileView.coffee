define ['modules/createTileImage'], (createTileImage) ->
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

            @dnd = 'application/json'

        render: =>
            image = createTileImage @model.name
            @$el.append image
            @$el.attr 'draggable', true

            @

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