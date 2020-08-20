// Inherit the parent event
if(isOnFire)
	event_inherited();

if(health_ <= 0) {
	// Destroys the instance
	instance_destroy(self);
}

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && health_ > 0 && canHit) {
	audio_emitter_position(emitter, x, y, 0);
	take_hit(self, 4);
}