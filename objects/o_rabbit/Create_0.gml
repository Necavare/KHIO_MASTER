// Movement
isLooking = true;
isJumping = false;
isFleeing = false;

frame = 0;
alarm[1] = 4;

// Killing
chopFrame = 0;
rabbit_health = 5;
isDead = false;
deathAngle = -1;
deathMove = true;

//gun variables
bcontact = false;
canHit = true;
damageTick = false;
damageTickStatus = 0; //0 nothing, 1 poison, 2 fire

// Traps
isAttracted = false;
neverAttracted = false;
isTrapped = false;

health_ = 10;

inBush = false;

// Audio
rabbit = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(rabbit, 25, 50, 1);