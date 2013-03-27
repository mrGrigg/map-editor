define [
    'text!templates/mapEditor.html'
    'views/PaletteView'
    ], (template, PaletteView) ->
    class MapEditor extends Backbone.View
        events:
            'click .cancel-changes': 'cancelChanges'
            'click .save-changes': 'saveChanges'

        initialize: =>
            Backbone.Events.on 'tile:selected', @tileSelected, @

        render: =>
            editorTemplate = Handlebars.compile template
            @.$el.html editorTemplate @model

            paletteView = new PaletteView
            @.$el.append paletteView.render().el

            @.$el.append $('<div class="map-canvas-wrapper"></div>')

            @

        cancelChanges: =>
            Backbone.history.navigate '', true

        saveChanges: =>
            console.log 'saving'

        tileSelected: (tile) =>
            console.log tile