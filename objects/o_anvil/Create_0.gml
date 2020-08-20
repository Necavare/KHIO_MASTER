event_inherited();

if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

z = 0;

// Grabbing
carrySpeed = .015;

health_ = 10;
canHit = true;

// Audio
anvil = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(anvil, 25, 50, 1);

dropPlayed = false;