if(global.grabbed == -1 && !options)
	draw_interact();

if(options) {
		
	window_mouse_set(window_mouse_get_x(), mouseY);
	
	var xx = optionsX;
	var yy = optionsY;
	
	// Second option
	if(window_mouse_get_x() > mouseX + 66)
		window_mouse_set(mouseX + 66, mouseY);
	
	if(window_mouse_get_x() > mouseX + 10)
		draw_title("Loot", -1, xx+14, yy-14);
	else
		draw_title("Loot", 0, xx+14, yy-14);
}

if(global.isInventoryOpen || global.isPaused)
	options = false;

// Drawing item names for the inventory and picked up items
if(global.crate == self && takeAllSlot.highlighted)
	draw_title("Take All", 0, -1, -1);

if(!global.isItemPicked && global.crate == self)
	for(var ix = 0; ix < width; ix++)
		for(var iy = 0; iy < height; iy++) {
			if(slots[# ix, iy].highlighted && items[# ix, iy] > 1 && count[# ix, iy] > 0)
				item_title(items[# ix, iy], count[# ix, iy]);
		}

if(!options && room != r_title && !global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && (global.interactingObject == -1 || global.interactingObject == self) && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 30, self, true, false) && !global.isCrateOpen && !global.isInventoryOpen && !global.generatingEnvironment) {
	
	// Clicking to load interact
	if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) {
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

if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 50, self, true, false))) {
	options = false;
	global.interactingObject = -1;
	if(window_mouse_get_x() > mouseX + 10) {
		// Opening crate
		global.isCrateOpen = true;
		global.crate = self;
		window_mouse_set(window_get_width()/2, window_get_height()/2.6);
		global.isInventoryOpen = true;
		o_player.isHarvesting = true;
		global.isInventoryOpening = true;
		
		audio_emitter_position(crate, x, y, 0);
		audio_play_sound_on(crate, sn_largecrate_open, 0, 1);
	} 
}

if(!collision_circle(o_player.x, o_player.y, 30, self, true, false) && global.crate == self) {
	global.isCrateOpen = false;
	global.crate = 0;
}

if(!global.isCrateOpen && o_player.isHarvesting) {
	o_player.isHarvesting = false;
	if(o_player.isHarvestingIdle)
		o_player.img_frame = 0;
	o_player.isHarvestingIdle = false;
	o_player.alarm[0] = 1;
}