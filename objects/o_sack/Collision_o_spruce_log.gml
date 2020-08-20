if(global.grabbed == other && logs != 2 && rocks == 0 && canAdd) {
	if(logs == 0) {
		if(other.stackCount == 0) {
			logs = 1;
			spruce = true;
			instance_destroy(other);
			global.grabbed = -1;
		} else if(other.stackCount == 1) {
			logs = 2;
			spruce = true;
			birch = other.birch;
				
			instance_destroy(other);
			global.grabbed = -1;
		}
	} else if(logs == 1) {
		if(other.stackCount == 0) {
			logs = 2;
			spruce = true;
			instance_destroy(other);
			global.grabbed = -1;
		} else if(other.stackCount == 1) {
			logs = 2;
			spruce = true;
			birch = other.birch;
			other.stackCount--;
		}
	}
}