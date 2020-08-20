if(!isBuilt) {
	isBuilt = true;
	doorInst.canInteract = true;
	
	if(other.stackCount == 0) {
		other.isCombining = true;
		instance_destroy(other);
		global.grabbed = -1;
	} else 
		other.stackCount--;
}