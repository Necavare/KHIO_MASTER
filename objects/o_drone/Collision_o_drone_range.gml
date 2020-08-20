dir = -point_direction(x,y,other.x,other.y);
player = true;
alarm[0] = 60 * irandom_range(0,3);
	
switch(irandom_range(0,1)) {
	case 0: audio_play_sound_on(drone, sn_drone_switch_1, 0, 1); break;
	case 1: audio_play_sound_on(drone, sn_drone_switch_2, 0, 1); break;
}