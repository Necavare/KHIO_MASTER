if(global.grabbed == self) {
	x += (mouse_x-x)*carrySpeed; 
	y += (mouse_y-y)*carrySpeed;
	
	// Rotating the object
	if(keyboard_check_pressed(global.K_ROTATELEFT))
		image_angle+=30;
	else if(keyboard_check_pressed(global.K_ROTATERIGHT))
		image_angle-=30;
		
	// Dropping if outside circle
	if(!collision_circle(o_player.x, o_player.y, 50, self, true, false))
		global.grabbed = -1;
		
	solid = false;
} else
	solid = true;

// Lifting item when grabbed
if(global.grabbed == self && z < 5)
	z+=.5;
else if(global.grabbed == -1 && z > 0)  {
	z-=.5;
	if(!dropPlayed) {
		audio_emitter_position(anvil, x, y, 0);
		switch(irandom_range(0,2)) {
			case 0: audio_play_sound_on(anvil, sn_snowwalk_1, 0, 1); break;
			case 1: audio_play_sound_on(anvil, sn_snowwalk_2, 0, 1); break;
			case 2: audio_play_sound_on(anvil, sn_snowwalk_4, 0, 1); break;
		}
		dropPlayed = true;
	}
}
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit)
	take_hit(self, 2);
	
// Destroys the instance
if(health_ <= 0)
	instance_destroy(self);