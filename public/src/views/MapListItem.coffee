define ['text!templates/mapListItem.html'], (template) ->
    class MapListItem extends Backbone.View
        events:
            'click .delete': 'deleteMap'

        initialize: =>

        render: =>
            mapTemplate = Handlebars.compile template
            @$el.html(mapTemplate(@model.toJSON()));

            @

        deleteMap: =>
            @model.destroy()
            @remove()