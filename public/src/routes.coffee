define (require) ->
    MapList = require('views/MapListView')
    MapEditor = require('views/MapEditor')

    class Routes extends Backbone.Router
        routes:
            '': 'index'
            'edit/:id': 'edit'
            'delete/:id': 'delete'

        index: =>
            Backbone.Events.trigger 'render:childView', MapList
            #console.log 'index'

        edit: (id) =>
            map = @getMapItem id
            Backbone.Events.trigger 'render:childView', MapEditor, map

        delete: (id) =>
            localStorage.removeItem(id)
            Backbone.history.navigate '', true

        getMapItem: (id) =>
            mapItem = localStorage.getItem id
            JSON.parse mapItem