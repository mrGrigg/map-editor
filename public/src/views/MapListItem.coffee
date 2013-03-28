define ['text!templates/mapListItem.html'], (template) ->
    class MapListItem extends Backbone.View
        events:
            'click .edit': 'navigate'
            'click .delete': 'deleteMap'

        initialize: =>

        render: =>
            mapTemplate = Handlebars.compile template
            @$el.html(mapTemplate(@model.toJSON()));

            @

        deleteMap: =>
            @model.destroy()
            @remove()

            false

        navigate: =>
            href = @$('.edit').attr('href');
            Backbone.history.navigate(href, true)

            false