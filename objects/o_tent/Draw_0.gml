
	draw_self_3d(1, buildZ);
/*if(instance_exists(o_shaders)&& !isOnFire) {
	if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen &&  position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false)) {
	
		// Clicking to load interact
		global.interactingObject = self;
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16 && !options) 
			global.interactingLoad+=1.5;
		
		// Clicking to interact
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
			// Opening crate
			options = true;
			optionsX = device_mouse_x_to_gui(0);
			optionsY = device_mouse_y_to_gui(0);
		
			// Reseting interact stuff
			global.interactingLoad = -1;
			global.interactingObject = -1;
		}

	}

	if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 50, self, true, false))) {
		options = false;
	
		if(device_mouse_x_to_gui(0) > optionsX + 10  && (o_shaders.minute_of_day > 1140 || o_shaders.minute_of_day < 300)) {
			//Sleep
			o_shaders.minute_target = 480;
			o_player.isSleeping = true;
			isSpawning = false;
		}
	}
}*/