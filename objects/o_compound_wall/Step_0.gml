if(!global.journalGateFound && collision_circle(x,y,50, o_player, true, true)) {
	global.journalGateFound = true;
	o_hud.journalGateTime = 0;
}

if(keyCard && buildZ > -image_number) {
	buildZ-=.1;
	if(!audio_is_playing(sn_compoundentry)) {
		audio_emitter_position(compound, x, y, 0);
		audio_play_sound_on(compound, sn_compoundentry, 0, 1);
	}
} else if(buildZ <= -image_number) {
	solid = false;
	audio_stop_sound(sn_compoundentry);
}
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung)
	take_hit(self, 2);