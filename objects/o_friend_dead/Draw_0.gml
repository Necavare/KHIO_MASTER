spr_index = s_deadfriend;

img_frame = img_index;

// Drawing player
var scale = .6;
var angle = -camera_get_view_angle(view_camera[0]);

draw_sprite_ext(spr_index,img_frame,x,y,scale,scale,angle,image_blend,global.alpha);


//*****************
//  chest stuff
//*****************

if(!global.isInventoryOpen && !global.isPaused && (global.interactingObject == -1 || global.interactingObject == self) && !o_hud.mapOpen && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !global.isCrateOpen && playerNear) {
	
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

if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 50, self, true, false))) {
	options = false;
	global.interactingObject = -1;
	if(window_mouse_get_x() > mouseX + 10) {
		global.isCrateOpen = true;
		global.crate = self;
		window_mouse_set(window_get_width()/2, window_get_height()/2.6);
		global.isInventoryOpening = true;
		global.isInventoryOpen = true;
		o_player.isHarvesting = true;
		o_player.alarm[0] = 1;
		o_player.img_frame = 0;
	} 
}

if(!global.isCrateOpen && o_player.isHarvesting) {
	o_player.isHarvesting = false;
	o_player.alarm[0] = 1;
	o_player.img_frame = 0;
}