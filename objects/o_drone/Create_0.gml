// Inherit the parent event
event_inherited();

dir = -1;
player = false;
alarm[0] = 1;

playerTargeted = false;
canTarget = true;

z = 93;

health_ = 5;
canHit = true;
dead = false;
lightOff = false;

// Audio
drone = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(drone, 25, 50, 1);

explode = false;
isExploded = false;

instance_create_depth(x,y,depth,o_drone_range);