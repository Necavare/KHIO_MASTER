// Grabbing/Chopping
carrySpeed = .05;

// Stacking
stackCount = 0;
spruce = false;
birch = false;

// Spawning
bounce = true;
spawnCount = 0;

// Flammable stuff
event_inherited();
z = 0;
isLong = true;

health_ = 2;

isCombining = false;

// Audio
log = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(log, 25, 50, 1);

dropPlayed = false;