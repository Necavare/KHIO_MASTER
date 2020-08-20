campId = -1;//-1 is no camp
isCamp = true;

if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

buildZ = -image_number;

logs = 5;
logType[0] = 1;
logType[1] = 1;
logType[2] = 1;
logType[3] = 1;
logType[4] = 1;
canAdd = true;

lastLogs = logs;

canHit = true;

upgraded = false;

sprite_index = s_wall_wood;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

//if(global.generatingEnvironment)
	//image_angle = o_generatorN.generatorWallAngle;
event_inherited();

if(!global.generatingEnvironment && !global.loadingWorld){
	alarm[2] = 1;
}
//create a minimap version (dont do it while dynamically generating tho)

// Flammable stuff
z = 0;
health_ = 5 + (logs * 3);
if(upgraded)
	health_ = 15 + (logs * 2);
event_inherited();
isLong = true;

isWall = true;
cycleId = -1;
//check for parent and cycle
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

// Audio
log = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(log, 25, 50, 1);