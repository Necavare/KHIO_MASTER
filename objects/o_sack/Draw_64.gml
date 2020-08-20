if(rocks != 0 || logs != 0) {
	draw_interact();
	
	if(position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false) && (global.interactingObject == -1 || global.interactingObject == self)) {
	
		// Clicking to load interact
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16) {
			global.interactingLoad+=1.5;
			global.interactingObject = self;
		}
		
		// Clicking to interact
		if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
			canAdd = false;
			alarm[0] = 120;
			
			var inst = -1;
			if(logs == 1 && birch)
				inst = instance_create_depth(mouse_x,mouse_y,depth,o_birch_log);
			else if(logs == 1 && spruce)
				inst = instance_create_depth(mouse_x,mouse_y,depth,o_spruce_log);
			else if(logs == 2 && birch && !spruce) {
				inst = instance_create_depth(mouse_x,mouse_y,depth,o_birch_log);
				inst.stackCount = 1;
				inst.birch = true;
			} else if(logs == 2 && spruce && !birch) {
				inst = instance_create_depth(mouse_x,mouse_y,depth,o_spruce_log);
				inst.stackCount = 1;
				inst.spruce = true;
			} else if(logs == 2 && spruce && birch) {
				inst = instance_create_depth(mouse_x,mouse_y,depth,o_spruce_log);
				inst.stackCount = 1;
				inst.spruce = true;
				inst.birch = true;
			}
			
			if(rocks > 0) {
				inst = instance_create_depth(mouse_x,mouse_y,depth,o_rocks);
				inst.stackCount = rocks-1;
			}
				
			global.grabbed = inst;
		
			// Resetting holdings
			logs = 0;
			birch = false;
			spruce = false;
			rocks = 0;
		
			// Reseting interact stuff
			global.interactingLoad = -1;
			global.interactingObject = -1;
		}

	}
}