define ['models/Node'], (Model) ->
    class NodeCollection extends Backbone.Collection
        model: Model

        fetch: =>
            storage = localStorage
            models = localStorage.getItem(@url)

            @reset models

        url: (url) =>
            @url = url

        sync: =>
            collectionString = JSON.stringify @toJSON()

            localStorage.setItem @url, collectionString
