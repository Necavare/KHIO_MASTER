if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

event_inherited();

buildZ = -image_number;

health_ = 5;
canHit = true;