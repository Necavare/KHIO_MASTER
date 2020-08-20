if(!global.journalGateFound && collision_circle(x,y,50, o_player, true, true)) {
	global.journalGateFound = true;
	o_hud.journalGateTime = 0;
}

if(buildZ < 0)
	buildZ+=.5;
	
if(items[# 0, 0] == item.keycard) {
	sprite_index = s_compound_access_keycard;
	var wall = instance_nearest(x,y, o_compound_wall);
	wall.keyCard = true;
	if(playClick) {
		audio_play_sound(sn_largecrate_open, 1, 0);
		playClick = false;
	}
} else {
	sprite_index = s_compound_access;
	
	if(!playClick) {
		audio_play_sound(sn_largecrate_open, 1, 0);
		playClick = true;
	}
}

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung)
	take_hit(self, 1);