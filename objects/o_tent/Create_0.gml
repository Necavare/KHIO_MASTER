if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

event_inherited();

options = false;
optionsX = -1;
optionsY = -1;

buildZ = -image_number;

// Flammable stuff
z = 0;
health_ = 5;
event_inherited();
isLong = true;
createAsh = false;

canHit = true;