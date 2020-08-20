if(!global.generatingEnvironment){
	if(holdSlot && alarm[1] == -1)
		alarm[1] = 5;

	if(startingSprite == -1)
		startingSprite = sprite_index;

	if(global.isCrateOpen && global.crate == self) {
		if(startingSprite == s_small_crate)
			sprite_index = s_small_crate_open;
		else
			sprite_index = s_small_crate_open_birch;
	} else
		sprite_index = startingSprite;
	
	if(health_ <= 0)
		instance_destroy(self);
}

if(buildZ < 0)
	buildZ+=.5;
	
event_inherited();

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && !isExploded) {
	take_hit(self, 0);
	isExploded = true;
	isOnFire = true;
}