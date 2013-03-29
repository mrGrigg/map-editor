define ->
    class Node extends Backbone.Model
        defaults:
            x: 0
            y: 0
            move: 1
            damage: 0
            action:
                search: ''
                talk: ''
                stairs: ''
            encounter:
                level: [2,5]
                monster: 'range'
                percentage: .25
            autoAction: null

        initialize: =>
            @.set 'id', "#{@get('x')}-#{@get('y')}"