if(!global.generatingEnvironment){
	if(!global.isInventoryOpen && !global.isPaused && !global.minimapFullscreen && collision_circle(o_player.x, o_player.y, 50, self, true, false) && (global.interactingObject == -1 || global.interactingObject == self) && isFungi && room != r_title) {
		if(alarm[1] == -1)
			alarm[1] = 60;
	
		draw_interact();
	
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) {
			global.interactingLoad++;
			global.interactingObject = self;
		}
		
		// Picking up item
		if(mouse_check_button(global.M_LEFT)  && global.interactingLoad >= 16) {
				o_camera.shake = .5;
				var fungi = instance_create_depth(x,y,depth,o_item);
				fungi.image_index = item.fungi;
				fungi.direction = irandom_range(0,360);
				fungi.bounce = true;
				fungi.durability = 11;
		
				sprite_index = s_spruce_stump;
				isFungi = false;
		
				audio_play_sound(sn_fungi, 1, 0);
			
				// Reseting interact stuff
				global.interactingLoad = -1;
				global.interactingObject = -1;
		}
	}
}