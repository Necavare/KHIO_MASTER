event_inherited();

if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

isCamp = false;
startingAngle = image_angle;
isLocked = false;

// Flammable stuff
z = 0;
health_ = 5;
isLong = true;
isDoor = true;

canInteract = true;

// Audio
door = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(door, 25, 50, 1);