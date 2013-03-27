define ['text!templates/newMapModal.html'], (template) ->
    class NewMapModal extends Backbone.View
        className: 'new-map modal'
        events:
            'click .cancel': 'closeDialog'
            'click .make-map': 'makeNewMap'

        initialize: =>

        render: =>
            modalTemplate = Handlebars.compile template
            this.$el.html modalTemplate

            this

        closeDialog: =>
            Backbone.Events.trigger 'modal:hide'
            
        makeNewMap: =>
            #Create the new map with the form values
            newMap =
                'name': this.$('.map-name').val()
                'width': this.$('.map-width').val()
                'height': this.$('.map-height').val()
                'id': @guid()

            mapStorageObject = JSON.stringify newMap
            localStorage.setItem newMap.id, mapStorageObject

            Backbone.Events.trigger 'modal:hide'
            Backbone.history.navigate "/edit/#{newMap.id}", true


        #Hacky guid for dev
        guid: => 
            @s4() + @s4()

        s4: =>
            random = Math.floor((1 + Math.random()) * 0x10000)
                 .toString(16)
                 .substring(1);

            random