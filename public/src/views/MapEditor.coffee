define [
    'text!templates/mapEditor.html'
    'text!templates/mapCanvasWrapper.html'
    'views/PaletteView'
    'views/MapView'
    'models/NodeCollection'
    'models/Map'
    ], (EditorTemplate, MapCanvasTemplate, PaletteView, MapView, NodeCollection, Map) ->
    class MapEditor extends Backbone.View
        events:
            'click .cancel-changes': 'cancelChanges'
            'click .save-changes': 'saveChanges'
            'click .back': 'cancelChanges'

        initialize: =>
            @model = new Map(@model)
            @nodeCollection = new NodeCollection(@model.get('tiles'))

        render: =>
            editorTemplate = Handlebars.compile EditorTemplate
            mapWrapper = Handlebars.compile MapCanvasTemplate

            @$el.html editorTemplate @model.toJSON()

            paletteView = new PaletteView
            @$el.append paletteView.render().el

            mapView = new MapView model: @model, collection: @nodeCollection
            @$el.append mapWrapper
            @$('.map-canvas-wrapper').append mapView.render().el
            @

        cancelChanges: =>
            Backbone.history.navigate '', true

        saveChanges: =>
            #Reassign the tiles to the model before saving
            @model.set 'tiles', @nodeCollection.toJSON()
            @model.save()