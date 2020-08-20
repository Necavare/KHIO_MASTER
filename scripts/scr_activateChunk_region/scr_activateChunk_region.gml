/// scr_activateChunk_region(cenX,cenY, radius)
/// @description scr_activateChunk_region(cenX,cenY, radius) activates all objects in that chunk region
/// @param cenX
/// @param cenY
/// @param radius
function scr_activateChunk_region(argument0, argument1, argument2) {

	var xA = floor(argument0/16);
	var yA = floor(argument1/16);
	var radius = argument2;

	xA-=radius;//start at the top left section of the region
	yA-=radius;

	var gridXSize = ds_grid_width(global.smallChunkGrid);
	var gridYSize = ds_grid_height(global.smallChunkGrid);


	//move down the y of grid
	for(var gridY = 0; gridY < (radius*2)+1; gridY++){
		//move across x of grid
		for(var gridX = 0; gridX < (radius*2)+1; gridX++){
			var activeChunkX = xA+gridX;
			var activeChunkY = yA+gridY;
		
			//make sure its a valid block
			if(activeChunkX > gridXSize){activeChunkX = activeChunkX-gridXSize;}
			else if(activeChunkX < 0){activeChunkX = gridXSize+activeChunkX;}
			if(activeChunkY > gridYSize){activeChunkY = activeChunkY-gridYSize;}
			else if(activeChunkY < 0){activeChunkY = gridYSize+activeChunkY;}
		
			scr_activateChunk(activeChunkX, activeChunkY);
		
		}
	}



}
