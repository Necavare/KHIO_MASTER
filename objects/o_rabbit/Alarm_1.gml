///@description Framerate for movement
if(!global.generatingEnvironment){
	if(frame < 4)
		frame++;
	else
		frame=0;
	
	if(frame == 0 && !position_meeting(x,y,o_animal_print)) {
		instance_create_depth(x,y,depth,o_animal_print);
		audio_emitter_position(rabbit, x, y, 0);
		switch(irandom_range(0,4)) {
			case 0: audio_play_sound_on(rabbit, sn_animal_step_1, 0, 1); break;
			case 1: audio_play_sound_on(rabbit, sn_animal_step_2, 0, 1); break;
			case 2: audio_play_sound_on(rabbit, sn_animal_step_3, 0, 1); break;
			case 3: audio_play_sound_on(rabbit, sn_animal_step_4, 0, 1); break;
			case 4: audio_play_sound_on(rabbit, sn_animal_step_5, 0, 1); break;
		}
	}
}
alarm[1] = 4;