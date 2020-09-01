global.grabbed = -1;

if(o_player.isDead || o_player.isDying || o_player.isSitting || o_player.isSleeping)
	instance_destroy(self);

// Changing camera angle and mouse position
if(!global.isPaused && !global.isInventoryOpen) { // !target && 
	global.camera_angle += (window_mouse_get_x() - (window_get_width()/2)) * .055;
	window_mouse_set(window_get_width()/2, window_get_height()/2);
}

if(global.itemEquipped != equipped || o_player.isRolling || global.isPaused)
	instance_destroy(self);
	
global.isHolding = true;
// Moving object towards player
x += (o_player.x-x)*.6;
y += (o_player.y-y)*.6;
	
// Debugging controls
/*if(keyboard_check_pressed(ord("O")))
	startingAngle-=2;
if(keyboard_check_pressed(ord("P")))
	startingAngle+=2;
	
if(keyboard_check_pressed(vk_left))
	xx-=1;
if(keyboard_check_pressed(vk_right))
	xx+=1;
	
if(keyboard_check_pressed(vk_up))
	yy-=1;
if(keyboard_check_pressed(vk_down))
	yy+=1;*/

if(!isSwung && !isStabbed && !isBlocking && !o_player.isRunning && !o_player.isWalking) 
	swingAngle = startingAngle;
else if(o_player.isRunning && !aiming) {
	if(side) {
		if(frame == 0)
			swingAngle = 88;
		else if(frame == 1)
			swingAngle = 84;
		else if(frame == 2)
			swingAngle = 50;
		else if(frame == 3) {
			swingAngle = 76;
		
			x += lengthdir_x(1, image_angle);
			y += lengthdir_y(1, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		} else if(frame == 4) {
			swingAngle = 68;
		
			x += lengthdir_x(2, image_angle);
			y += lengthdir_y(2, image_angle);
		} else if(frame == 5) {
			swingAngle = 80;
		
			x += lengthdir_x(2, image_angle);
			y += lengthdir_y(2, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		} 
	} else {
		if(frame == 0)
			swingAngle = -88;
		else if(frame == 1)
			swingAngle = -84;
		else if(frame == 2)
			swingAngle = -50;
		else if(frame == 3) {
			swingAngle = -76;
		
			x += lengthdir_x(-1, image_angle);
			y += lengthdir_y(-1, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		} else if(frame == 4) {
			swingAngle = -68;
		
			x += lengthdir_x(-2, image_angle);
			y += lengthdir_y(-2, image_angle);
		} else if(frame == 5) {
			swingAngle = -80;
		
			x += lengthdir_x(-2, image_angle);
			y += lengthdir_y(-2, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		} 
	}
} else if(o_player.isWalking && !aiming) {
	if(side) {
		if(frame == 7) {
			swingAngle = 105;
		
			x += lengthdir_x(-1, image_angle);
			y += lengthdir_y(-1, image_angle);
		}
	} else {
		if(frame == 7) {
			swingAngle = -105;
		
			x += lengthdir_x(-1, image_angle);
			y += lengthdir_y(-1, image_angle);
		}
	}
} else if(isSwung && !aiming) {
	if(side) {
		if(frame == 0)
			swingAngle = -68;
		else if(frame == 1)
			swingAngle = -96;
		else if(frame == 2)
			swingAngle = -56;
		else if(frame == 3) 
			swingAngle = -4;
		else if(frame == 4) {
			image_xscale = -1;
			swingAngle = 124;
		} else if(frame == 5) {
			image_xscale = -1;
			swingAngle = 126;
		} 
	} else if(!side) {
		if(frame == 0)
			swingAngle = 68;
		else if(frame == 1)
			swingAngle = 96;
		else if(frame == 2)
			swingAngle = 56;
		else if(frame == 3)
			swingAngle = 4;
		else if(frame == 4) {
			image_xscale = -1;
			swingAngle = -124;
		} else if(frame == 5) {
			image_xscale = -1;
			swingAngle = -126;
		}
	}
} else if(isStabbed && !aiming) {
	if(side) {
		if(frame == 1) {
			swingAngle = 2;
		
			x += lengthdir_x(-1, image_angle);
			y += lengthdir_y(-1, image_angle);

			x += lengthdir_x(6, image_angle+90);
			y += lengthdir_y(6, image_angle+90);
		} else if(frame == 2) {
			swingAngle = 0;
		
			x += lengthdir_x(-1, image_angle);
			y += lengthdir_y(-1, image_angle);

			x += lengthdir_x(6, image_angle+90);
			y += lengthdir_y(6, image_angle+90);
		} else if(frame == 3) {
			swingAngle = 6;
		
			x += lengthdir_x(-1, image_angle);
			y += lengthdir_y(-1, image_angle);

			x += lengthdir_x(3, image_angle+90);
			y += lengthdir_y(3, image_angle+90);
		} else if(frame == 4) {
			swingAngle = 48;
		
			x += lengthdir_x(1, image_angle);
			y += lengthdir_y(1, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		}
	} else {
		if(frame == 1) {
			swingAngle = -2;
		
			x += lengthdir_x(1, image_angle);
			y += lengthdir_y(1, image_angle);

			x += lengthdir_x(6, image_angle+90);
			y += lengthdir_y(6, image_angle+90);
		} else if(frame == 2) {
			swingAngle = 0;
		
			x += lengthdir_x(1, image_angle);
			y += lengthdir_y(1, image_angle);

			x += lengthdir_x(6, image_angle+90);
			y += lengthdir_y(6, image_angle+90);
		} else if(frame == 3) {
			swingAngle = -6;
		
			x += lengthdir_x(1, image_angle);
			y += lengthdir_y(1, image_angle);

			x += lengthdir_x(3, image_angle+90);
			y += lengthdir_y(3, image_angle+90);
		} else if(frame == 4) {
			swingAngle = -48;
		
			x += lengthdir_x(-1, image_angle);
			y += lengthdir_y(-1, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		}
	}
} else if(isBlocking && !aiming) {
	if(side) {
		if(frame == 0) {
			swingAngle = 110;
			
		} else if(frame == 1) {
			swingAngle = 104;
		
			x += lengthdir_x(4, image_angle);
			y += lengthdir_y(4, image_angle);

			x += lengthdir_x(-1, image_angle+90);
			y += lengthdir_y(-1, image_angle+90);
		} else if(frame == 2) {
			swingAngle = 86;
		
			x += lengthdir_x(4, image_angle);
			y += lengthdir_y(4, image_angle);
		} else if(frame == 3) {
			swingAngle = 86;
		
			x += lengthdir_x(4, image_angle);
			y += lengthdir_y(4, image_angle);
		} else if(frame == 4) {
			swingAngle = 88;
		
			x += lengthdir_x(4, image_angle);
			y += lengthdir_y(4, image_angle);
		} else if(frame == 5) {
			swingAngle = 86;
		
			x += lengthdir_x(4, image_angle);
			y += lengthdir_y(4, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		} else if(frame == 6) {
			swingAngle = 102;
		
			x += lengthdir_x(2, image_angle);
			y += lengthdir_y(2, image_angle);
		}
	} else {
		if(frame == 0) {
			swingAngle = -110;
			
		} else if(frame == 1) {
			swingAngle = -104;
		
			x += lengthdir_x(-4, image_angle);
			y += lengthdir_y(-4, image_angle);

			x += lengthdir_x(1, image_angle+90);
			y += lengthdir_y(1, image_angle+90);
		} else if(frame == 2) {
			swingAngle = -86;
		
			x += lengthdir_x(-4, image_angle);
			y += lengthdir_y(-4, image_angle);
		} else if(frame == 3) {
			swingAngle = -86;
		
			x += lengthdir_x(-4, image_angle);
			y += lengthdir_y(-4, image_angle);
		} else if(frame == 4) {
			swingAngle = -88;
		
			x += lengthdir_x(-4, image_angle);
			y += lengthdir_y(-4, image_angle);
		} else if(frame == 5) {
			swingAngle = -86;
		
			x += lengthdir_x(-4, image_angle);
			y += lengthdir_y(-4, image_angle);

			x += lengthdir_x(-1, image_angle+90);
			y += lengthdir_y(-1, image_angle+90);
		} else if(frame == 6) {
			swingAngle = -102;
		
			x += lengthdir_x(-2, image_angle);
			y += lengthdir_y(-2, image_angle);
		}
	}
} 

if(aiming) {
	if(side) {
		swingAngle = 155;
		x += lengthdir_x(2, image_angle);
		y += lengthdir_y(2, image_angle);
	} else {
		swingAngle = -155;
		x += lengthdir_x(-2, image_angle);
		y += lengthdir_y(-2, image_angle);
	}
}

/*swingAngle = startingAngle;

x += lengthdir_x(xx, image_angle);
y += lengthdir_y(xx, image_angle);

x += lengthdir_x(yy, image_angle+90);
y += lengthdir_y(yy, image_angle+90);*/

//show_debug_message(string(swingAngle))
//show_debug_message(string(xx))
//show_debug_message(string(yy))
	
// Exceptions for showing mouse
if(global.isPaused)
	global.draw_cursor = true;
else if(global.isInventoryOpen)
	global.draw_cursor = true;
else
	global.draw_cursor = false;

// Change image angle
image_angle = -global.camera_angle+swingAngle;

if(!global.isInventoryOpen && !isHitting) {

// Swinging
//if(!isBlocking && canBlockAgain) {
	
	
	if(!mouse_check_button(global.M_RIGHT) && aiming && !isStabbed && canSwing && alarm[3] == -1 && canBlockAgain && o_player.stamina >= 2) { // Stab 
		// Clicking to interact
			o_player.stamina -= 2;
			o_player.isStabbing = true;
			o_player.img_frame = 0;
			o_player.alarm[0] = 1;
		
			isStabbed = true;
			side = !side;
			startingAngle = -startingAngle;
			canSwing = false;
		
			// Effects
			o_camera.shake = 1;
			
			if(global.itemEquipped == item.torch) {
				switch(irandom(1)) {
					case 0: audio_play_sound(sn_swing_1, 1, 0); break;
					case 1: audio_play_sound(sn_swing_torch, 1, 0); break;
				}
			} else {
				switch(irandom(1)) {
					case 0: audio_play_sound(sn_swing_1, 1, 0); break;
					case 1: audio_play_sound(sn_swing_2, 1, 0); break;
				}
			}
				
			global.interactingObject = -1;
			global.interactingLoad = -1;
		
	} else if(!aiming && mouse_check_button_released(global.M_LEFT) && !mouse_check_button(global.M_RIGHT) && !isSwung && canSwing && alarm[3] == -1 && canBlockAgain && global.itemEquipped != item.grenade) { // Swing
		if(instance_exists(o_enemySwordTutorial))
			o_enemySwordTutorial.playerAction = true;
		
		o_player.isSwinging = true;
		o_player.img_frame = 0;
		o_player.alarm[0] = 1;
		
		isSwung = true;
		side = !side;
		startingAngle = -startingAngle;
		canSwing = false;
		
		finalDamage = damage;
		
		if(global.itemEquipped == item.torch) {
			switch(irandom(1)) {
				case 0: audio_play_sound(sn_swing_1, 1, 0); break;
				case 1: audio_play_sound(sn_swing_torch, 1, 0); break;
			}
		} else {
			switch(irandom(1)) {
				case 0: audio_play_sound(sn_swing_1, 1, 0); break;
				case 1: audio_play_sound(sn_swing_2, 1, 0); break;
			}
		}
		
		if((global.itemEquipped == item.stoneShovelB || global.itemEquipped == item.stoneShovelS
		|| global.itemEquipped == item.metalShovelB || global.itemEquipped == item.metalShovelS) && !isHitting) {
			instance_create_depth(x,y,8999, o_digprint);
			
			o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] -= durability;

			if(o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] <= 0) {
				instance_destroy(self);
				audio_play_sound(sn_tool_break, 1, 0);
			}
		
			o_hud.showHotbar = true;
		}
		
		
		// Effects
		o_camera.shake = 1;
	} else if(!aiming && mouse_check_button(global.M_RIGHT) && !mouse_check_button(global.M_LEFT) && !o_player.isRunning && !isBlocking && alarm[3] == -1 && canBlockAgain && global.itemEquipped != item.grenade && global.itemEquipped != item.snowball) { // Blocking
		if(instance_exists(o_enemySwordTutorial))
			o_enemySwordTutorial.playerAction = true;
		
		if(global.itemEquipped != item.knife && global.itemEquipped != item.torch && global.itemEquipped != item.flare && global.itemEquipped != item.lantern && !isStabbed && !isSwung) { // Items you cant block with
			isBlocking = true;
			canBlockAgain = false;
			alarm[3] = 90;
			
			o_player.stamina -= 5;
			o_player.isBlocking = true;
			o_player.img_frame = 0;
			o_player.alarm[0] = 1;
			
			if(collision_circle(x,y,100,o_enemySword, true, true)) {
				global.target = true;
				global.targetObject = instance_nearest(x,y, o_enemySword);
			}
			
		}
	} 
	
	
	if(!mouse_check_button(global.M_RIGHT) && !mouse_check_button(global.M_LEFT)) {
		canBlockAgain = true;
		o_player.isHoldingBlock = false;
		isBlocking = false;
		
		global.targetObject = -1;
		global.target = false;
		
		alarm[3] = -1;
	}

	if(mouse_check_button(global.M_RIGHT) && mouse_check_button(global.M_LEFT) && !isBlocking)
		aiming = true;
	else
		aiming = false;
		
}

// Decreasing durability if hitting something
if(isHitting && !isSwung && canSwing) {
	isHitting = false;
		
	if(global.itemEquipped == item.snowball) {
		if(o_hud.hotbarCount[# 0, o_hud.hotbarSlot] > 0)
			o_hud.hotbarCount[# 0, o_hud.hotbarSlot]--;
		
		if(o_hud.hotbarCount[# 0, o_hud.hotbarSlot] <= 0) {
			o_hud.hotbarCount[# 0, o_hud.hotbarSlot] = 0;
			o_hud.hotbarItems[# 0, o_hud.hotbarSlot] = 0;
			o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
		}
		
		audio_play_sound(sn_snowwalk_4, 1, 0);
		audio_play_sound(sn_snowwalk_4, 1, 0);
	} else if(global.itemEquipped != item.snowball) {
		o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] -= durability;

		if(o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] <= 0) {
			o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
			instance_destroy(self);
			audio_play_sound(sn_tool_break, 1, 0);
			o_hud.showHotbar = true;
		}
	}
}

depth = o_player.depth + 1;

if(aimImage < 4)
	aimImage+=.25;
else
	aimImage = 0;
	
if(global.itemEquipped == item.torch  && !audio_is_playing(sn_fire) && room != r_title && isLit)
	audio_play_sound(sn_fire, 1, 1);
else if(global.itemEquipped == item.torch  && audio_is_playing(sn_fire) && !isLit)
	audio_stop_sound(sn_fire);
	
if(global.itemEquipped == item.flare && !audio_is_playing(sn_flare_light) && !audio_is_playing(sn_flare_burn) && isLit)
	audio_play_sound(sn_flare_burn, 1, 1);
else if(global.itemEquipped == item.flare && audio_is_playing(sn_flare_burn) && !isLit)
	audio_stop_sound(sn_flare_burn);