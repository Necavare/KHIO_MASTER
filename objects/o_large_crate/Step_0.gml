if(!global.generatingEnvironment){
event_inherited();

if(holdSlot && alarm[2] == -1)
	alarm[2] = 5;

if(startingSprite == -1)
	startingSprite = sprite_index;

if(global.isCrateOpen && global.crate == self) {
	if(startingSprite == s_large_crate)
		sprite_index = s_large_crate_open;
	else
		sprite_index = s_large_crate_open_birch;
} else
	sprite_index = startingSprite;
	
if(health_ <= 0)
	instance_destroy(self);
}

if(buildZ < 0)
	buildZ+=.5;
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit)
	take_hit(self, 2);
	
// Destroys the instance
if(health_ <= 0)
	instance_destroy(self);