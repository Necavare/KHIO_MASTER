// Wind
movement = random(pi*2);
value = 0.027 + random(0.005);

//randomize rotation
//image_angle = irandom(360);

// Flammable stuff
z = 0;
health_ = 4;
canHit = true;
event_inherited();

spawnCount = 0;

// Audio
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, 50, 50, 1);