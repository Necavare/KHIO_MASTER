isFlying = true;
isAttacking = false;
isFleeing = false;

dir = irandom_range(0, 1);

bird_health = 3;
isDead = false;
deathAngle = -1;
deathMove = true;

z = 80;

//gun variables
bcontact = false;
canHit = true;

frame = 0;
alarm[2] = 5;

health_ = 10;

// Audio
bird = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(bird, 25, 50, 1);