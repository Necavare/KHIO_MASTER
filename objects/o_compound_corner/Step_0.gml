if(!global.journalGateFound && collision_circle(x,y,50, o_player, true, true)) {
	global.journalGateFound = true;
	o_hud.journalGateTime = 0;
}
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung)
	take_hit(self, 1);