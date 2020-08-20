depth = 8999;

//type = irandom_range(0,9);

biome = 0; // 0 = field, 1 = birch, 2 = spruce
switch(biome) {
	case 0: sprite_index = s_snow_field; break;
	case 1: sprite_index = s_snow_birch; break;
	case 2: sprite_index = s_snow_spruce; break;
}

isCovered = false;
	
//create a minimap version (dont do it while dynamically generating tho)
if(!global.generatingEnvironment){
	
	//take into account room shift
	var nx = x+ global.xoffset;
	var ny = y+global.yoffset;
        
			if (ny < 0) { ny += room_height; }
	        if (ny >= room_height) { ny -= room_height; }
	        if (nx < 0) { nx += room_width; }
	        if (nx >= room_width) { nx -= room_width; }


	var miniValues;
	miniValues[0] = sprite_index; //set sprite for minimap
	miniValues[1] = image_angle; //set angle of rotation
	miniValues[2] = nx; //x position
	miniValues[3] = ny; //y position
	miniValues[4] = ny; //general depth, some objects can set this to 0 or other small number if bottom layer

	ds_map_add(global.minimapVar, id, miniValues);
	ds_list_add(global.activemm, id); //add it to list of active minimap symbols
	if(!global.generatingEnvironment){ // if its not being generated
		//scr_refresh_update(nx,ny);	//update minimap
	}
}


//instance_destroy(self);