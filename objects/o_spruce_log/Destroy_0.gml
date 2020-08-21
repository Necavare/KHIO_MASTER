// Inherit the parent event
event_inherited();

if(!isOnFire && !isCombining && !global.generatingEnvironment) {
	// Spawning planks
	repeat(2) {
		spawnCount++;
		var plank = instance_create_depth(x,y,depth, o_item);
			
		plank.item_ = item.planks;
			
		plank.direction = irandom_range(0,360);
		plank.fountain = true;
		plank.wait = true;
		
		plank.alarm[3] = spawnCount* 6;
			
		o_camera.shake = 2;
	}
}