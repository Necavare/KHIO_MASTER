if(!global.generatingEnvironment){
	draw_self_3d(0);

if(canInteract && !global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen  && (global.interactingObject == -1 || global.interactingObject == self)&& position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !isOnFire) {
	
		// Clicking to load interact
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16 && !options) { 
			global.interactingLoad+=1.5;	
			global.interactingObject = self;
		}
		
		// Clicking to interact
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
			// Opening crate
			options = true;
			optionsX = device_mouse_x_to_gui(0);
			optionsY = device_mouse_y_to_gui(0);
			mouseX = window_mouse_get_x();
			mouseY = window_mouse_get_y();
		
			// Reseting interact stuff
			global.interactingLoad = -1;
		}

	}

if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 50, self, true, false)) && !isOnFire) {
		options = false;
	
		global.interactingObject = -1;
		if(window_mouse_get_x() > mouseX + 10) {
			isLocked = !isLocked;
			audio_emitter_position(door, x, y, 0);
			audio_play_sound_on(door, sn_lock, 0, 1);
		} 
	}
}