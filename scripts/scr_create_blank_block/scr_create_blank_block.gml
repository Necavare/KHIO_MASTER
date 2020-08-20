/// scr_create_blank_block(block_x, block_y, total_width, total_height)
/// @description scr_create_blank_block(block_x, block_y, total_width, total_height) returns sprite
/// @param block_x
/// @param block_y
/// @param total_width
/// @param total_height
function scr_create_blank_block(argument0, argument1, argument2, argument3) {

	var bX = argument0;
	var bY = argument1;

	var width = argument2; //width of full map (combined with all blocks)
	var height = argument3; //height of full map (combined with all blocks)
	var alpha = 1; //alpha of objects

	//scaling the size of objects for map
	var yscale = height/room_height; 
	var xscale = width/room_width;


	//size of block for use in creating the surface sprite (5x5 blocks)
	//var blockHeightmm = height/5; //the block height of minimap
	//var blockWidthmm = width/5; //the block width of minimap
	var blockHeightmm = height/global.blockYNum;
	var blockWidthmm = width/global.blockXNum;

	//show_debug_message("blockHeightmm: "+string(blockHeightmm));
	//show_debug_message("blockWidthmm: "+string(blockWidthmm));

	//the size of real space which will be in block
	//var blockHeightR = room_height/5;
	//var blockWidthR = room_width/5;
	var blockHeightR = room_height/global.blockYNum;
	var blockWidthR = room_width/global.blockXNum;

	//position of 0,0 of block in real space
	var blockX0 = blockWidthR*(bX);
	var blockY0 = blockHeightR*(bY);

	//if its within the range of the block real space
	//--------------------------------------------------------------------------------------------
	//the smaller this number, the faster it runs but the larger the more accurately it will draw
	//--------------------------------------------------------------------------------------------
	var xExtra = 250;
	var yExtra = 250;



	//var yscale = 1;
	//var xscale =1;

#region creating the map sprite	

		var surf; //initialize a new surface
		surf = surface_create(blockWidthmm, blockHeightmm); //set the surface to the size of the map
		surface_set_target(surf); //make the code focus that surface
		draw_clear_alpha(c_black, 0); //clear the surface and make the background black
	
		//find all elements in this block ALONE
		//var block_activemm = ds_list_create(); //create list which will be filled
	
		/*
		//fill the list with correct objects
		for(var i=0; i<ds_list_size(global.activemm); i++){
			var ID = ds_list_find_value(global.activemm, i); //find the id of an object in minimap
			var IDArr = ds_map_find_value(global.minimapVar, ID);//find the array of values to use
			var IDX = IDArr[2]; //the real space x position
			var IDY = IDArr[3]; //the real space y position
		
			if((IDX >= blockX0-xExtra) && (IDX <= blockX0+blockWidthR+xExtra) &&
			   (IDY >= blockY0-yExtra) && (IDY <= blockY0+blockHeightR+yExtra)){
				// NOTE: here we should add objects that bleed in at the correct depth but im not 
				//		 doing that yet because i want to make sure everything else works first
			
				ds_list_add(block_activemm,ID);
			}
		}
		*/
	
		//sort array to deal with depth
		//sort_active_list(block_activemm, 0, ds_list_size(block_activemm)-1);
	
		//draw everything that needs to be in the map (background)
		//draw_all_instances_offset_mm(block_activemm, blockX0, blockY0, 0, 0, xscale, yscale, alpha);
	
	
		//create sprite of the map with origin at the top left and remove the back ground
		// WHAT IS THE -1? I DONT REMEMBER WHY THAT IS THEIR SO MAY CAUSE ISSUE IDK
		var blockSprite = sprite_create_from_surface(surf, 0, 0, blockWidthmm, blockHeightmm, 
		false, false, 0, 0);
	
		surface_reset_target();//reset surface target to default
		surface_free(surf); //remove the surface once it has served its purpose
	
		return blockSprite;
	
#endregion



}
