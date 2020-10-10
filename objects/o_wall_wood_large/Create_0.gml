upgraded = false;

canHit = true;

// Flammable stuff
z = 0;
health_ = 30;
event_inherited();
isLong = true;
createAsh = false;

// Audio
log = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(log, 25, 50, 1);

