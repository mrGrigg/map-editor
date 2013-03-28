define [
    'text!templates/mapEditor.html'
    'views/PaletteView'
    'views/MapView'
    ], (template, PaletteView, MapView) ->
    class MapEditor extends Backbone.View
        events:
            'click .cancel-changes': 'cancelChanges'
            'click .save-changes': 'saveChanges'

        initialize: =>

        render: =>
            editorTemplate = Handlebars.compile template
            @$el.html editorTemplate @model

            paletteView = new PaletteView
            @$el.append paletteView.render().el

            mapView = new MapView model: @model
            @$el.append $('<div class="map-canvas-wrapper"></div>')
            @$('.map-canvas-wrapper').append mapView.render().el

            @

        cancelChanges: =>
            Backbone.history.navigate '', true

        saveChanges: =>
            console.log 'saving'