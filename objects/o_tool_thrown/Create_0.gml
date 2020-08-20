// Inherit the parent event
//event_inherited(); <- no dont it shouldnt be on minimap

alarm[0] = 1;

z = 16;

speed_ = -1;

isLit = false;
everLit = false;

range = -1;
side = false;

angle = -1;
toolAngle = -1;

item_ = -1;
count = -1;
durability = -1;

stuck = false;
objectStuck = -1;
stuckX = -1;
stuckY = -1;

damage = 0;
damageDoOnce = true;

isTutorial = false;

// Audio
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(emitter, 25, 50, 1);