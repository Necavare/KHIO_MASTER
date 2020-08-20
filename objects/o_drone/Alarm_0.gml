if(!player) {
	dir = irandom_range(0, 360);
	player = true;
	alarm[0] = 60 * irandom_range(0,3);
	
	switch(irandom_range(0,1)) {
		case 0: audio_play_sound_on(drone, sn_drone_switch_1, 0, 1); break;
		case 1: audio_play_sound_on(drone, sn_drone_switch_2, 0, 1); break;
	}
} else {
	dir = point_direction(x,y,o_player.x,o_player.y);
	if(collision_circle(x,y,250,o_player,true, false))
		player = false;
	
	switch(irandom_range(0,1)) {
		case 0: audio_play_sound_on(drone, sn_drone_switch_1, 0, 1); break;
		case 1: audio_play_sound_on(drone, sn_drone_switch_2, 0, 1); break;
	}
}