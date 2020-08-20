
// Inherit the parent event
if(isOnFire)
	event_inherited();
	
if(health_ <= 0)
	instance_destroy(self);

// Hitting
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && health_ > 0)
	take_hit(self, 4);
	
// Getting set on fire from crate
var trappedCrate = instance_nearest(x,y,o_trapped_crate)
if(instance_exists(trappedCrate) && trappedCrate.isExploded = true && point_distance(x,y,trappedCrate.x, trappedCrate.y) < 100)
	isOnFire = true;