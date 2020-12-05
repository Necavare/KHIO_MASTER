depth = 8999;

if(!global.generatingEnvironment){
	draw_self_3d(-48);

if(!global.isInventoryOpen && !global.isPaused && !global.minimapFullscreen && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 30, self, true, false) && !global.isCrateOpen && !global.isInventoryOpen && (global.interactingObject == -1 || global.interactingObject == self)) {

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

if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 30, self, true, false))) {
	options = false;
	
	// Reseting interact stuff
	global.interactingObject = -1;
	
	if(window_mouse_get_x() > mouseX + 10) {
		// ENTER CAVE HERE
		
		//if(ds_list_find_value(global.caveLoadList, listIndex))
		//	global.reLoad = true;
		show_debug_message("trying to go to room index: "+string(listIndex));
		room_goto(ds_list_find_value(global.caveList, listIndex));
		global.caveX = o_player.x;
		global.caveY = o_player.y;
		
		//CHECK THE INITIALIZER FOR O_PLAYER POSITION
		//o_player.x = 2500;
		//o_player.y = 2500;
		//o_player.x = 2249;
		//o_player.y = 1327;
		
	} 
}

}