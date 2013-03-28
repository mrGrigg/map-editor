define ->
    class Map extends Backbone.Model
        save: =>
            mapString = JSON.stringify @toJSON()
            localStorage.setItem @id, mapString

        destroy: =>
            localStorage.removeItem(@id)