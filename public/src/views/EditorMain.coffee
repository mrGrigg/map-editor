define ->
    class EditorMain extends Backbone.View
        el: 'body'
        initialize: =>
            Backbone.Events.on 'modal:show', @showModal, @
            Backbone.Events.on 'modal:hide', @hideModal, @
            Backbone.Events.on 'render:childView', @renderChild, @

        render: =>
            @

        renderChild: (View, model) =>
            if @childView?
                @childView.remove()

            if View?
                @childView = new View {model: model}
                @$el.append @childView.render().el

            @

        showModal: (Modal) =>
            if Modal?
                @$el.append('<div class="overlay"></div>')
                @modalView = new Modal
                @$el.append @modalView.render().el

        hideModal: =>
            @$('.overlay').remove();
            if @modalView?
                @modalView.remove();