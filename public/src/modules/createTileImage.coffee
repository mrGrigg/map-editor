define ['modules/Tiles'], (Tiles) ->
    (name) ->
        image = document.createElement 'img'
        image.height = 32
        image.width = 32
        image.src = Tiles[name]
        image.title = name

        image