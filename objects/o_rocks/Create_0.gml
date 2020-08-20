z = 0;

// Grabbing
carrySpeed = .05;

// Stacking rocks
stackCount = 0;

// Spawning
bounce = true;
spawnCount = 0;

var type = irandom_range(0, 2);

if(type == 0) 
	sprite_index = s_rock;
else if(type == 1)
	sprite_index = s_rock1;
else if(type == 2)
	sprite_index = s_rock2;
	
event_inherited();

global.rock_angle = 0;

// Audio
rockEmitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(rockEmitter, 25, 50, 1);