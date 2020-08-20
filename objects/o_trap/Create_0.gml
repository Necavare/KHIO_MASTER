// Inherit the parent event
event_inherited();

if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

buildZ = -image_number;

isSet = true;

// Flammable stuff
z = 0;
health_ = 1;
event_inherited();
isLong = true;

canHit = true;

// Audio
spike = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(spike, 25, 50, 1);
trapPlayed = false;