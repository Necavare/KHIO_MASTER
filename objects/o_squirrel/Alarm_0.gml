///@description Looking
isLooking = true;

audio_emitter_position(squirrel, x, y, 0);
switch(irandom_range(0,2)) {
	case 0: audio_play_sound_on(squirrel, sn_squirrel_chirp_1, 0, 1); break;
	case 1: audio_play_sound_on(squirrel, sn_squirrel_chirp_2, 0, 1); break;
	case 2: audio_play_sound_on(squirrel, sn_squirrel_chirp_3, 0, 1); break;
}