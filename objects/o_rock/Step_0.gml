// Destroying tree
if(health_ <= 0) {	

		instance_destroy(self);
		
		
		
	if(sprite_index == s_rock_small) {
		var inst = instance_create_depth(x+16,y,0,o_rocks);
		
		var rang = irandom_range(0,2);
		if(rang == 0)
			inst.image_angle = -30;
		if(rang == 1)
			inst.image_angle = 0;
		if(rang == 2)
			inst.image_angle = 30;
		inst.solid = false;
		o_camera.shake = 2;
		
		// Spawning items
		repeat(irandom_range(1,2)) {
			spawnCount++;
			var ore = instance_create_depth(x,y,depth, o_item);
			ore.image_index = item.compound;
			ore.direction = irandom_range(0,360);
			ore.fountain = true;
			ore.wait = true;
		
			ore.alarm[3] = spawnCount* 6;
			
			o_camera.shake = 2;
		}
		
	} else if(sprite_index == s_rock_medium) {
		var inst = instance_create_depth(x+16,y,0,o_rocks);
		
		var rang = irandom_range(1,3);
		if(rang == 0)
			inst.image_angle = -30;
		if(rang == 1)
			inst.image_angle = 0;
		if(rang == 2)
			inst.image_angle = 30;
		inst.solid = false;
		o_camera.shake = 2;
		
		// Spawning items
		repeat(irandom_range(2,3)) {
			spawnCount++;
			var ore = instance_create_depth(x,y,depth, o_item);
			ore.image_index = item.compound;
			ore.direction = irandom_range(0,360);
			ore.fountain = true;
			ore.wait = true;
		
			ore.alarm[3] = spawnCount* 6;
			
			o_camera.shake = 2;
		}
		
	}
}

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && health_ > 0) {
	take_hit(self, 1);
	canHit = false;
}

if(instance_exists(o_tool) && !o_tool.isHitting)
	canHit = true;

if(!canHit) {
	if(chopFrame < 3 && chopFrame > -1)
		chopFrame+=.25;
	else if(chopFrame > -1)
		chopFrame = 0;
}