define ['models/Node'], (Model) ->
    class NodeCollection extends Backbone.Collection
        model: Model
