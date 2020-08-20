if(logCount == 0) {
	if(other.stackCount > 0) {
		logCount+=2;		
		other.isCombining = true;
		instance_destroy(other);
		global.grabbed = -1;
		audio_emitter_position(fire, x, y, 0);
		audio_play_sound_on(fire, sn_log_stack, 0, 1);
	}
	else {
		logCount++;
		other.isCombining = true;
		instance_destroy(other);
		global.grabbed = -1;
		audio_emitter_position(fire, x, y, 0);
		audio_play_sound_on(fire, sn_log_stack, 0, 1);
	}
} else if(logCount == 1) {
	if(other.stackCount > 0) {
		logCount++;
		other.stackCount--;
		audio_emitter_position(fire, x, y, 0);
		audio_play_sound_on(fire, sn_log_stack, 0, 1);
	}
	else {
		logCount++;
		other.isCombining = true;
		instance_destroy(other);
		global.grabbed = -1;
		audio_emitter_position(fire, x, y, 0);
		audio_play_sound_on(fire, sn_log_stack, 0, 1);
	}
}