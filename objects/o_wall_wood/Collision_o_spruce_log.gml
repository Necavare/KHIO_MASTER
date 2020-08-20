if(canAdd) {
	if(logs < 5 && other.stackCount == 0) { // Single stacked
		logType[logs] = 1;
		logs++;
		
		health_ = 5 + (logs * 3); // Add to health
	
		other.isCombining = true;
		instance_destroy(other);
		global.grabbed = -1;
		
		audio_emitter_position(log, x, y, 0);
		audio_play_sound_on(log, sn_log_stack, 0, 1);
	} else if(logs < 5 && other.stackCount > 0) { // Double stacked and 1 space left
		if(other.birch)
			logType[logs] = 0;
		else if(other.spruce)
			logType[logs] = 1;	
		logs++;	
		
		health_ = 5 + (logs * 3); // Add to health
		
		other.stackCount = 0;
		
		audio_emitter_position(log, x, y, 0);
		audio_play_sound_on(log, sn_log_stack, 0, 1);
	} else if(logs < 4 && other.stackCount > 0) { // Double stacked and more than 2 spaces lef
		if(other.birch)
			logType[logs-1] = 0;
		else if(other.spruce)
			logType[logs-1] = 1;
		logs++;
		logType[logs-1] = 1;
		logs++;
		
		health_ = 5 + (logs * 3); // Add to health
	
		other.isCombining = true;
		instance_destroy(other);	
		global.grabbed = -1;
		
		audio_emitter_position(log, x, y, 0);
		audio_play_sound_on(log, sn_log_stack, 0, 1);
	}
}

lastLogs = logs;