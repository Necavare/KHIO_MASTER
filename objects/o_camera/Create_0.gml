// Camera effects
shake = 0;
inst = -1;
// Centering camera
center_camera = false;

// Camera decay
last_side = false;
delay_loops = 0;

//before the first deactivation so that the whole map is viewable
/*
with(all){ //with all active instances
	if(ds_map_exists(global.minimapVar, id)){ //if its a minimapable thing
		if(!ds_list_find_index(global.activemm,id))//if it is not registered active
			ds_list_add(global.activemm, id); //add it to list of active minimap symbols
	}
}*/

room_center_x = room_width / 2;
room_center_y = room_height / 2;

roomShift = false;

angle = 0;

if(room == r_new || room == r_testing || room == r_cave) {
	x = o_player.x;
	y = o_player.y;
}

deactivateFrame = -1;

setupActivation = true;
activationQueue = ds_queue_create();

initialAngleChange = false;

roomShiftDelay = false;
roomShiftDelayTick = 0;

global.targetObject = -1;