// find depth for loading thing
if(global.generatingEnvironment)
	depth = -y;
	
//dont waste processing power when its generating
else{
	if(isOnFire)
		event_inherited();
	
	if(health_ <= 0) {	
		//if(z >= image_number) {
			if(!isOnFire) {
				// Creating birch stump
				var stump = instance_create_depth(x,y,depth,o_spruce_stump);
				stump.draw_dust = true;
				global.spruce_tree_angle = image_angle;
		
				// Creating squirrel if one is inside
				if(isSquirrel)
					instance_create_depth(x,y,depth,o_squirrel);
		
				// Spawning items
				repeat(irandom_range(2,5)) {
					spawnCount++;
					var stick = instance_create_depth(x,y,depth, o_item);
					stick.item_ = item.stick;
					stick.direction = irandom_range(0,360);
					stick.fountain = true;
					stick.wait = true;
		
					stick.alarm[3] = spawnCount* 6;
			
					o_camera.shake = 2;
				}
				
				repeat(12) {
				var chip = instance_create_depth(x, y, depth, o_particles);
					
				}
			//}
			instance_destroy(self);
		}
	
		//z++;
		if(!isOnFire) {
				var inst = instance_create_depth(x-16,y,0,o_spruce_log);
				var rang = irandom_range(0,2);
				if(rang == 0)
					inst.image_angle = -30;
				if(rang == 1)
					inst.image_angle = 0;
				if(rang == 2)
					inst.image_angle = 30;
				o_camera.shake = 2;
				var inst = instance_create_depth(x+16,y,0,o_spruce_log);
				var rang = irandom_range(0,2);
				if(rang == 0)
					inst.image_angle = -30;
				if(rang == 1)
					inst.image_angle = 0;
				if(rang == 2)
					inst.image_angle = 30;
				o_camera.shake = 2;
			
				var inst = instance_create_depth(x,y+16,0,o_spruce_log);
				var rang = irandom_range(0,2);
				if(rang == 0)
					inst.image_angle = -30;
				if(rang == 1)
					inst.image_angle = 0;
				if(rang == 2)
					inst.image_angle = 30;
				o_camera.shake = 2;
		}
	}

	if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && health_ > 0)
		take_hit(self, 0);

}