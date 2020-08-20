alarm[0] = 30;

z = 0;

explode = false;
isExploded = false;

// Audio
grenade = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(grenade, 25, 50, 1);