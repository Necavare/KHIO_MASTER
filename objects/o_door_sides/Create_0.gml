event_inherited();

isCamp = false;

if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

if(global.loadingWorld){
	global.buildangle = image_angle;
	doorInst = instance_create_depth(x+lengthdir_x(-12, image_angle),y+lengthdir_y(-12, image_angle),depth, o_door_wood);
	isDoorCreated = true;
	isBuilt = true;	
}
else{
	isDoorCreated = false;
	isBuilt = false;	
}

doorInst = -1;

//isBuilt = false;

buildZ = -image_number;

isWall = false;
cycleId = -1;
if(!global.generatingEnvironment){
	var cycleHitbox = instance_create_depth(x,y,1, o_wall_cycle_hitbox);
	cycleHitbox.image_angle = image_angle;
	var adjacency_list_var = ds_list_create();

	with(cycleHitbox){
		instance_place_list(x, y, o_wall_wood, adjacency_list_var, false);
		instance_place_list(x, y, o_door_sides, adjacency_list_var, false);
	}

	adjacency_list = ds_list_create();
	ds_list_copy(adjacency_list, adjacency_list_var);
	ds_list_destroy(adjacency_list_var);

	cycleId = scr_cycleCheck(adjacency_list);
	if(cycleId != -1)
		show_debug_message("CYCLE: "+string(cycleId));
}

