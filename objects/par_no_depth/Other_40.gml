

if(object_index != o_weather
	&& object_index != o_builder 
	&& object_index != o_camera
	&& object_index != o_hud
	&& object_index != o_shaders
	&& object_index != o_initializer) {
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