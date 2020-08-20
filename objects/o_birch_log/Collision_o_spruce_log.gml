if(!stackCount && !other.stackCount) {
	global.grabbed = self;
	stackCount++;
	spruce = true;
	health_ = 4;
	other.isCombining = true;
	instance_destroy(other);
	
	audio_emitter_position(log, x, y, 0);
	audio_play_sound_on(log, sn_log_stack, 0, 1);
}