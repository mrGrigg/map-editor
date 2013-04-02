Map Editor
==========

Tile based map editor using backbone.js and coffee-script.

Currently everything's saved in local storage. I also don't think you'll have much luck running this outside of Chrome right now.

Mostly for my reference, this is the coffee command to compile and monitor the project:  
`coffee -o public/js/ -cw public/src/`

I also recommend using nodemon during development:  
`nodemon app.js`

Using this thing:  
Create a new map, give it a name and a size. The largest map in the game right now is 124x124, rendering that right now, with now tiles, is kind of slow, so be careful.

Select a tile from the palette and click the nodes to add that tile to those nodes.
