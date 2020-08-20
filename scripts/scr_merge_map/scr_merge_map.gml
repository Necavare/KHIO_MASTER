/// scr_merge_map(sprite_array, width, height)
/// @description scr_merge_map(sprite_array, width, height)
/// @param sprite_array
/// @param width
/// @param height
function scr_merge_map(argument0, argument1, argument2) {

	if(global.minimapUpdated){

	var sprArr = argument0;
	var width = argument1; //width of full map
	var height = argument2; //height of full map
	//var alpha = 1; //alpha of objects

	//scaling the size of objects for map
	//var yscale = height/room_height; 
	//var xscale = width/room_width;

	//size of block for use in creating the surface sprite (5x5 blocks)
	var blockHeightmm = height/global.blockYNum; //the block height of minimap
	var blockWidthmm = width/global.blockXNum; //the block width of minimap

#region creating the map sprite	

		var surf; //initialize a new surface
		surf = surface_create(width, height); //set the surface to the size of the map
		surface_set_target(surf); //make the code focus that surface
		draw_clear_alpha(c_black, 0); //clear the surface and make the background black
	
	
		var iv = 0;
		var tim1 = get_timer();
	
		//************************
		//      normal loop
		//************************
		for(bx = 0; bx < global.blockXNum; bx++){
			for(by = 0; by < global.blockYNum; by++){
				draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
				//draw_sprite(sprArr[iv], 0 , bx, by);
				iv++;
			}
		}
	
		/*
		//***********************************************
		//    true unrolling (insignificantly faster)
		//***********************************************
		//0
		draw_sprite(sprArr[0],0,0*blockWidthmm, 0*blockHeightmm);
		draw_sprite(sprArr[1],0,0*blockWidthmm, 1*blockHeightmm);
		draw_sprite(sprArr[2],0,0*blockWidthmm, 2*blockHeightmm);
		draw_sprite(sprArr[3],0,0*blockWidthmm, 3*blockHeightmm);
		draw_sprite(sprArr[4],0,0*blockWidthmm, 4*blockHeightmm);
		//1
		draw_sprite(sprArr[5],0,1*blockWidthmm, 0*blockHeightmm);
		draw_sprite(sprArr[6],0,1*blockWidthmm, 1*blockHeightmm);
		draw_sprite(sprArr[7],0,1*blockWidthmm, 2*blockHeightmm);
		draw_sprite(sprArr[8],0,1*blockWidthmm, 3*blockHeightmm);
		draw_sprite(sprArr[9],0,1*blockWidthmm, 4*blockHeightmm);
		//2
		draw_sprite(sprArr[10],0,2*blockWidthmm, 0*blockHeightmm);
		draw_sprite(sprArr[11],0,2*blockWidthmm, 1*blockHeightmm);
		draw_sprite(sprArr[12],0,2*blockWidthmm, 2*blockHeightmm);
		draw_sprite(sprArr[13],0,2*blockWidthmm, 3*blockHeightmm);
		draw_sprite(sprArr[14],0,2*blockWidthmm, 4*blockHeightmm);
		//3
		draw_sprite(sprArr[15],0,3*blockWidthmm, 0*blockHeightmm);
		draw_sprite(sprArr[16],0,3*blockWidthmm, 1*blockHeightmm);
		draw_sprite(sprArr[17],0,3*blockWidthmm, 2*blockHeightmm);
		draw_sprite(sprArr[18],0,3*blockWidthmm, 3*blockHeightmm);
		draw_sprite(sprArr[19],0,3*blockWidthmm, 4*blockHeightmm);
		//4
		draw_sprite(sprArr[20],0,4*blockWidthmm, 0*blockHeightmm);
		draw_sprite(sprArr[21],0,4*blockWidthmm, 1*blockHeightmm);
		draw_sprite(sprArr[22],0,4*blockWidthmm, 2*blockHeightmm);
		draw_sprite(sprArr[23],0,4*blockWidthmm, 3*blockHeightmm);
		draw_sprite(sprArr[24],0,4*blockWidthmm, 4*blockHeightmm);
		*/
		var tim2 = get_timer();
		show_debug_message("scr_merge_map loop time: "+string(tim2-tim1));
		/*
		//draw player reference (super cedes map to show objvious position)
		draw_sprite_ext(s_player_mm, 0, ((o_player.x+global.xoffset)*xscale), 
		((o_player.y+global.yoffset)*yscale), 0.5, 0.5, 0, -1, 1); 
		*/
	
		//create sprite of the map with origin at the top left and remove the back ground
		var tim3 = get_timer();
	
		if(global.mmSprite!=pointer_null)
			sprite_delete(global.mmSprite);
		
		global.mmSprite = sprite_create_from_surface(surf, 0, 0, width-1, height-1, 
		false, false, 0, 0);
		//s_map = sprite_create_from_surface(surf, 0, 0, width-1, height-1, true, false, 0, 0);
		var tim4 = get_timer();
		show_debug_message("scr_merge_map sprite time: "+string(tim4-tim3));
	
		//var tim5 = get_timer();
		//sprite_create_from_surface(surf, 0, 0, width-1, height-1, true, false, 0, 0);
		//var tim6 = get_timer();
		//show_debug_message("scr_merge_map sprite time2: "+string(tim6-tim5));
	
		surface_reset_target();//reset surface target to default
		surface_free(surf); //remove the surface once it has served its purpose
	

#endregion

	global.minimapUpdated = false;

	}

	//after merging only then update overhead
	overhead_update_mm1(mapWidth/5, mapHeight/5);


}
