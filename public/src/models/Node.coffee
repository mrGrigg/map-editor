define ->
    class Node extends Backbone.Model
        defauts:
            x: 0
            y: 0
            name: 'grass'
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
