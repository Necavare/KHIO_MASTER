//image_xscale = 0.25;
//image_yscale = 1;
bulletdamage = 10;
image_angle = o_weapon.fireangle;
bulletfirex = o_weapon.firex;
bulletfirey = o_weapon.firey;
move_towards_point(bulletfirex, bulletfirey, 15); //pew pew

// Audio
bullet = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(bullet, 25, 50, 1);