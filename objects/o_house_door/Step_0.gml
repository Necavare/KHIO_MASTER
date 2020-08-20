if(!global.generatingEnvironment){
	var aboveX = x+lengthdir_x(1, image_angle+90);
	var aboveY = y+lengthdir_y(1, image_angle+90);

	var belowX = x+lengthdir_x(1, image_angle-90);
	var belowY = y+lengthdir_y(1, image_angle-90);

	// Door moving back to original
	if(!place_meeting(x+lengthdir_x(2, image_angle+90), y+lengthdir_y(2, image_angle+90), o_player) && image_angle < startingAngle)
		image_angle+=1;
	else if(!place_meeting(x+lengthdir_x(2, image_angle-90), y+lengthdir_y(2, image_angle-90), o_player) && image_angle > startingAngle)
		image_angle-=1;

	// Player pushing door
	if(place_meeting(aboveX, aboveY, o_player) && image_angle > startingAngle - 90)
		image_angle-=4;
	else if(place_meeting(belowX, belowY, o_player) && image_angle < startingAngle + 90)
		image_angle+=4;
}