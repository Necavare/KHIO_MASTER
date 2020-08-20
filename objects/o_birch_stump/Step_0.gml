if(!global.generatingEnvironment){
	if(isOnFire)
		event_inherited();

	if(health_ <= 0)
		instance_destroy(self);
		
	if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && health_ > 0)
		take_hit(self, 0);
}