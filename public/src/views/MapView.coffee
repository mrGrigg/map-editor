define ['views/NodeView', 'models/NodeCollection'], (NodeView, NodeCollection) ->
    class MapView extends Backbone.View
        className: 'map-canvas'
        initialize: =>
            Backbone.Events.on 'node:create', @addNode, @
            @width = parseInt @.options.width, 10
            @height = parseInt @.options.height, 10

        render: =>
            @setMapDimensions()

            @

        setMapDimensions: =>
            @.$el.css 'width': @width * 32, 'height': @height * 32
            nodeArray = @generateNodeArray @width, @height
            @drawNodes nodeArray

        generateNodeArray: (width, height) =>
            nodeArray = new Array height
            for y in [0..height-1]
                do (y) ->
                    nodeArray[y] = new Array width

                    for x in [0..width-1]
                        do (x) ->
                            nodeArray[y][x] = new NodeView x: x, y: y

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
                                
            @.$el.append(map)                          
                    
            @

        testFunction: (test) =>
            console.log test
            @

        addNode: (node) =>
            @

        # makeColumnArray: (width) =>

        #     @
        
        # makeRowArray: (height) =>

        #     @