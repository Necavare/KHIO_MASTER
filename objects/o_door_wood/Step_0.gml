event_inherited();

if(!global.generatingEnvironment){
	if(!isLocked) {
		var aboveX = x+lengthdir_x(5, image_angle+90);
		var aboveY = y+lengthdir_y(5, image_angle+90);

		var belowX = x+lengthdir_x(5, image_angle-90);
		var belowY = y+lengthdir_y(5, image_angle-90);
	
		// Door moving back to original
		if((!place_meeting(x+lengthdir_x(2, image_angle+90), y+lengthdir_y(2, image_angle+90), o_player) &&
			!place_meeting(x+lengthdir_x(2, image_angle+90),y+lengthdir_y(2, image_angle+90), o_enemyBow) &&
			!place_meeting(x+lengthdir_x(2, image_angle+90),y+lengthdir_y(2, image_angle+90), o_enemySword)) &&
			(image_angle < startingAngle)){
				image_angle+=1;
		} else if((!place_meeting(x+lengthdir_x(2, image_angle-90), y+lengthdir_y(2, image_angle-90), o_player) &&
			!place_meeting(x+lengthdir_x(2, image_angle-90), y+lengthdir_y(2, image_angle-90), o_enemyBow) &&
			!place_meeting(x+lengthdir_x(2, image_angle-90), y+lengthdir_y(2, image_angle-90), o_enemySword)) &&
			(image_angle > startingAngle)){
				image_angle-=1;
		}

		// Player pushing door
		if((place_meeting(aboveX, aboveY, o_player) ||
			place_meeting(aboveX, aboveY, o_enemyBow) ||
			place_meeting(aboveX, aboveY, o_enemySword))
			&& (image_angle > startingAngle - 90)){
				image_angle-=4;
		} else if((place_meeting(belowX, belowY, o_player)||
			place_meeting(belowX, belowY, o_enemyBow)||
			place_meeting(belowX, belowY, o_enemySword))
			&& (image_angle < startingAngle + 90)){
				image_angle+=4;
		}
	}
	
	// Destroys the instance
	if(health_ <= 0)
		instance_destroy(self);
	
	if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung)
		take_hit(self, 0);
}