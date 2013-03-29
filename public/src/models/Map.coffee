define ->
    class Map extends Backbone.Model
        defaults:
            tiles: []

        save: =>
            mapString = JSON.stringify @toJSON()
            localStorage.setItem @id, mapString

        destroy: =>
            localStorage.removeItem(@id)