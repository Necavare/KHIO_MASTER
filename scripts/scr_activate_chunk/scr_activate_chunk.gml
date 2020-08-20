/// scr_activate_chunk(chunkN)
/// @description scr_activate_chunk(chunkN)
/// @param chunkN
function scr_activate_chunk(argument0) {

	var chunkN = argument0;
	//*************************************************************************************
	// this function will take in a chunkN and activate the region of that chunk
	//*************************************************************************************


			//************************
			//      normal loop
			//************************
			var iv = 0;
			//find the bx and by values from the i value
			var bx = 0;
			var by = 0;
			for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
				for(var by2 = 0; by2 < global.blockYNum; by2++){
					if(iv == chunkN){
						bx = bx2;
						by = by2;
					}
				
					//draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
					iv++;
				}
			}
		
			var blockHeightR = room_height/global.blockYNum;
			var blockWidthR = room_width/global.blockXNum;

			//position of 0,0 of block in fake space
			var blockX0 = blockWidthR*(bx);
			var blockY0 = blockHeightR*(by);
		
			//real position
			blockX0 = blockX0-global.xoffset;//set x and y to the top positions
			blockY0 = blockY0-global.yoffset; //(the actual position shouldnt be offset)

			//find their old positions by going backwards with offset
			if (blockY0 < 0) { blockY0 += room_height; }
			if (blockY0 >= room_height) { blockY0 -= room_height; }
			if (blockX0 < 0) { blockX0 += room_width; }
			if (blockX0 >= room_width) { blockX0 -= room_width; }

			show_debug_message("----------------------------------------");
			show_debug_message("	 ACTIVATING CHUNK ::  "+string(chunkN));
			show_debug_message("     bx: "+string(bx));
			show_debug_message("     by: "+string(by));
			show_debug_message("     blockX0: "+string(blockX0));
			show_debug_message("     blockY0: "+string(blockY0));
			show_debug_message("	 width: "+string(blockWidthR));
			show_debug_message("	 height: "+string(blockHeightR));
			show_debug_message("----------------------------------------");
			global.generatingGrass = true;
			instance_activate_region(blockX0, blockY0, blockWidthR, blockHeightR, true);


}
