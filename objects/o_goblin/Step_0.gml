if(mode == 1) {
	image_angle=point_direction(x,y,o_player.x,o_player.y);
	if(irandom_range(0,20) == 0)
		mode = 4;
}
if(mode == 2) {
	image_angle=point_direction(x,y,o_player.x,o_player.y)+90;
	if(irandom_range(0,40) == 0)
		mode = 1;
}
if(mode == 3)
	image_angle=point_direction(x,y,o_player.x,o_player.y)-90;
if(mode == 4) 
	image_angle=point_direction(x,y,o_player.x,o_player.y)+180;
	
	
if(mode == 6)
	image_angle=point_direction(x,y,caveO.x,caveO.y)-90;


// Running speed
if(mode != 0 && mode != 5) {
	if(sprite_index == s_goblin_run_1m) {
		x += lengthdir_x(.3, image_angle-90);
		y += lengthdir_y(.3, image_angle-90);
	}

	if(sprite_index == s_goblin_run_2m) {
		x += lengthdir_x(.5, image_angle-90);
		y += lengthdir_y(.5, image_angle-90);
	}

	if(sprite_index == s_goblin_run_3m) {
		x += lengthdir_x(1.6, image_angle-90);
		y += lengthdir_y(1.6, image_angle-90);
	}
	
	if(sprite_index == s_goblin_run_1) {
		x += lengthdir_x(.3, image_angle-90);
		y += lengthdir_y(.3, image_angle-90);
	}

	if(sprite_index == s_goblin_run_2) {
		x += lengthdir_x(.5, image_angle-90);
		y += lengthdir_y(.5, image_angle-90);
	}

	if(sprite_index == s_goblin_run_3) {
		x += lengthdir_x(1.6, image_angle-90);
		y += lengthdir_y(1.6, image_angle-90);
	}
}

// Detecting player
if(collision_circle(x,y,100, o_player, true, true) && alarm[1] == -1)
	alarm[1] = 1;
else if(!collision_circle(x,y,100, o_player, true, true))
	mode = 0;

// Player hitting
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit) {
	
	mode = 3;
	
	//o_tool.isHitting = true;
	enemy_health-=o_tool.finalDamage*3.5;
	o_camera.shake = 2;
	
	switch(irandom(1)) {
		case 0: audio_play_sound(sn_bullet_hit_1, 1, 0); break;
		case 1: audio_play_sound(sn_bullet_hit_2, 1, 0); break;
	}
	
	repeat(8) {
		var blood = instance_create_depth(x, y, depth, o_particles);
			blood.spurt = true;
			var angle1 = -global.camera_angle+90;
			blood.dir_ = irandom_range(angle1-30, angle1+30);
	}
	
	canHit = false;
	alarm[2] = 20;
	
}

if(enemy_health < 0 && mode != 5) {
	mode = 5;
	deathAngle = image_angle;
}
	
if(mode == 5) {
	sprite_index = s_goblin_dead;
	image_angle = deathAngle; 
	alarm[1] = -1;
} 