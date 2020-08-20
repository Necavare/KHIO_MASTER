if(!global.generatingEnvironment){
// Drawing interact sprite and grabbing
if(canPickup) {
draw_interact();

if(options) {
		
	window_mouse_set(window_mouse_get_x(), mouseY);
	
	var xx = optionsX;
	var yy = optionsY;
	
	// Pickup option
	if(window_mouse_get_x() < mouseX - 79)
		window_mouse_set(mouseX - 79, mouseY);
	
	if(window_mouse_get_x() < mouseX - 10)
		draw_title("Pickup", -1,  xx-79, yy-14);
	else
		draw_title("Pickup", 0,  xx-79, yy-14);
}

if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && (global.interactingObject == -1 || global.interactingObject == self) && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !options) {
	// Clicking to load interact
	
	if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) {
		global.interactingLoad+=1.5;
		global.interactingObject = self;
	}
		
	// Clicking to interact
	if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
		options = true;
		optionsX = device_mouse_x_to_gui(0);
		optionsY = device_mouse_y_to_gui(0);
		
		mouseX = window_mouse_get_x();
		mouseY = window_mouse_get_y();
		
		// Reseting interact stuff
		global.interactingLoad = -1;
	}
} 

if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 50, self, true, false))) {
	options = false;
	
	global.interactingObject = -1;
}

if(global.isInventoryOpen || global.isPaused)
	options = false;
	} 
}