if(o_player.isDead || o_player.isDying)
	instance_destroy(self);

// Changing camera angle and mouse position
if(!global.isPaused && !global.isInventoryOpen) { // !target && 
	global.camera_angle += (display_mouse_get_x() - (display_get_width()/2)) * .025;
	
	display_mouse_set(display_get_width()/2, display_get_height()/2);
	
	global.draw_cursor = false;
}

// Moving object towards player
if(o_player.isSitting) {
	x += (o_player.x-x)*.6;
	y += (o_player.y-y)*.6;
	x += lengthdir_x(-4,-global.camera_angle+90);
	y += lengthdir_y(-4,-global.camera_angle+90);
} else {
	x += (o_player.x-x)*.6;
	y += (o_player.y-y)*.6;
	x += lengthdir_x(2,-global.camera_angle);
	y += lengthdir_y(2,-global.camera_angle);
}

depth = o_player.depth + 1;

image_xscale = .5;
image_yscale = .5;

if(image_index != global.itemEquipped || o_player.isRolling || global.isPaused)
	instance_destroy(self);
	
if(mouse_check_button(global.M_LEFT) && !global.isInventoryOpen)
	isEating = true;
else
	isEating = false;

if(o_player.hunger_ >= 100)
	isEating = false;

if(isEating && alarm[0] == -1)
	alarm[0] = 3;
	
if(isEating && alarm[1] == -1)
	alarm[1] = 60;
	
if(!down && !isEating && z < startingZ)
	z++;
else if(!down && !isEating && z > startingZ)
	z--;