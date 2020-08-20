

// Picking grass
if((sprite_index == s_grass_snow) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && room != r_title  && (global.interactingObject == -1 || global.interactingObject == self) && !global.isInventoryOpen && !global.minimapFullscreen && !global.isHolding && !isOnFire) {
	
	draw_interact();
	
	if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && mouse_check_button(global.M_LEFT) && global.interactingLoad < 16 && position_meeting(mouse_x, mouse_y, self)) {
		global.interactingObject = self;
		global.interactingLoad++;
	}
		
	// Picking up item
	if(mouse_check_button(global.M_LEFT)  && global.interactingLoad >= 16 && position_meeting(mouse_x, mouse_y, self) && global.interactingObject == self) {
			
			instance_destroy(self);
			
			if(random_range(0,1) == 0)
				audio_play_sound(sn_grass_hit_1, 1, 0);
			else
				audio_play_sound(sn_grass_hit_2, 1, 0);
				
			// Reseting interact stuff
			global.interactingLoad = -1;
			global.interactingObject = -1;
	}
}