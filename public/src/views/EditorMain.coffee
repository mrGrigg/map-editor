define ->
    class EditorMain extends Backbone.View
        el: 'body'
        initialize: =>
            Backbone.Events.on 'modalShow', @showModal, this
            Backbone.Events.on 'modalHide', @hideModal, this
            Backbone.Events.on 'renderChildView', @renderChild, this

        render: =>
            this

        renderChild: (View, model) =>
            if @childView?
                @childView.remove()

            if View?
                @childView = new View {model: model}
                this.$el.append @childView.render().el

        showModal: (Modal) =>
            if Modal?
                this.$el.append('<div class="overlay"></div>')
                @modalView = new Modal
                this.$el.append @modalView.render().el

        hideModal: =>
            this.$('.overlay').remove();
            if @modalView?
                @modalView.remove();