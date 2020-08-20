if(!isBuilt) {
	isBuilt = true;
	
	if(other.stackCount == 0) {
		instance_destroy(other);
		global.grabbed = -1;
	} else 
		other.stackCount--;
		
	sprite_index = s_tower_log_birch;
}