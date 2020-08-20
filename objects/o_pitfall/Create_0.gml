depth = 8999;

isTrapped = true;
isEnemy = true;
frame = -1;

// Audio
spike = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(spike, 25, 50, 1);