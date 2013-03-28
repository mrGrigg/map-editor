define [
    'models/MapCollection'
    'views/MapListItem'
    'views/NewMapModal'
    'text!templates/mapList.html'
    ], (MapCollection, MapListItem, NewMapModal, template) ->

    class MapListView extends Backbone.View
        events:
            'click .create-new': 'showNewMapDialog'

        initialize: =>
            @collection = new MapCollection

            @listenTo @collection, 'reset', @renderList
            @listenTo @collection, 'add', @renderMapListItem

            Backbone.Events.on 'map:create', @addMapToCollection

        render: =>
            listTemplate = Handlebars.compile template
            @$el.html listTemplate
            @collection.fetch()
            @

        renderList: =>
            list = document.createElement 'ul'
            @collection.each @renderMapListItem

        renderMapListItem: (map) =>
            mapListItem = new MapListItem model: map
            @$('.map-list').append mapListItem.render().el

            @

        showNewMapDialog: =>
            Backbone.Events.trigger 'modal:show', NewMapModal
            @

        addMapToCollection: (map) =>
            @collection.add map
            
            mapModel = @collection.last()
            mapModel.save()

