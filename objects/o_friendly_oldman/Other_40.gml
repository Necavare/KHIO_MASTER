if(point_distance(x,y,o_player.x, o_player.y) > 130){
	playerDetected = false;

	if(!global.watchTower){
		if(room != r_title && !global.generatingEnvironment && point_distance(x,y,o_camera.x, o_camera.y) > 250
			&& !global.generatingGrass && !global.worldShift &&!global.loadingWorld)
			instance_deactivate_object(self);
	}
	else{
		if(room != r_title && !global.generatingEnvironment && point_distance(x,y,o_camera.x, o_camera.y) > 350
			&& !global.generatingGrass && !global.worldShift &&!global.loadingWorld)
			instance_deactivate_object(self);
	}


}