require ['require', 'config'], (require) ->
    require ['backbone'], () ->
        require ['routes', 'views/EditorMain'], (Routes, EditorMain) ->
            editorMain = new EditorMain
            editorMain.render()

            routes = new Routes
            Backbone.history.start {pushState: true}

            return