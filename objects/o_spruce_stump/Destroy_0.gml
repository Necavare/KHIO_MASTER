// Inherit the parent event
event_inherited();

// Spawning planks
if(!isOnFire && !global.generatingEnvironment) {
	repeat(1) {
		spawnCount++;
		var log = instance_create_depth(x,y,depth, o_item);
			
		log.item_ = item.planks;
				
		log.direction = irandom_range(0,360);
		log.fountain = true;
		log.wait = true;
		
		log.alarm[3] = spawnCount* 6
	}
			
	if(isFungi) {
		spawnCount++;
		var fungi = instance_create_depth(x,y,depth, o_item);
			
		fungi.item_ = item.fungi;
				
		fungi.direction = irandom_range(0,360);
		fungi.fountain = true;
		fungi.wait = true;
		fungi.durability = 11;
		
		fungi.alarm[3] = spawnCount* 6;
	}
	
	if(isKey) {
		spawnCount++;
		var fungi = instance_create_depth(x,y,depth, o_item);
			
		fungi.item_ = item.keycard;
				
		fungi.direction = irandom_range(0,360);
		fungi.fountain = true;
		fungi.wait = true;
		fungi.durability = 11;
		
		fungi.alarm[3] = spawnCount* 6;
	}
} else if(!global.generatingEnvironment) {
	if(isFungi) {
		spawnCount++;
		var fungi = instance_create_depth(x,y,depth, o_item);
			
		fungi.item_ = item.cookedfungi;
				
		fungi.direction = irandom_range(0,360);
		fungi.fountain = true;
		fungi.wait = true;
		fungi.durability = 11;
		
		fungi.alarm[3] = spawnCount* 6;
			
		o_camera.shake = 2;
	}
}