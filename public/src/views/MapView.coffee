define [
    'views/NodeView'
    'models/Node'
    ], (NodeView, Node) ->
    class MapView extends Backbone.View
        className: 'map-canvas'

        events: 
            'mouseenter .map-container': 'mouseEnter'
            'mouseleave .map-container': 'mouseLeave'

        initialize: =>
            Backbone.Events.on 'node:create', @addNode

            @height = @model.get('height')
            @width = @model.get('width')

        render: =>
            if @height < 15
                @$el.css 'height': @height * 32

            if @width < 20
                @$el.css 'width': @width * 32

            mapHeight = if @height > 15 then 15 else @height
            mapWidth = if @width > 20 then 20 else @width

            
            mapNodes = @drawNodes @generateNodeArray()

            @$el.append mapNodes
            @

        generateNodeArray: =>
            #Draw the initial 640 x 480 grid
            nodeArray = new Array @height
            for y in [0..@height - 1]
                #Todo: Is this an option to try out curry?
                do (y) =>
                    nodeArray[y] = new Array @width

                    for x in [0..@width - 1]
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

            map.className = 'map-container'

            map.style.width = @height * 32 + 'px'
            map.style.height = @width * 32 + 'px'

            map.setAttribute 'draggable', true

            map

        addNode: (node) =>
            @collection.add node
            @

        mouseEnter: (event) =>
            event.currentTarget.classList.add 'mouse-over'
            $(document).on('keypress', @keyPress)
            $(document).on('keyup', @keyUp)

        mouseLeave: (event) =>
            event.currentTarget.classList.remove 'move'
            event.currentTarget.classList.remove 'mouse-over'
            $(document).off('keypress', @keyPress)
            $(document).off('keyup', @keyUp)

        keyPress: (event) =>
            code = event.keyCode || event.which
            if code is 32 and not @keypress
                @keypress = true
                @$('.mouse-over').addClass('move')
                @$('.mouse-over').attr('draggable', true)

        keyUp: (event) =>
            @keypress = false
            @$('.mouse-over').removeClass('move')
            @$('.mouse-over').removeAttr('draggable')
