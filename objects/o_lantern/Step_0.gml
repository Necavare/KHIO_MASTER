x += (o_player.x-x)*.6;
y += (o_player.y-y)*.6;

if(o_player.isWalking)
	swingMax = 9;
else if(o_player.isRunning)
	swingMax = 15;
else
	swingMax = 6;

if(forward && lanternSwing < swingMax)
	lanternSwing+=(swingMax/15)+1;
else
	forward = false;

if(!forward && lanternSwing > -swingMax)
	lanternSwing-=(swingMax/15)+1;
else
	forward = true;

switch(o_player.img_index) {
	case 0: image_angle = -global.camera_angle; depth = o_player.depth - 1; image_xscale = .6; break; // Down
	case 1: image_angle = -global.camera_angle; depth = o_player.depth - 1; image_xscale = .3; break; // Down Right
	case 2: image_angle = -global.camera_angle; depth = o_player.depth + 1; image_xscale = 0; break; // Right
	case 3: image_angle = -global.camera_angle; depth = o_player.depth + 1; image_xscale = 0; break; // Up Right
	case 4: image_angle = -global.camera_angle; depth = o_player.depth + 1; image_xscale = 0; break; // Up
	case 5: image_angle = -global.camera_angle; depth = o_player.depth + 1; image_xscale = 0; break; // Up Left
	case 6: image_angle = -global.camera_angle; depth = o_player.depth + 1; image_xscale = 0; break; // Left
	case 7: image_angle = -global.camera_angle; depth = o_player.depth - 1; image_xscale = -.3; break; // Down Left
}

if(o_player.isHoldingTool || o_player.isHoldingWeapon) {
	depth = o_player.depth + 1;
}

if(isLit) {
	var flame = instance_create_depth(x,y,depth,o_effect_lantern);
	flame.z = z;
}

image_angle += lanternSwing;

if(o_player.bob)
	z = 8;
else
	z = 7;
	
if(keyboard_check_pressed(ord("F")))
	isLit = !isLit;

sprite_index = s_lantern;

// Drop logs and rocks	
if(o_player.isSitting || o_player.isSleeping || o_player.isRolling || o_player.isDead || o_player.isDying) {
	visible = false;
} else
	visible = true;
	
if(!global.lantern) {
	global.lantern = false;
	o_hud.lanternInst = -1;
	instance_destroy(self);
}
	
show_debug_message("LanternLit " + string(isLit))
