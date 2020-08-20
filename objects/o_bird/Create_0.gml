isLooking = true;
isHop = false;
isFlying = false;

bird_health = 3;
isDead = false;
deathAngle = -1;
deathMove = true;

z = 0;

//gun variables
bcontact = false;
canHit = true;

frame = 0;
alarm[2] = 5;

health_ = 5;

// Audio
bird = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(bird, 25, 50, 1);