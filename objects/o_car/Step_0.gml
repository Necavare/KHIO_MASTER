if(holdSlot && alarm[1] == -1)
	alarm[1] = 5;
	
if(room == r_title)
	solid = false;
else
	solid = true;
	
if(place_meeting(x,y,o_player))
	sprite_index = s_car_blue;
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung)
	take_hit(self, 2);