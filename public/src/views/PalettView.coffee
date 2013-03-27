define ['modules/Tiles', 'views/TileView'], (Tiles, TileView) -> 
    class PalettView extends Backbone.View
        id: 'palette'
        initialize: =>
            this

        render: =>
            tiles = document.createElement 'div'
            
            for name, data of Tiles
                tileView = new TileView data: data, name: name
                $(tiles).append tileView.render().el

            this.$el.html tiles
            this

        renderTile: (data, name) =>
