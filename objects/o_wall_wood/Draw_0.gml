if(!global.generatingEnvironment){
	for(var i = 0; i < image_number; i+=1) {
		var xx = x+lengthdir_x(i+buildZ,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+buildZ,-camera_get_view_angle(view_camera[0])+90);
		
		// Drawing wall
		if(i+buildZ >= 0) {
			draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	
			// Drawing logs
			if(i < 5 && logs > 0) {
				if(logType[0] == 0)
					draw_sprite_ext(s_birch_log, i,xx,yy, 1, .8, image_angle, image_blend, image_alpha);
				if(logType[0] == 1)
					draw_sprite_ext(s_spruce_log, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			} else if(i < 5 && logs == 0) {
				draw_sprite_ext(s_spruce_log, i,xx,yy, 1, 1, image_angle, $333128, .1);
			} else if(i >= 4 && i < 9 && logs > 1) {
				if(logType[1] == 0)
					draw_sprite_ext(s_birch_log, i-4,xx,yy, 1, .8, image_angle, image_blend, image_alpha);
				if(logType[1] == 1)
					draw_sprite_ext(s_spruce_log, i-4,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			} else if(i >= 4 && i < 9 && logs == 1) {
				draw_sprite_ext(s_spruce_log, i,xx,yy, 1, 1, image_angle, $333128, .1);
			} else if(i >= 8 && i < 13 && logs > 2) {
				if(logType[2] == 0)
					draw_sprite_ext(s_birch_log, i-8,xx,yy, 1, .8, image_angle, image_blend, image_alpha);
				if(logType[2] == 1)
					draw_sprite_ext(s_spruce_log, i-8,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			} else if(i >= 8 && i < 13 && logs == 2) {
				draw_sprite_ext(s_spruce_log, i,xx,yy, 1, 1, image_angle, $333128, .1);
			} else if(i >= 12 && i < 17 && logs > 3) {
				if(logType[3] == 0)
					draw_sprite_ext(s_birch_log, i-12,xx,yy, 1, .8, image_angle, image_blend, image_alpha);
				if(logType[3] == 1)
					draw_sprite_ext(s_spruce_log, i-12,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			} else if(i >= 12 && i < 17 && logs == 3) {
				draw_sprite_ext(s_spruce_log, i,xx,yy, 1, 1, image_angle, $333128, .1);
			} else if(i >= 16 && i < 21 && logs > 4) {
				if(logType[4] == 0)
					draw_sprite_ext(s_birch_log, i-16,xx,yy, 1, .8, image_angle, image_blend, image_alpha);
				if(logType[4] == 1)
					draw_sprite_ext(s_spruce_log, i-16,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			} else if(i >= 16 && i < 21 && logs == 4) {
				draw_sprite_ext(s_spruce_log, i,xx,yy, 1, 1, image_angle, $333128, .1);
			}
		
			// Drawing metal wall
			if(upgraded)
				draw_sprite_ext(s_wall_metal, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
		}
	}

if(logs >= 5 && position_meeting(mouse_x, mouse_y, self)  && (global.interactingObject == -1 || global.interactingObject == self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && !global.isInventoryOpen && global.grabbed == -1 && !isOnFire && !isCamp && !global.isPaused && !o_hud.mapOpen) {
	
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
		if(window_mouse_get_x() > mouseX + 10 && logs >= 5 && !upgraded && check_inventory(item.metal, 4, -1)) { // Upgrading wall
			upgraded = true;
			inventory_remove(item.metal, 4);
			health_ = 15 + (logs * 3);
			audio_emitter_position(log, x, y, 0);
			audio_play_sound_on(log, sn_upgrade, 0, 1);
		} else if(window_mouse_get_x() > mouseX + 10 && logs >= 5 && upgraded) { // Rotating wall
			image_angle += 180;
			audio_emitter_position(log, x, y, 0);
			audio_play_sound_on(log, sn_snowwalk_1, 0, 1);
		}
	}
}