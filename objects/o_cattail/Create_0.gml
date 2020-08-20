// Wind
movement = random(pi*2);
value = 0.027 + random(0.005);

// Randomizing grass type
var type = irandom_range(0,2);

if(type == 0)
	sprite_index = s_cattail;
else if(type == 1)
	sprite_index = s_cattail2;

event_inherited();

// Flammable stuff
z = 0;
health_ = 1;
canHit = true;
event_inherited();

// Audio
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, 50, 50, 1);