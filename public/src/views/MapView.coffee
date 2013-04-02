define [
    'views/NodeView'
    'models/Node'
    ], (NodeView, Node) ->
    class MapView extends Backbone.View
        className: 'map-canvas'
        initialize: =>
            Backbone.Events.on 'node:create', @addNode

            @height = parseInt @model.get('height'), 10
            @width = parseInt @model.get('width'), 10

        render: =>
            if @height < 20
                @$el.css 'height': @height * 32

            if @width < 15
                @$el.css 'width': @width * 32

            mapHeight = if @height > 20 then 20 else @height
            mapWidth = if @width > 15 then 15 else @width            
            
            mapNodes = @drawNodes @generateNodeArray()
            @$el.append mapNodes
            @

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

        #Convert the node collection into node views
        drawNodes: (nodeArray) =>
            map = document.createElement 'div'
            for row in nodeArray
                do (row) ->
                    for node in row
                        do (node) ->
                            map.appendChild node.render().el
                                
            map.children

        addNode: (node) =>
            @collection.add node
            @