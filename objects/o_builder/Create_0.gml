if(global.itemEquipped == 0) {
	instance_destroy(self);
	global.isHolding = false;
	global.grabbed = -1;
	global.itemEquipped = -1;
}

// Holds all the buildable objects
buildables = ds_grid_create(15, 2);
ds_grid_clear(buildables, false);

buildables[# 0, 0] = s_snow;

buildables[# 1, 0] = s_wall_wood;
buildables[# 1, 1] = o_wall_wood;

buildables[# 2, 0] = s_door_sides;
buildables[# 2, 1] = o_door_sides;

buildables[# 3, 0] = s_bedroll;
buildables[# 3, 1] = o_bedroll;

buildables[# 4, 0] = s_anvil;
buildables[# 4, 1] = o_anvil;

buildables[# 5, 0] = s_small_crate;
buildables[# 5, 1] = o_small_crate;

buildables[# 6, 0] = s_large_crate;
buildables[# 6, 1] = o_large_crate;

buildables[# 7, 0] = s_spikes_wood;
buildables[# 7, 1] = o_spikes_wood;

buildables[# 8, 0] = s_spikes_metal;
buildables[# 8, 1] = o_spikes_metal;

buildables[# 9, 0] = s_trap_set;
buildables[# 9, 1] = o_trap;

buildables[# 10, 0] = s_firepit;
buildables[# 10, 1] = o_firepit;

buildables[# 11, 0] = s_marker_red_1;
buildables[# 11, 1] = o_marker;

buildables[# 12, 0] = s_lillyofthevalley;
buildables[# 12, 1] = o_lillyofthevalley;

// Building variables
object = -1;
spaceFree = false;

global.buildangle = -1;

// Setting building object
switch(global.itemEquipped) {
	case item.wall: object = 1; break;
	case item.door: object = 2; break;
	case item.bedroll: object = 3; break;
	case item.anvil: object = 4; break;
	case item.smallcrate: object = 5; break;
	case item.largecrate: object = 6; break;
	case item.woodspikes: object = 7; break;
	case item.metalspikes: object = 8; break;
	case item.snaretrap: object = 9; break;
	case item.firepit: object = 10; break;
	case item.marker: object = 11; break;
	case item.lilly: object = 12; break;
}

itemEquip = global.itemEquipped;

if(object == -1) {
	instance_destroy(self);
	global.isHolding = false;
	global.grabbed = -1;
	global.itemEquipped = -1;
}

// Audio
builder = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(builder, 25, 50, 1);