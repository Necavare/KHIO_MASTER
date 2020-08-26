// Destroys the instance
if(health_ <= 0)
	instance_destroy(self);
	
if(upgraded)
	isOnFire = false;
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit && !upgraded) {
	take_hit(self, 0);
} else if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit && upgraded)
	take_hit(self, 2);
	
