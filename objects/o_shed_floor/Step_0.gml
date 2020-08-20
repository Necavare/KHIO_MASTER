if(!global.generatingEnvironment){
	if(instance_exists(instRoof)){
		instRoof.image_angle = image_angle;

		if(place_meeting(x,y,o_player)) {
			instRoof.drawRoof = false;
			global.playerInBuilding = true;
		}
	}

	depth = 8998;
}