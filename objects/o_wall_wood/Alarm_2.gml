var logId = 1000000;

for(var i = 0; i < 17; i+=4) {
	var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
	if (yy < 0) { yy += room_height; }
	if (yy >= room_height) { yy -= room_height; }
	if (xx < 0) { xx += room_width; }
	if (xx >= room_width) { xx -= room_width; }
	
	// add logs to minimap
	if(i = 0 && logs > 0) {
		var log1S;
		if(logType[0] == 0)
			log1S = s_birch_log;
		if(logType[0] == 1)
			log1S = s_spruce_log
		var miniValues1S;
		miniValues1S[0] = log1S; //set sprite for minimap
		miniValues1S[1] = image_angle; //set angle of rotation
		miniValues1S[2] = xx; //x position
		miniValues1S[3] = yy; //y position
		miniValues1S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
		ds_map_add(global.minimapVar, id+logId+1, miniValues1S);
		ds_list_add(global.activemm, id+logId+1); //add it to list of active minimap symbols
		
	} else if(i = 4 && logs > 1) {
		var log2S;
		if(logType[1] == 0)
			log2S = s_birch_log;
		if(logType[1] == 1)
			log2S = s_spruce_log;

		var miniValues2S;
		miniValues2S[0] = log2S; //set sprite for minimap
		miniValues2S[1] = image_angle; //set angle of rotation
		miniValues2S[2] = xx; //x position
		miniValues2S[3] = yy; //y position
		miniValues2S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
		ds_map_add(global.minimapVar, id+logId+2, miniValues2S);
		ds_list_add(global.activemm, id+logId+2); //add it to list of active minimap symbols
		
	} else if(i = 8 && logs > 2) {
		var log3S;
		if(logType[2] == 0)
			log3S = s_birch_log;
		if(logType[2] == 1)
			log3S = s_spruce_log;

		var miniValues3S;
		miniValues3S[0] = log3S; //set sprite for minimap
		miniValues3S[1] = image_angle; //set angle of rotation
		miniValues3S[2] = xx; //x position
		miniValues3S[3] = yy; //y position
		miniValues3S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
		ds_map_add(global.minimapVar, id+logId+3, miniValues3S);
		ds_list_add(global.activemm, id+logId+3); //add it to list of active minimap symbols
		
	} else if(i = 12 && logs > 3) {
		var log4S;
		if(logType[3] == 0)
			log4S = s_birch_log;
		if(logType[3] == 1)
			log4S = s_spruce_log;

		var miniValues4S;
		miniValues4S[0] = log4S; //set sprite for minimap
		miniValues4S[1] = image_angle; //set angle of rotation
		miniValues4S[2] = xx; //x position
		miniValues4S[3] = yy; //y position
		miniValues4S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
		ds_map_add(global.minimapVar, id+logId+4, miniValues4S);
		ds_list_add(global.activemm, id+logId+4); //add it to list of active minimap symbols
		
	} else if(i = 16 && logs > 4) {
		var log5S;
		if(logType[4] == 0)
			log5S = s_birch_log;
		if(logType[4] == 1)
			log5S = s_spruce_log;

		var miniValues5S;
		miniValues5S[0] = log5S; //set sprite for minimap
		miniValues5S[1] = image_angle; //set angle of rotation
		miniValues5S[2] = xx; //x position
		miniValues5S[3] = yy; //y position
		miniValues5S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
		ds_map_add(global.minimapVar, id+logId+5, miniValues5S);
		ds_list_add(global.activemm, id+logId+5); //add it to list of active minimap symbols
	}
	// Drawing metal wall
	if(i = 0 && upgraded){
		var miniValues6S;
		miniValues6S[0] = s_wall_metal; //set sprite for minimap
		miniValues6S[1] = image_angle; //set angle of rotation
		miniValues6S[2] = xx; //x position
		miniValues6S[3] = yy; //y position
		miniValues6S[4] = yy; //general depth, some objects can set this to 0 or other small number if bottom layer
		ds_map_add(global.minimapVar, id+logId+6, miniValues6S);
		ds_list_add(global.activemm, id+logId+6); //add it to list of active minimap symbols	
	}
}