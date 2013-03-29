define [
    'views/NodeView'
    'models/Node'
    ], (NodeView, Node) ->
    class MapView extends Backbone.View
        className: 'map-canvas'
        initialize: =>

            Backbone.Events.on 'node:create', @addNode

        render: =>
            @drawNodes @generateNodeArray()
            @

        # setMapDimensions: =>
        #     nodeArray = 
        #     @drawNodes @generateNodeArray()

        generateNodeArray: =>
            height = @model.get('height')
            width = @model.get('width')

            # scrollHorizontal = width > 15
            # scrollVertical = height > 20

            #Draw the initial 640 x 480 grid
            nodeArray = new Array height
            for y in [0..height - 1]
                #Todo: Is this an option to try out curry?
                do (y) =>
                    nodeArray[y] = new Array width

                    for x in [0..width - 1]
                        do (x) =>
                            node = @getNodeModel x, y
                            nodeArray[y][x] = new NodeView model: node

            nodeArray 

        getNodeModel: (x, y) =>
            #Get the model from the collection or generate a new node
            node = @collection.get("#{x}-#{y}") 
            node ? new Node x: x, y: y, mapId: @model.id

        drawNodes: (nodeArray) =>
            map = document.createElement 'div'
            for row in nodeArray
                do (row) ->
                    for node in row
                        do (node) ->
                            map.appendChild node.render().el
                                
            @$el.append(map)

        addNode: (node) =>
            @collection.add node
            @