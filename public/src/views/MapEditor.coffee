define [
    'text!templates/mapEditor.html'
    'views/PalettView'
    ], (template, PalettView) ->
    class MapEditor extends Backbone.View
        events:
            'click .cancel-changes': 'cancelChanges'
            'click .save-changes': 'saveChanges'

        initialize: =>
            return this

        render: =>
            editorTemplate = Handlebars.compile template
            this.$el.html editorTemplate @model

            palettView = new PalettView
            this.$el.append palettView.render().el

            return this

        cancelChanges: =>
            Backbone.history.navigate '', true

        saveChanges: =>
            console.log 'saving'