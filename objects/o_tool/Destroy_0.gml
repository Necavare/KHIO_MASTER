if(!instance_exists(o_food))
	o_player.isHoldingTool = false;
	
global.isHolding = false;
	
o_player.isSwinging = false;
o_player.isStabbing = false;
global.draw_cursor = true;

if(audio_is_playing(sn_fire))
	audio_stop_sound(sn_fire);
	
if(audio_is_playing(sn_flare_light))
	audio_stop_sound(sn_flare_light);
	
if(audio_is_playing(sn_flare_burn))
	audio_stop_sound(sn_flare_burn);
	
global.canMove = true;