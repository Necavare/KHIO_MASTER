if(!global.generatingEnvironment){
	if(holdSlot && alarm[2] == -1)
		alarm[2] = 5;

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
//check if a lit firepit is nearby and set alarm5
var nearestFirepit = instance_nearest(x,y,o_firepit);
if(nearestFirepit != noone && alarm[5] <= 0 && nearestFirepit.isLit && !isCamp){
	show_debug_message("set alarm 5");
	alarm[5] = 10*60*60;//10 minutes default
}

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit)
	take_hit(self, 0);
	
// Destroys the instance
if(health_ <= 0)
	instance_destroy(self);