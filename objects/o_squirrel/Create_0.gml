// Movement
isLooking = true;
isMoving = false;
isFleeing = false;

frame = 0;
alarm[1] = 4;

// Killing
chopFrame = 0;
squirrel_health = 5;
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

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

inTree = false;

health_ = 5;

// Audio
squirrel = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(squirrel, 25, 50, 1);