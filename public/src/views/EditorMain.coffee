define ->
    class EditorMain extends Backbone.View
        el: 'body'
        initialize: =>
            Backbone.Events.on 'modal:show', @showModal, this
            Backbone.Events.on 'modal:hide', @hideModal, this
            Backbone.Events.on 'render:childView', @renderChild, this

        render: =>
            @

        renderChild: (View, model) =>
            if @childView?
                @childView.remove()

            if View?
                @childView = new View {model: model}
                this.$el.append @childView.render().el

            @

        showModal: (Modal) =>
            if Modal?
                this.$el.append('<div class="overlay"></div>')
                @modalView = new Modal
                this.$el.append @modalView.render().el

        hideModal: =>
            this.$('.overlay').remove();
            if @modalView?
                @modalView.remove();