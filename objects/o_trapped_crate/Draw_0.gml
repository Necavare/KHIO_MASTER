if(!global.generatingEnvironment){
	draw_self_3d(1, buildZ);

if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 30, self, true, false) && !global.isCrateOpen && playerNear && !isOnFire && !global.isInventoryOpen && (global.interactingObject == -1 || global.interactingObject == self)) {

	// Clicking to load interact
	if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16 && !options) {
		global.interactingObject = self;
		global.interactingLoad+=1.5;
	}
		
	// Clicking to interact
	if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
		// Opening crate
		options = true;
		optionsX = device_mouse_x_to_gui(0); 
		optionsY = device_mouse_y_to_gui(0);
		
		mouseX = window_mouse_get_x();
		mouseY = window_mouse_get_y();
		
		global.interactingLoad = -1;
	}
}

if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 30, self, true, false)) && !isOnFire) {
	options = false;
	
	// Reseting interact stuff
	global.interactingObject = -1;
	// Setting grass on fire
	if(window_mouse_get_x() > mouseX + 10) {
		global.isCrateOpen = true;
		global.crate = self;
		window_mouse_set(window_get_width()/2, window_get_height()/2.6);
		global.isInventoryOpen = true;
		global.isInventoryOpening = true;
		o_player.isHarvesting = true;
		o_player.alarm[0] = 1;
		o_player.img_frame = 0;
		isExploded = true;
		isOnFire = true;
	} 
		
	}
}

if(!collision_circle(o_player.x, o_player.y, 30, self, true, false) && global.crate == self) {
	global.isCrateOpen = false;
	global.crate = -1;
}

if(!global.isCrateOpen && o_player.isHarvesting) {
	o_player.isHarvesting = false;
	o_player.alarm[0] = 1;
	o_player.img_frame = 0;
}
