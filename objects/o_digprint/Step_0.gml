if(!global.generatingEnvironment && !global.isPaused && o_weather.isSnowing && alarm[0] == -1)
	alarm[0] = room_speed * 5;
	
if(global.generatingEnvironment){
	image_alpha = 1;
}
depth = 8999;

if(!place_meeting(x,y,o_player))
	drawKick = false;
	
if(!changedAngle && objectIndex != -1) {
	changedAngle = true;
	
	if(objectIndex.img_index == 0)
		image_angle = -global.camera_angle+180;
	else if(objectIndex.img_index == 1)
		image_angle = -global.camera_angle-135;
	else if(objectIndex.img_index == 2)
		image_angle = -global.camera_angle-90;
	else if(objectIndex.img_index == 3)
		image_angle = -global.camera_angle-45;
	else if(objectIndex.img_index == 4)
		image_angle = -global.camera_angle;
	else if(objectIndex.img_index == 5)
		image_angle = -global.camera_angle+45;
	else if(objectIndex.img_index == 6)
		image_angle = -global.camera_angle+90;
	else if(objectIndex.img_index == 7)
		image_angle = -global.camera_angle+135;
		
	if(objectIndex.isRunning)
		sprite_index = s_footprint_long;
	
	if(isRolling)
		sprite_index = s_rollprint;
}
