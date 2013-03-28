define ['views/NodeView', 'models/NodeCollection', 'models/Node'], (NodeView, NodeCollection, Node) ->
    class MapView extends Backbone.View
        className: 'map-canvas'
        initialize: =>
            Backbone.Events.on 'node:create', @addNode, @
            @nodeCollection = new NodeCollection()
            
        render: =>
            @setMapDimensions()

            @

        setMapDimensions: =>
            @$el.css 'width': @model.width * 32, 'height': @model.height * 32
            nodeArray = @generateNodeArray @model.width, @model.height
            @drawNodes nodeArray

        generateNodeArray: (width, height) =>
            nodeArray = new Array height
            mapId = @model.id
            for y in [0..height-1]
                do (y) ->
                    nodeArray[y] = new Array width

                    for x in [0..width-1]
                        do (x) ->
                            nodeArray[y][x] = new NodeView model: new Node x: x, y: y, mapId: mapId

                            return

                    return

            nodeArray 

        drawNodes: (nodeArray) =>
            map = document.createElement 'div'
            for row in nodeArray
                do (row) ->
                    for node in row
                        do (node) ->
                            map.appendChild node.render().el
                                
            @$el.append(map)                          
                    
            @

        addNode: (node) =>
            @nodeCollection.add node
            @