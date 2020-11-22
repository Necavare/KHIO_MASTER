// Setting animation for current player mode
if(!isRolling && !isSwinging && !isStabbing && !isBlocking) {
	if(isIdle) { // Idle
		if(isDying) { // Dying down
			if(img_index == 0)
				spr_index = s_death_down;
			else if(img_index == 1)
				spr_index = s_death_down_right;
			else if(img_index == 2)
				spr_index = s_death_right;
			else if(img_index == 3)
				spr_index = s_death_up_right;
			else if(img_index == 4)
				spr_index = s_death_up;
			else if(img_index == 5)
				spr_index = s_death_up_left;
			else if(img_index == 6)
				spr_index = s_death_left;
			else if(img_index == 7)
				spr_index = s_death_down_left;
		} else if(isDying && !isStanding) { // Idle dying
			if(img_index == 0)
				spr_index = s_death_down;
			else if(img_index == 1)
				spr_index = s_death_down_right;
			else if(img_index == 2)
				spr_index = s_death_right;
			else if(img_index == 3)
				spr_index = s_death_up_right;
			else if(img_index == 4)
				spr_index = s_death_up;
			else if(img_index == 5)
				spr_index = s_death_up_left;
			else if(img_index == 6)
				spr_index = s_death_left;
			else if(img_index == 7)
				spr_index = s_death_down_left;
		
			img_frame = 5;
		} else if(isSitting && !isStanding && !isHarvesting) { // Idle sitting
				if(img_index == 0)
				spr_index = s_sit_down;
			else if(img_index == 1)
				spr_index = s_sit_down_right;
			else if(img_index == 2)
				spr_index = s_sit_right;
			else if(img_index == 3)
				spr_index = s_sit_up_right;
			else if(img_index == 4)
				spr_index = s_sit_up;
			else if(img_index == 5)
				spr_index = s_sit_up_left;
			else if(img_index == 6)
				spr_index = s_sit_left;
			else if(img_index == 7)
				spr_index = s_sit_down_left;
		
			img_frame = 5;
		}  else if(isSleeping && !isSitting && !isStanding && !isHarvesting) { // Idle sleeping
			if(img_index == 0)
				spr_index = s_death_down;
			else if(img_index == 1)
				spr_index = s_death_down_right;
			else if(img_index == 2)
				spr_index = s_death_right;
			else if(img_index == 3)
				spr_index = s_death_up_right;
			else if(img_index == 4)
				spr_index = s_death_up;
			else if(img_index == 5)
				spr_index = s_death_up_left;
			else if(img_index == 6)
				spr_index = s_death_left;
			else if(img_index == 7)
				spr_index = s_death_down_left;
		
			img_frame = 5;
		} else if(isSitting && isStanding && !isHarvesting) { // Idle sitting down
				if(img_index == 0)
				spr_index = s_sit_down;
			else if(img_index == 1)
				spr_index = s_sit_down_right;
			else if(img_index == 2)
				spr_index = s_sit_right;
			else if(img_index == 3)
				spr_index = s_sit_up_right;
			else if(img_index == 4)
				spr_index = s_sit_up;
			else if(img_index == 5)
				spr_index = s_sit_up_left;
			else if(img_index == 6)
				spr_index = s_sit_left;
			else if(img_index == 7)
				spr_index = s_sit_down_left;
		} else if(!isSleeping && !isSitting && !isStanding && !isHarvestingIdle && !isHarvesting) { // Idle standing up
			if(img_index == 0)
				spr_index = s_sit_down;
			else if(img_index == 1)
				spr_index = s_sit_down_right;
			else if(img_index == 2)
				spr_index = s_sit_right;
			else if(img_index == 3)
				spr_index = s_sit_up_right;
			else if(img_index == 4)
				spr_index = s_sit_up;
			else if(img_index == 5)
				spr_index = s_sit_up_left;
			else if(img_index == 6)
				spr_index = s_sit_left;
			else if(img_index == 7)
				spr_index = s_sit_down_left;
		} else if(isSleeping && isStanding && !isHarvesting) { // Laying down
			if(img_index == 0)
				spr_index = s_death_down;
			else if(img_index == 1)
				spr_index = s_death_down_right;
			else if(img_index == 2)
				spr_index = s_death_right;
			else if(img_index == 3)
				spr_index = s_death_up_right;
			else if(img_index == 4)
				spr_index = s_death_up;
			else if(img_index == 5)
				spr_index = s_death_up_left;
			else if(img_index == 6)
				spr_index = s_death_left;
			else if(img_index == 7)
				spr_index = s_death_down_left;
		}  else if(isHarvesting && isHarvestingIdle && !isStanding) { // Idle bag rummaging
			spr_index = s_bag_idle;
		} else if(!isHarvesting && isHarvestingIdle && !isStanding) { // Idle bag up
			spr_index = s_bag_down;
		} else if(isHarvesting && !isHarvestingIdle && isStanding) { // Idle bag down
			spr_index = s_bag_down;
		} else if(!isHoldingTool && !isHoldingWeapon) { // Idle Standing
			if(img_index == 0)
				spr_index = s_idle_down;
			else if(img_index == 1)
				spr_index = s_idle_down_right;
			else if(img_index == 2)
				spr_index = s_idle_right;
			else if(img_index == 3)
				spr_index = s_idle_up_right;
			else if(img_index == 4)
				spr_index = s_idle_up;
			else if(img_index == 5)
				spr_index = s_idle_up_left;
			else if(img_index == 6)
				spr_index = s_idle_left;
			else if(img_index == 7)
				spr_index = s_idle_down_left;
		} else if(isHoldingTool) { // Idle Standing with tool
			if(rotationAngle == global.camera_angle) {
				spr_index = s_hold_idle;
			} else if(rotationAngle < global.camera_angle)
				spr_index = s_hold_left;
			else if(rotationAngle > global.camera_angle)
				spr_index = s_hold_right;
		
			rotationAngle = global.camera_angle;
		} else if(isHoldingWeapon && !isAimingWeapon && !isReloadingWeapon) { // Idle standing with weapon and not aiming
			spr_index = s_gun_idle;
		
			if(rotationAngle == global.camera_angle) {
				spr_index = s_gun_idle;
			} else if(rotationAngle < global.camera_angle)
				spr_index = s_gun_left;
			else if(rotationAngle > global.camera_angle)
				spr_index = s_gun_right;
		
			rotationAngle = global.camera_angle;
		} else if(isHoldingWeapon && isAimingWeapon && !isReloadingWeapon) { // Idle standing with weapon and aiming
		
			if(rotationAngle == global.camera_angle) {
				spr_index = s_aim_idle;
			} else if(rotationAngle < global.camera_angle)
				spr_index = s_aim_turn_left;
			else if(rotationAngle > global.camera_angle)
				spr_index = s_aim_turn_right;
		
			rotationAngle = global.camera_angle;
		} else if(isHoldingWeapon && isReloadingWeapon) { // Idle standing with weapon and reloading

			if(rotationAngle == global.camera_angle) {
				spr_index = s_reload_idle;
			} else if(rotationAngle < global.camera_angle)
				spr_index = s_reload_turn_left;
			else if(rotationAngle > global.camera_angle)
				spr_index = s_reload_turn_right;
		
			rotationAngle = global.camera_angle;
		} 
	} else if(isWalking) { // Walking
		if(!isHoldingTool && !isHoldingWeapon) { // Walking with nothing
			if(img_index == 0)
				spr_index = s_walk_down;
			else if(img_index == 1)
				spr_index = s_walk_down_right;
			else if(img_index == 2)
				spr_index = s_walk_right;
			else if(img_index == 3)
				spr_index = s_walk_up_right;
			else if(img_index == 4)
				spr_index = s_walk_up;
			else if(img_index == 5)
				spr_index = s_walk_up_left;
			else if(img_index == 6)
				spr_index = s_walk_left;
			else if(img_index == 7)
				spr_index = s_walk_down_left;
		} else if(isHoldingTool) { // Walking and holding tools
			if(img_index == 0)
				spr_index = s_hold_walk_down;
			else if(img_index == 1)
				spr_index = s_hold_walk_down_right;
			else if(img_index == 2)
				spr_index = s_hold_walk_right;
			else if(img_index == 3)
				spr_index = s_hold_walk_up_right;
			else if(img_index == 4)
				spr_index = s_hold_walk_up;
			else if(img_index == 5)
				spr_index = s_hold_walk_up_left;
			else if(img_index == 6)
				spr_index = s_hold_walk_left;
			else if(img_index == 7)
				spr_index = s_hold_walk_down_left;
		} else if(isHoldingWeapon && !isAimingWeapon && !isReloadingWeapon) { // Walking with weapon and not aiming
			if(img_index == 0)
				spr_index = s_gun_walk_down;
			else if(img_index == 1)
				spr_index = s_gun_walk_down_right;
			else if(img_index == 2)
				spr_index = s_gun_walk_right;
			else if(img_index == 3)
				spr_index = s_gun_walk_up_right;
			else if(img_index == 4)
				spr_index = s_gun_walk_up;
			else if(img_index == 5)
				spr_index = s_gun_walk_up_left;
			else if(img_index == 6)
				spr_index = s_gun_walk_left;
			else if(img_index == 7)
				spr_index = s_gun_walk_down_left;
		} else if(isHoldingWeapon && isAimingWeapon && !isReloadingWeapon) { // Walking with weapon and aiming
			if(img_index == 0)
				spr_index = s_aim_down;
			else if(img_index == 1)
				spr_index = s_aim_down_right;
			else if(img_index == 2)
				spr_index = s_aim_right;
			else if(img_index == 3)
				spr_index = s_aim_up_right;
			else if(img_index == 4)
				spr_index = s_aim_up;
			else if(img_index == 5)
				spr_index = s_aim_up_left;
			else if(img_index == 6)
				spr_index = s_aim_left;
			else if(img_index == 7)
				spr_index = s_aim_down_left;
		} else if(isHoldingWeapon && isReloadingWeapon) { // Walking with weapon and reloading
			if(img_index == 0)
				spr_index = s_reload_walk_down;
			else if(img_index == 1)
				spr_index = s_reload_walk_down_right;
			else if(img_index == 2)
				spr_index = s_reload_walk_right;
			else if(img_index == 3)
				spr_index = s_reload_walk_up_right;
			else if(img_index == 4)
				spr_index = s_reload_walk_up;
			else if(img_index == 5)
				spr_index = s_reload_walk_up_left;
			else if(img_index == 6)
				spr_index = s_reload_walk_left;
			else if(img_index == 7)
				spr_index = s_reload_walk_down_left;
		}
	} else if(isRunning) { // Running
		if(!isHoldingTool && !isHoldingWeapon) {
			if(img_index == 0)
				spr_index = s_run_down;
			else if(img_index == 1)
				spr_index = s_run_down_right;
			else if(img_index == 2)
				spr_index = s_run_right;
			else if(img_index == 3)
				spr_index = s_run_up_right;
			else if(img_index == 4)
				spr_index = s_run_up;
			else if(img_index == 5)
				spr_index = s_run_up_left;
			else if(img_index == 6)
				spr_index = s_run_left;
			else if(img_index == 7)
				spr_index = s_run_down_left;
		} else if(isHoldingTool) { // Running with tool
			spr_index = s_hold_run;
		} else if(isHoldingWeapon) { // Running with weapon
			spr_index = s_gun_run;
		}  
	}

} else if(isRolling && !isSwinging && !isStabbing && !isBlocking) { // Rolling
	if(rollDirection == 0)
		spr_index = s_roll_up_right;
	else if(rollDirection == 1)
		spr_index = s_roll_up_left;
	else if(rollDirection == 2)
		spr_index = s_roll_down_right;
	else if(rollDirection == 3)
		spr_index = s_roll_down_left;
} else if(isSwinging) {
	spr_index = s_swing;
} else if(isStabbing) {
	spr_index = s_stab;
} else if(isBlocking) {
	spr_index = s_block;
}

if(!isStanding && !isSleeping && !isHarvesting && !isHarvestingIdle && !isDying && !isDead) {
	if(img_index == 0)
		spr_index = s_sit_down;
	else if(img_index == 1)
		spr_index = s_sit_down_right;
	else if(img_index == 2)
		spr_index = s_sit_right;
	else if(img_index == 3)
		spr_index = s_sit_up_right;
	else if(img_index == 4)
		spr_index = s_sit_up;
	else if(img_index == 5)
		spr_index = s_sit_up_left;
	else if(img_index == 6)
		spr_index = s_sit_left;
	else if(img_index == 7)
		spr_index = s_sit_down_left;
}

// Drawing player
var scale = player_scale;
var angle = -camera_get_view_angle(view_camera[0]);

// Bleeding effet
if(isBleeding || isInjured || kickBack) {
	draw_sprite_ext(spr_index,img_frame,x+irandom_range(-2,2)+kick,y,scale,scale,angle,c_red,.1+kick/2);
	draw_sprite_ext(spr_index,img_frame,x+irandom_range(-2,2)+kick,y,scale,scale,angle,c_green,.1+kick/2);
	draw_sprite_ext(spr_index,img_frame,x,y+irandom_range(-2,2)+kick,scale,scale,angle,c_blue,.1+kick/2);
		
	if(kickBack)
		kick+=.1;
}

if(global.bodyEquipped == item.bluecloak) {
	shader_set(sh_player);

	if(!isDead) {
		if(isHoldingTool && !global.isHoldingFood && o_tool.side) {
			draw_sprite_ext(spr_index,img_frame,x,y,-scale,scale,angle,image_blend,image_alpha);
			if(isBleeding || isInjured || hunger_ <= 0 || kickBack)
				draw_sprite_ext(spr_index,img_frame,x,y,-scale,scale,angle,c_red,.5+irandom_range(-1,0)+kick);
		} else {
			draw_sprite_ext(spr_index,img_frame,x,y,scale,scale,angle,image_blend,image_alpha);
			if(isBleeding || isInjured || hunger_ <= 0 || kickBack)
				draw_sprite_ext(spr_index,img_frame,x,y,scale,scale,angle,c_red,.5+irandom_range(-1,0)+kick);
		}
	} else
		draw_sprite_ext(spr_index,img_frame,x,y,-scale,scale,angle,image_blend,image_alpha);

	if(global.headEquipped == item.pumpkin)
		if(isHoldingTool || isHoldingWeapon)
			draw_sprite_ext(s_player_pumpkin,4,x,y,-scale*1.25,scale*1.25,angle,image_blend,image_alpha);
		else if(!isRolling)
			draw_sprite_ext(s_player_pumpkin,img_index,x,y,-scale*1.25,scale*1.25,angle,image_blend,image_alpha);

	shader_reset();
} else {
	if(!isDead) {
		if(isHoldingTool && !global.isHoldingFood && o_tool.side) {
			draw_sprite_ext(spr_index,img_frame,x,y,-scale,scale,angle,image_blend,image_alpha);
			if(isBleeding || isInjured || hunger_ <= 0 || kickBack)
				draw_sprite_ext(spr_index,img_frame,x,y,-scale,scale,angle,c_red,.5+irandom_range(-1,0)+kick);
		} else {
			draw_sprite_ext(spr_index,img_frame,x,y,scale,scale,angle,image_blend,image_alpha);
			if(isBleeding || isInjured || hunger_ <= 0 || kickBack)
				draw_sprite_ext(spr_index,img_frame,x,y,scale,scale,angle,c_red,.5+irandom_range(-1,0)+kick);
		}
	} else
		draw_sprite_ext(spr_index,img_frame,x,y,-scale,scale,angle,image_blend,image_alpha);
	
	if(global.headEquipped == item.pumpkin)
		if(isHoldingTool || isHoldingWeapon)
			draw_sprite_ext(s_player_pumpkin,4,x,y,-scale*1.25,scale*1.25,angle,image_blend,image_alpha);
		else if(!isRolling)
			draw_sprite_ext(s_player_pumpkin,img_index,x,y,-scale*1.25,scale*1.25,angle,image_blend,image_alpha);
}

if(global.headEquipped == item.pumpkin && (isSitting || isSleeping || isHarvesting)) {
	o_hud.equipItems[# 0, 0] = 0;
	global.headEquipped = o_hud.equipItems[# 0, 0];
	pickup_item(o_hud, item.pumpkin, 1, -1);
}

if(spr_index == s_bag_down && img_frame == 3 && !bagSound) {
	
	//audio_play_sound(sn_pack, 1, 0);
	
	if(img_frame == 0) {
		switch(flap) {
			case 0: audio_play_sound(sn_flap_1,1,0); flap++; break;
			case 1: audio_play_sound(sn_flap_2,1,0); flap=0; break;
		}
	} else if(img_frame == 3) {
		switch(pack) {
			case 0: audio_play_sound(sn_pack_1,1,0); pack++; break;
			case 1: audio_play_sound(sn_pack_2,1,0); pack=0; break;
		}
	}
	bagSound = true;
} else if(spr_index != s_bag_down) {
	bagSound = false;
}