if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

buildZ = -image_number;

if(!global.generatingEnvironment){
	//take into account room shift
	var nx = x+ global.xoffset;
	var ny = y+global.yoffset;
        
			if (ny < 0) { ny += room_height; }
	        if (ny >= room_height) { ny -= room_height; }
	        if (nx < 0) { nx += room_width; }
	        if (nx >= room_width) { nx -= room_width; }

	//create a minimap version
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

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

// Audio
bedroll = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(bedroll, 25, 50, 1);