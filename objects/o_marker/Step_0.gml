if(color == 0) {
	if(frame == 0)
		sprite_index = s_marker_green_1;
	else if(frame == 1)
		sprite_index = s_marker_green_2;
	else if(frame == 2)
		sprite_index = s_marker_green_3;
	else if(frame == 3)
		sprite_index = s_marker_green_4;
} else if(color == 1) {
	if(frame == 0)
		sprite_index = s_marker_red_1;
	else if(frame == 1)
		sprite_index = s_marker_red_2;
	else if(frame == 2)
		sprite_index = s_marker_red_3;
	else if(frame == 3)
		sprite_index = s_marker_red_4;
} else if(color == 2) {
	if(frame == 0)
		sprite_index = s_marker_blue_1;
	else if(frame == 1)
		sprite_index = s_marker_blue_2;
	else if(frame == 2)
		sprite_index = s_marker_blue_3;
	else if(frame == 3)
		sprite_index = s_marker_blue_4;
}

#region text editor
	
	// Check if the enter button has been pressed to save name
	if((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(global.K_INVENTORY) || !collision_circle(o_player.x, o_player.y, 50, self, true, false)) && editNameSelected) {
		editNameSelected = false;
		o_hud.markerName[index] = keyboard_string;	
	}

	if(editNameSelected) {
		if(string_length(keyboard_string) < 17)
			o_hud.markerName[index] = keyboard_string;
		else
			keyboard_string = o_hud.markerName[index];
	}


	// Reseting to index number if string is blank
	if(!editNameSelected && o_hud.markerName[index] == "")
		o_hud.markerName[index] = index+1;

#endregion
	

if(buildZ < 0)
	buildZ+=.5;
	
if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit)
	take_hit(self, 0);
	
if(health_ <= 0)
	instance_destroy(self);
	
if(editNameSelected) {
	global.canMove = false;
	global.interactingObject = -1;
	global.interactingLoad = -5;
} else {
	global.canMove = true;
}