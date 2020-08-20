if(frame < 4) {
	if(frame == 3 && !isEnemy)
		o_player.health_ = 0;
		
	if(!isEnemy)
		o_player.player_scale = 0;
	
	frame++;
	alarm[0] = 3;
} else {
	audio_emitter_position(spike, x, y, 0);
	audio_play_sound_on(spike, sn_spike_1, 0, 1);
	audio_play_sound_on(spike, sn_spike_2, 0, 1);
}