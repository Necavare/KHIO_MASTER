

objectIndex = -1;
changedAngle = false;

isRolling = false;
isTreasure = false;
	
canDestroy = false;
alarm[3] = 120;

z = 0;

//image_angle = -global.camera_angle;
if(!global.generatingEnvironment) {
	if(choose(true, false))
		audio_play_sound(sn_dodge_2,1,0);
	else
		audio_play_sound(sn_dodge_1,1,0);
}
	
//isTreasure = true;
