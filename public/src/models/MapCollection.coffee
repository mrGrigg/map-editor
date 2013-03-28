define ['models/Map'], (Map) ->
    class MapCollection extends Backbone.Collection
        model: Map

        fetch: =>
            storage = localStorage
            storageItems = for name, map of storage
                JSON.parse(map)
            
            @reset(storageItems)