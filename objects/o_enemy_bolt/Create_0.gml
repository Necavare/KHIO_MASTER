image_xscale = 0.5;
image_yscale = 0.5;
bulletdamage = 5;
doOnce = true;
image_angle = 0;
bulletfirex = 0;
bulletfirey = 0;

// 0 = normal | 1 = poison | 2 = flame
boltType = 0;


// Audio
bullet = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(bullet, 25, 50, 1);