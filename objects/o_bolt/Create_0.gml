image_xscale = 1;
image_yscale = 1;
bulletdamage = 5;
image_angle = o_weapon.fireangle;
bulletfirex = o_weapon.firex;
bulletfirey = o_weapon.firey;
move_towards_point(bulletfirex, bulletfirey, 15); //pew pew

// 0 = normal, 1 = poison, 2= fire, 3=bone normal, 4=bone poison, 5=flint normal, 6= flint poison,
// 7 = metal normal, 8 = metal poison
boltType = 0;

doOnce = true;

// Audio
weapon = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(weapon, 25, 50, 1);

// Audio
bullet = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(bullet, 25, 50, 1);