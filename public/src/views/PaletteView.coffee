define ['modules/Tiles', 'views/TileView', 'text!templates/palette.html'], (Tiles, TileView, template) -> 
    class PaletteView extends Backbone.View
        className: 'palette'

        events:
            'click .paletteTile': 'selectTile'
            'click .toggle-palette': 'togglePallete'

        initialize: =>
            @

        render: =>
            tiles = document.createElement 'div'
            
            toggle = Handlebars.compile template

            for name, data of Tiles
                tileView = new TileView data: data, name: name
                tiles.appendChild tileView.render().el

            @$el.html tiles.children
            @$el.append toggle

            @

        selectTile: (event) =>
            @$('.selected').removeClass 'selected'

            tile = event.currentTarget
            tile.classList.add 'selected'

        togglePallete: =>
            toggle = @$('.arrow')

            @$('.paletteTile:not(.selected)').toggle()

            toggle.toggleClass 'open closed'