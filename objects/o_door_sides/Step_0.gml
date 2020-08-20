if(isCamp) {
	isBuilt = true;
}

if(!isDoorCreated && isBuilt) {
	global.buildangle = image_angle;
	doorInst = instance_create_depth(x+lengthdir_x(-12, image_angle),y+lengthdir_y(-12, image_angle),depth, o_door_wood);
	if(isCamp)
		doorInst.isCamp = true;
	isDoorCreated = true;
}

if(isCamp && instance_exists(doorInst)) {
	doorInst.isLocked = false;
	doorInst.canInteract = false;
}

if(!instance_exists(doorInst))
	instance_destroy(self);
	
if(buildZ < 0)
	buildZ++;