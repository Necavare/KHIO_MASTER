
if(!global.generatingEnvironment){
	
	if(isOnFire)
		event_inherited();
	
	
	if(health_ <= 0) {	
		//if(z >= image_number-36) {
		
		if(!isOnFire) {
			// Creating birch stump
			global.birch_tree_angle = image_angle;
			var stump = instance_create_depth(x,y,depth,o_birch_stump);
			
			// Spawning items
			repeat(irandom_range(2,5)) {
				spawnCount++;
				var stick = instance_create_depth(x,y,depth, o_item);
				stick.image_index = item.stick;
				stick.direction = irandom_range(0,360);
				stick.fountain = true;
				stick.wait = true;
		
				stick.alarm[3] = spawnCount* 6;
			
				o_camera.shake = 2;
			}
			
			repeat(12) {
				var chip = instance_create_depth(x, y, depth, o_particles);
					chip.birch = true;
			}
		}
			instance_destroy(self);
	//}
	
		//z++;
	
		if(!isOnFire) {
				var inst = instance_create_depth(x-16,y,0,o_birch_log);
				var rang = irandom_range(0,2);
				if(rang == 0)
					inst.image_angle = -30;
				if(rang == 1)
					inst.image_angle = 0;
				if(rang == 2)
					inst.image_angle = 30;
				inst.solid = false;
				o_camera.shake = 2;
				var inst = instance_create_depth(x+16,y,0,o_birch_log);
				var rang = irandom_range(0,2);
				if(rang == 0)
					inst.image_angle = -30;
				if(rang == 1)
					inst.image_angle = 0;
				if(rang == 2)
					inst.image_angle = 30;
				inst.solid = false;
				o_camera.shake = 2;
		}
	}

	if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && health_ > 0)
		take_hit(self, 0);
	
}