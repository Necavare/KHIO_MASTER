if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

event_inherited();

buildZ = -image_number;
z = 0;
isLong = true;
health_ = 5;
canHit = true;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;