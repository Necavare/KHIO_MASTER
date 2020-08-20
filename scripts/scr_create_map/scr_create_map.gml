/// scr_create_map(width, height, alpha)
/// @description scr_create_map(width, height, alpha)
/// @param width
/// @param height
/// @param alpha
function scr_create_map(argument0, argument1, argument2) {


	var width = argument0; //width of full map
	var height = argument1; //height of full map
	var alpha = argument2; //alpha of objects

	//scaling the size of objects for map
	var yscale = height/room_height; 
	var xscale = width/room_width;
	//var yscale = 1;
	//var xscale =1;

#region creating the map sprite	

		var surf; //initialize a new surface
		surf = surface_create(width, height); //set the surface to the size of the map
		surface_set_target(surf); //make the code focus that surface
		draw_clear_alpha(c_black, 0); //clear the surface and make the background black
	
		//sort array to deal with depth
		qsort_active_list(global.activemm, 0, ds_list_size(global.activemm)-1);
	
		//draw everything that needs to be in the map (background)
		draw_all_instances_mm(global.activemm, 0, 0, xscale, yscale, alpha);
	
		/*
		//draw player reference (super cedes map to show objvious position)
		draw_sprite_ext(s_player_mm, 0, ((o_player.x+global.xoffset)*xscale), 
		((o_player.y+global.yoffset)*yscale), 0.5, 0.5, 0, -1, 1); 
		*/
	
		//create sprite of the map with origin at the top left and remove the back ground
	
		global.mmSprite = sprite_create_from_surface(surf, 0, 0, width-1, height-1, 
		true, false, 0, 0);
	
		surface_reset_target();//reset surface target to default
		surface_free(surf); //remove the surface once it has served its purpose
	

#endregion



}
