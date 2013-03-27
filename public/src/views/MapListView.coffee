define [
    'text!templates/mapList.html'
    'views/NewMapModal'
    ], (template, NewMapModal) ->

    class MapListView extends Backbone.View
        events:
            'click .create-new': 'showNewMapDialog'
            'click a': 'navigate'

        initialize: =>
            @getMapItems()

        render: =>
            mapTemplate = Handlebars.compile template
            storageItems = @getMapItems()

            this.$el.html(mapTemplate(storageItems));
                        
            return this

        getMapItems: =>
            storage = localStorage
            storageItems = for name, map of storage
                JSON.parse(map)
            
            return storageItems

        showNewMapDialog: =>
            Backbone.Events.trigger 'modalShow', NewMapModal

            return this

        navigate: (event) =>
            location = $(event.target).attr 'href'
            Backbone.history.navigate location, true

            return false