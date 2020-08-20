if(place_meeting(x,y,o_player))
	depth = o_player.depth-1;
	
if(health_ <= 0)
	instance_destroy(self);

// Inherit the parent event
if(isOnFire)
	event_inherited();

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && health_ > 0 && canHit) {
	audio_emitter_position(emitter, x, y, 0);
	take_hit(self, 4);
}