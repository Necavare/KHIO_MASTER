if(!global.generatingEnvironment){
	depth = 8998;
	/*
	if(housePointer!=pointer_null && doOnce){
		doorPointer = housePointer.instDoor;
		backPointer = housePointer.instBack;
		sideLPointer = housePointer.instSideL;
		sideRPointer = housePointer.instSideR;
		doOnce = false;
	}*/

	if(place_meeting(x,y,o_player)) {
		instRoof.drawRoof = false;
		global.playerInBuilding = true;
	} else {
		instRoof.drawRoof = true;
		global.playerInBuilding = false;
	}

	instRoof.image_angle = image_angle;
}