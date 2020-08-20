if(global.isDev) {
	if(!instance_exists(o_console))
		instance_create_depth(x, y, 0, o_console);

	if(!consoleOpen) {
		if(keyboard_check_pressed(vk_f1))
			debuggerOpen = !debuggerOpen;
	
		if(debuggerOpen) {
			if(keyboard_check_pressed(vk_f2))
				drawCollisions = !drawCollisions;
	
			if(keyboard_check_pressed(vk_f3))
				pauseDay = !pauseDay;
	
			if(keyboard_check_pressed(vk_f4))
				o_weather.isSnowing = !o_weather.isSnowing;
	
			if(keyboard_check_pressed(vk_f5))
				isGod = !isGod
	
			//if(keyboard_check_pressed(vk_f6))
				//o_player.health_ = 0;
			
		
	
			if(keyboard_check_pressed(vk_f9))
				instancePrint = true;
	
			if(isGod) {
				o_player.health_ = 100;
				o_player.stamina = 100;
				o_player.p_speed = 3;
			}
		}
	}
} else if(!global.isDev && instance_exists(o_console)) {
	instance_destroy(o_console);
}