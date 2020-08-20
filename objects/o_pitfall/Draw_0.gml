if(position_meeting(x,y,o_player)) {
	isTrapped = false;
	isEnemy = false;
	solid = true;
} else if(position_meeting(x,y,o_enemySword) || position_meeting(x,y,o_enemyBow)) {
	isTrapped = false;
	isEnemy = true;
	var swordEnemy = instance_nearest(x,y, o_enemySword);
	if(instance_exists(swordEnemy))
		instance_destroy(swordEnemy);
		
	var bowEnemy = instance_nearest(x,y, o_enemyBow);
	if(instance_exists(bowEnemy))
		instance_destroy(bowEnemy);
		
	solid = true;
}

// Starting animation
if(!isTrapped && frame == -1 && alarm[0] == -1) {
	alarm[0] = 4;	
	audio_emitter_position(spike, x, y, 0);
	audio_play_sound_on(spike, sn_swing_1, 0, 1);
	audio_play_sound_on(spike, sn_foliage_rustle_1, 0, 1);
	audio_play_sound_on(spike, sn_foliage_rustle_3, 0, 1);
}
	
switch(frame) {
	case -1: sprite_index = s_pitfall_trapped; break;
	case 0: if(!isEnemy) sprite_index = s_pitfall1; else sprite_index = s_pitfall1_enemy; break;
	case 1: if(!isEnemy) sprite_index = s_pitfall2; else sprite_index = s_pitfall2_enemy; break;
	case 2: if(!isEnemy) sprite_index = s_pitfall3; else sprite_index = s_pitfall3_enemy;break;
	case 3: if(!isEnemy) sprite_index = s_pitfall4; else sprite_index = s_pitfall4_enemy; break;
	case 4: if(!isEnemy) sprite_index = s_pitfall5; else sprite_index = s_pitfall5_enemy; break;
}

for (var i = -image_number; i < 0; i++) {
	var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
	if((frame == 0 && i+image_number == 17) || (frame == 1 && i+image_number == 14)
	 || (frame == 2 && i+image_number == 10)|| (frame == 3 && i+image_number == 6) || (frame == 4 && i+image_number == 2))
		draw_sprite_ext(sprite_index, i+image_number,xx,yy, .6, .6, image_angle, image_blend, image_alpha);
	else 
		draw_sprite_ext(sprite_index, i+image_number,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	
	if(!isEnemy && i <= -image_number && !isTrapped && position_meeting(x,y,o_player)) {
		var dir = point_direction(o_player.x, o_player.y, xx, yy);
		o_player.x += lengthdir_x(1, dir);
		o_player.y += lengthdir_y(1, dir);
	}
}