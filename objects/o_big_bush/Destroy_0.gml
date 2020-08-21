// Inherit the parent event
event_inherited();

if(!isOnFire && !global.generatingEnvironment) {
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
}