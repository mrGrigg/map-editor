define ['text!templates/newMapModal.html', 'models/Map'], (template, Map) ->
    class NewMapModal extends Backbone.View
        className: 'new-map modal'
        events:
            'click .cancel': 'closeDialog'
            'click .make-map': 'makeNewMap'

        initialize: =>

        render: =>
            modalTemplate = Handlebars.compile template
            @$el.html modalTemplate

            @

        closeDialog: =>
            Backbone.Events.trigger 'modal:hide'
            
        makeNewMap: =>
            #Create the new map with the form values
            map =
                'name': @$('.map-name').val()
                'width': parseInt @$('.map-width').val(), 10
                'height': parseInt @$('.map-height').val(), 10
                'id': @guid()

            Backbone.Events.trigger 'map:create', map
            Backbone.Events.trigger 'modal:hide'

        #Hacky guid for dev
        guid: => 
            @s4() + @s4()

        s4: =>
            random = Math.floor((1 + Math.random()) * 0x10000)
                 .toString(16)
                 .substring(1);

            random