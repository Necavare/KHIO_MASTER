if(global.grabbed == self && mouse_check_button_pressed(global.M_LEFT) && position_meeting(mouse_x, mouse_y, self) && place_free(x,y))
	global.grabbed = -1;

if(global.grabbed == self) {
	x += (mouse_x-x)*carrySpeed; 
	y += (mouse_y-y)*carrySpeed;
	
	// Rotating the object
	if(keyboard_check_pressed(global.K_ROTATELEFT))
		image_angle+=30;
	else if(keyboard_check_pressed(global.K_ROTATERIGHT))
		image_angle-=30;
	
	// Carry speed
	if(stackCount == 0)
		carrySpeed = .05;
	else if(stackCount == 1)
		carrySpeed = .025;
	
	// Dropping item if clicked and mouse is not meeting
	if(mouse_check_button_pressed(global.M_LEFT) && place_free(x,y) && !position_meeting(mouse_x, mouse_y, self))
		global.grabbed = -1;
}

// Lifting item when grabbed
if(global.grabbed == self && z < 8)
	z+=.5;
else if(global.grabbed == -1 && z > 0) 
	z-=.5;
	
if(!collision_circle(o_player.x, o_player.y, 50, self, true, false) && global.grabbed == self){
	global.grabbed = -1;
	//change its minimap vars
	var miniValues;
	miniValues[0] = sprite_index; //set sprite for minimap
	miniValues[1] = image_angle; //set angle of rotation
	miniValues[2] = x+global.xoffset; //x position
	miniValues[3] = y+global.yoffset; //y position
	miniValues[4] = y+global.yoffset; //general depth, some objects can set this to 0 or other small number if bottom layer
	ds_map_replace(global.minimapVar, id, miniValues);
	//scr_refresh_update(x+global.xoffset,y+global.yoffset);	//refresh minimap
}

// Bouncing item when spawned
if(bounce) {
	if(z < 8)
		z+=2;
	else if(z >= 8)
		bounce = false;
}

// Lowering item
if(!bounce && z > 0 && global.grabbed == -1)
	z-=1.5;
	
	