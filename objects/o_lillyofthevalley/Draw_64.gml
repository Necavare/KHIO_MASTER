if(collision_circle(o_player.x, o_player.y, 50, self, true, false) && room != r_title  && (global.interactingObject == -1 || global.interactingObject == self)&& position_meeting(mouse_x, mouse_y, self) && !global.isInventoryOpen  && !global.isHolding && !isOnFire) {
	if(alarm[0] == -1)
		alarm[0] = 60;
	
	draw_interact();
	
	if(!global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) {
		global.interactingLoad++;
		global.interactingObject = self;
	}
		
	// Picking up item
	if(mouse_check_button(global.M_LEFT)  && global.interactingLoad >= 16) {
			o_camera.shake = .5;
			
			var stick = instance_create_depth(x,y,depth,o_item);
			stick.image_index = item.lilly;
			stick.direction = irandom_range(0,360);
			stick.bounce = true;
		
			instance_destroy(self);
			
			audio_play_sound(sn_grass_hit_2, 1, 0);
			
			// Reseting interact stuff
			global.interactingLoad = -1;
			global.interactingObject = -1;
	}
}