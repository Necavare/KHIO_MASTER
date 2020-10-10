healthKick = true;
isBleeding = true;

health_ -= 8*armor;

move(3, point_direction(other.x, other.y, x,y), 10, 10);

switch(irandom_range(0,1)) {
	case 0: audio_play_sound(sn_spike_1, 1, 0); break;
	case 1: audio_play_sound(sn_spike_2, 1, 0); break;
}