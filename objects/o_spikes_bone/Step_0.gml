if(buildZ < 0)
	buildZ+=.5;
	
 if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit)
	take_hit(self, 6);
	
// Destroys the instance
if(health_ <= 0)
	instance_destroy(self);