if(isCamp || room==r_testing)
	logCount = 2;

if(!global.generatingEnvironment && !global.loadingWorld &&  spawnStartingEnemy){
	alarm[9] = 60*60;//1 minutes after starting
	spawnStartingEnemy = false;
}

if(logCount > 0) {
	isLit = true;
	alarm[6] = -1;
}

if(point_distance(x,y,o_player.x,o_player.y) < 450 && isLit && !audio_is_playing(sn_fire) && logCount > 0) {
	audio_emitter_position(fire, x, y, 0);
	audio_play_sound_on(fire, sn_fire, true, 1);
} else if((point_distance(x,y,o_player.x,o_player.y) > 450 || !isLit || logCount <= 0 ) && audio_is_playing(sn_fire)) {
	audio_stop_sound(sn_fire);
}
	
if(hotCoals && !isLit && alarm[6] == -1) // Hot coals stay for 5 minutes
	alarm[6] = 60 * 60 * 5; 

if(buildZ < 0)
	buildZ+=.5;

if(!bloomeryDoOnce && isBloomery >= 32 && room == r_new){
	if(ds_list_find_index(global.activemm, id)){
		show_debug_message("replacing bloomery");
		oldVals = ds_map_find_value(global.minimapVar, id);
		var miniValuesN;
		miniValuesN[0] = s_bloomery_4; //set sprite for minimap
		miniValuesN[1] = oldVals[1]; //set angle of rotation
		miniValuesN[2] = oldVals[2]; //x position
		miniValuesN[3] = oldVals[3]; //y position
		miniValuesN[4] = oldVals[4];
		ds_map_replace(global.minimapVar, id, miniValuesN);
	}
	bloomeryDoOnce = true;
}

if(room == r_title) {
	logCount = 2;
	repeat(6)
		if(isBloomery == -1) {
			var flame = instance_create_depth(x+irandom_range(-5,5),y+irandom_range(-5,5),depth+1, o_effect_fire);
			flame.createAsh = false;
		} else if(isBloomery > 23) {
			var flame = instance_create_depth(x+irandom_range(-4,4),y+irandom_range(-4,3),depth-1, o_effect_fire);
			flame.z = 14;
			flame.createAsh = false;
		} else if(isBloomery < 23) {
			var flame = instance_create_depth(x+irandom_range(-5,5),y+irandom_range(-5,5),depth+1, o_effect_fire);
			flame.createAsh = false;
		}
}

// Flame effect
if(!global.generatingEnvironment){
	if(logCount > 0 && isLit) {
		repeat(6)
			if(isBloomery == -1) {
				var flame = instance_create_depth(x+irandom_range(-5,5),y+irandom_range(-5,5),depth+1, o_effect_fire);
				flame.createAsh = false;
			} else if(isBloomery > 23) {
				var flame = instance_create_depth(x+irandom_range(-4,4),y+irandom_range(-4,3),depth-1, o_effect_fire);
				flame.z = 14;
				flame.createAsh = false;
			} else if(isBloomery < 23) {
				var flame = instance_create_depth(x+irandom_range(-5,5),y+irandom_range(-5,5),depth+1, o_effect_fire);
				flame.createAsh = false;
			}
	}
	
	if(logCount > 0 && !isLit) {
		isLit = true;
	}

if(isLit && !hotCoals && collision_circle(x,y, 70, o_player, true, false)) {
	o_player.nearWarmth = true;
} else
	o_player.nearWarmth = false;

	// Setting alarm to burn logs
	if(isLit && alarm[0] == -1)
		alarm[0] = room_speed * 300; // Takes 5 minutes to burn 1 log

	// Smelting
	if(isBloomery == 32 && isLit && items[# 0, 0] == item.compound && count[# 0, 0] > 0 && alarm[3] == -1)
		alarm[3] = room_speed * 5; // Takes 5 seconds to burn 1 compound
	
	// Checking for cookable items
	if((items[# 0, 0] == item.meat || items[# 0, 0] == item.human || items[# 0, 0] == item.fungi) && isLit && alarm[1] == -1) {
		alarm[1] = room_speed * 5; // Takes 5 seconds to cook one food
	}

	// Creating light source
	/*if(!instance_exists(o_light) && isLit) {
		var inst = instance_create_depth(x,y,depth,o_light);
		inst.parent = self;
	}*/

	// Setting item slot to empty
	if(count[# 0, 0] == 0)
		items[# 0, 0] = 0;
}

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit && isBloomery < 0)
	take_hit(self, 1);
	
if(health_ <= 0)
	instance_destroy(self);