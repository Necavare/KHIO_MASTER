// Wind
movement = random(pi*2);
value = 0.027 + random(0.005);

//randomize rotation
//image_angle = irandom(360);

var ran = irandom_range(0, 3);

isEmpty = true;
if(ran == 0)
	isEmpty = false;

if(!isEmpty)
	sprite_index = s_bush_berries;

// Rabbit
isRabbit = false;

// Flammable stuff
z = 0;
health_ = 1;
canHit = true;
event_inherited();

// Audio
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(emitter, 50, 50, 1);

isKey = false;