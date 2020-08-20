if(global.grabbed == self) {
	x += (mouse_x-x)*.05; 
	y += (mouse_y-y)*.05;
	
	// Rotating the object
	if(keyboard_check_pressed(global.K_ROTATELEFT))
		image_angle+=30;
	else if(keyboard_check_pressed(global.K_ROTATERIGHT))
		image_angle-=30;
		
	// Dropping if outside circle
	if(!collision_circle(o_player.x, o_player.y, 50, self, true, false))
		global.grabbed = -1;
}

// Lifting item when grabbed
if(global.grabbed == self && z < 5)
	z+=.5;
else if(global.grabbed == -1 && z > 0) 
	z-=.5;
	
// Bouncing item when spawned
if(bounce) {
	if(z < 8)
		z+=2;
	else if(z >= 8)
		bounce = false;
}

// Lowering item
if(!bounce && z > 0 && global.grabbed == -1) {
	z-=1.5;
	if(!dropPlayed) {
		audio_emitter_position(log, x, y, 0);
		switch(irandom_range(0,2)) {
			case 0: audio_play_sound_on(log, sn_snowwalk_1, 0, 1); break;
			case 1: audio_play_sound_on(log, sn_snowwalk_2, 0, 1); break;
			case 2: audio_play_sound_on(log, sn_snowwalk_4, 0, 1); break;
		}
		dropPlayed = true;
	}
}
	
event_inherited();

if(health_ <= 0)
	instance_destroy(self);
	
if(health_ <= 2 && stackCount == 1) {
	// Spawning planks
	repeat(2) {
		spawnCount++;
		var plank = instance_create_depth(x,y,depth, o_item);
			
		plank.image_index = item.planks;
			
		plank.direction = irandom_range(0,360);
		plank.fountain = true;
		plank.wait = true;
		
		plank.alarm[3] = spawnCount* 6;
			
		o_camera.shake = 2;
	}
	
	stackCount = 0;
}
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && health_ > 0)
	take_hit(self, 0);
