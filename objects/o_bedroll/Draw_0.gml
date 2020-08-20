if(!global.generatingEnvironment){
	draw_self_3d(1, buildZ);

	depth = o_player.depth+1;

	if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && (global.interactingObject == -1 || global.interactingObject == self) && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false)) {
	
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
		if(device_mouse_x_to_gui(0) > optionsX + 10) {
			//Sleep
			if(o_shaders.minute_of_day > 1140 || o_shaders.minute_of_day < 300) {
				o_shaders.minute_target = 480;
				o_player.isSleeping = true;
				o_player.img_frame = 0;
			}
			
		} else if(device_mouse_x_to_gui(0) < optionsX - 10) {	
			instance_destroy(self);
		
			// Creates item
			var bed = instance_create_depth(x,y,depth, o_item);
			bed.image_index = item.bedroll;
			bed.direction = irandom_range(0,360);
			bed.bounce = true;
			
			audio_emitter_position(bedroll, x, y, 0);
			audio_play_sound_on(bedroll, sn_rollup, 0, 1);
		}
	}
}