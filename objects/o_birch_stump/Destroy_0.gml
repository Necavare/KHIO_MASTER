// Inherit the parent event
event_inherited();

// Spawning planks
if(!isOnFire && !global.generatingEnvironment) {
	spawnCount++;
	var log = instance_create_depth(x,y,depth, o_item);
			
	log.image_index = item.planks;
				
	log.direction = irandom_range(0,360);
	log.fountain = true;
	log.wait = true;
		
	log.alarm[3] = spawnCount* 6;
			
	o_camera.shake = 2;
	
	if(isKey) {
		spawnCount++;
		var fungi = instance_create_depth(x,y,depth, o_item);
			
		fungi.image_index = item.keycard;
				
		fungi.direction = irandom_range(0,360);
		fungi.fountain = true;
		fungi.wait = true;
		fungi.durability = 11;
		
		fungi.alarm[3] = spawnCount* 6;
	}
}