//event_inherited();

createAsh = true;
isOnFire = false;
fireAmount = 1;

isDoor = false;
isLong = false;

alarm[1] = 60;

// Audio
fireEmitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(fireEmitter, 25, 50, 1);