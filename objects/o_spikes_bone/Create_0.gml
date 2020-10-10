if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

event_inherited();

buildZ = -image_number;
z = 0;
health_ = 5;
canHit = true;