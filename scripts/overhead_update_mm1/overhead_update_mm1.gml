/// scr_create_map1(width, height)
/// @description scr_create_map1(width, height)
/// @param width
/// @param height
function overhead_update_mm1(argument0, argument1) {

	//changes the global overhead surface as the player moves around by placing circles in it
	var width = argument0; //width of full map
	var height = argument1; //height of full map
	//var alpha = 1;

	//scaling the size of objects for map
	var yscale = height/room_height; 
	var xscale = width/room_width;

	//radius of location to be discovered when moving from place to place (Scaled)
	var radius = 250*xscale;
	//var radius = 500;


	//var yscale = 1;
	//var xscale =1;

#region creating the map sprite	

		 //initialize a new surface
		var surf = surface_create(width, height); //set the surface to the size of the map
		surface_set_target(surf); //make the code focus that surface
		//draw_clear_alpha(c_black, 0); //clear the surface and make the background black
	
		//if their is no current sprite make the initial background
		if(global.mmOverheadSprite == pointer_null){
			draw_set_color($EDF9D3); //using hex code #D3F9ED
			draw_rectangle(0,0,width,height, false);
		}
		else{
			//else draw the old sprite on top
			//draw_sprite(global.mmOverheadSprite, 0,0,0);
			draw_sprite_ext(global.mmOverheadSprite, 0, 0,0, 1, 1, 0, c_white, 1);
			//sprite_delete(global.mmOverheadSprite);
			//draw_set_color($EDF9D3); //using hex code #D3F9ED
			//draw_rectangle(0,0,width,height, false);
		
			//sprite_delete(global.mmOverheadSprite); 
		}
		gpu_set_blendmode(bm_subtract); //change to delet
		draw_set_color(c_black);
		//loop through overhead Arr to draw circles
		//show_debug_message("overheadArr height: "+string(array_height_2d(global.overheadArr)));
		//show_debug_message("overheadArr width: "+string(array_length_2d(global.overheadArr, 1)));
	
		/*
		for (var i = array_height_2d(global.overheadArr) - 1; i > -1; i--;)
	    {
	    for (var j = array_length_2d(global.overheadArr, i) - 1; j > -1; j--;)
	      {
			if(global.overheadArr[i, j]){
				draw_circle(i*xscale, j*yscale, radius, false);
			}
	      }
	    }*/
	
		//from last stopping point continue on (if a new element in one, their is in the other)
	
		var xpos = 0;
		var ypos = 0;
		var tim1 = get_timer();
		/*
		for(var i = 0; i < ds_list_size(global.overheadXList); i++){
				xpos = ds_list_find_value(global.overheadXList, i);
				ypos = ds_list_find_value(global.overheadYList, i);
				draw_circle(xpos*xscale, ypos*yscale, radius, false);
			//global.overheadXIndex = i;
		}*/
	
		var ylistSize = ds_list_size(global.overheadYList);
	
		for(var i = global.overheadXIndex; i < ds_list_size(global.overheadXList); i++){
			xpos = ds_list_find_value(global.overheadXList, i);
			if(i<ylistSize)//make sure their exists a value
				ypos = ds_list_find_value(global.overheadYList, i);
			else
				ypos = ds_list_find_value(global.overheadYList, ylistSize-1);
			draw_circle(xpos*xscale, ypos*yscale, radius, false);
			global.overheadXIndex = i;
		}
		var tim2 = get_timer();
		show_debug_message("overhead_update_mm1 loop time: "+string(tim2-tim1));
		gpu_set_blendmode(bm_normal); //change back
	
	
		//create sprite of the map with origin at the top left and remove the back ground
		var tim3 = get_timer();
	
		if(global.mmOverheadSprite != pointer_null)
			sprite_delete(global.mmOverheadSprite);
		global.mmOverheadSprite = sprite_create_from_surface(surf, 0, 0, width, height, 
		false, false, 0, 0);
		var tim4 = get_timer();
		show_debug_message("overhead_update_mm1 sprite time: "+string(tim4-tim3));
	
	
		surface_reset_target();//reset surface target to default
		surface_free(surf); //remove the surface once it has served its purpose
	
	

#endregion


}
