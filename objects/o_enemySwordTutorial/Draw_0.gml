if(!global.generatingEnvironment){

	// Setting animation for current player mode
	if(isStumbled){
		if((img_index == 0) || (img_index ==  1) || (img_index == 7))
			spr_index = s_stagger_enemy_down;
		if(img_index == 2)
			spr_index = s_stagger_enemy_right;
		if(img_index == 6)
			spr_index = s_stagger_enemy_left;
		if((img_index == 3) || (img_index == 4) || (img_index == 5))
			spr_index = s_stagger_enemy_up;
	}else if(isIdle && !isDying && (!playerInRange && !isAttacking)) {
		// Animations for idle standing
		if(img_index == 0)
			spr_index = s_idle_sword_down;
		else if(img_index == 1)
			spr_index = s_idle_sword_down_right;
		else if(img_index == 2)
			spr_index = s_idle_sword_right;
		else if(img_index == 3)
			spr_index = s_idle_sword_up_right;
		else if(img_index == 4)
			spr_index = s_idle_sword_up;
		else if(img_index == 5)
			spr_index = s_idle_sword_up_left;
		else if(img_index == 6)
			spr_index = s_idle_sword_left;
		else if(img_index == 7)
			spr_index = s_idle_sword_down_left;
		
		//stagger (stun)
		
		if(isStunned){
			if( (img_index == 0) || (img_index ==  1) || (img_index == 7))
				spr_index = s_stagger_enemy_down;
			if(img_index == 2)
				spr_index = s_stagger_enemy_right;
			if(img_index == 6)
				spr_index = s_stagger_enemy_left;
			if((img_index == 3) || (img_index == 4) || (img_index == 5))
				spr_index = s_stagger_enemy_up;
		}
	} else if(isIdle && !isDying &&playerInRange &&!playerFlee || (isIdle &&!playerFlee && !isDying && isAttacking)) {
		// Animations for attacking
		if(heavyAttack){
			if(img_index == 0)
				spr_index = s_heavy_sword_down;
			else if(img_index == 1)
				spr_index = s_heavy_sword_down_right;
			else if(img_index == 2)
				spr_index = s_heavy_sword_right;
			else if(img_index == 3)
				spr_index = s_heavy_sword_up_right;
			else if(img_index == 4)
				spr_index = s_heavy_sword_up;
			else if(img_index == 5)
				spr_index = s_heavy_sword_up_left;
			else if(img_index == 6)
				spr_index = s_heavy_sword_left;
			else if(img_index == 7)
				spr_index = s_heavy_sword_down_left;
		}
		else{
			if(img_index == 0)
				spr_index = s_attack_sword_down;
			else if(img_index == 1)
				spr_index = s_attack_sword_down_right;
			else if(img_index == 2)
				spr_index = s_attack_sword_right;
			else if(img_index == 3)
				spr_index = s_attack_sword_up_right;
			else if(img_index == 4)
				spr_index = s_attack_sword_up;
			else if(img_index == 5)
				spr_index = s_attack_sword_up_left;
			else if(img_index == 6)
				spr_index = s_attack_sword_left;
			else if(img_index == 7)
				spr_index = s_attack_sword_down_left;
		}
	} else if(isWalking) {
		// Animations for walking
		if(img_index == 0)
			spr_index = s_enemy_sword_walk_down;
		else if(img_index == 1)
			spr_index = s_enemy_sword_walk_down_right;
		else if(img_index == 2)
			spr_index = s_enemy_sword_walk_right;
		else if(img_index == 3)
			spr_index = s_enemy_sword_walk_up_right;
		else if(img_index == 4)
			spr_index = s_enemy_sword_walk_up;
		else if(img_index == 5)
			spr_index = s_enemy_sword_walk_up_left;
		else if(img_index == 6)
			spr_index = s_enemy_sword_walk_left;
		else if(img_index == 7)
			spr_index = s_enemy_sword_walk_down_left;
	} else if(isRunning) {
		// Animations for running
		if(img_index == 0)
			spr_index = s_run_sword_down;
		else if(img_index == 1)
			spr_index = s_run_sword_down_right;
		else if(img_index == 2)
			spr_index = s_run_sword_right;
		else if(img_index == 3)
			spr_index = s_run_sword_up_right;
		else if(img_index == 4)
			spr_index = s_run_sword_up;
		else if(img_index == 5)
			spr_index = s_run_sword_up_left;
		else if(img_index == 6)
			spr_index = s_run_sword_left;
		else if(img_index == 7)
			spr_index = s_run_sword_down_left;
	} else if(isDying) {
		// Animations for dying
		if(img_index == 0)
			spr_index = s_death_sword_down;
		else if(img_index == 1)
			spr_index = s_death_sword_down_right;
		else if(img_index == 2)
			spr_index = s_death_sword_right;
		else if(img_index == 3)
			spr_index = s_death_sword_up_right;
		else if(img_index == 4)
			spr_index = s_death_sword_up;
		else if(img_index == 5)
			spr_index = s_death_sword_up_left;
		else if(img_index == 6)
			spr_index = s_death_sword_left;
		else if(img_index == 7)
			spr_index = s_death_sword_down_left;
	}


	// Drawing player
	var scale = .65;
	var angle = -camera_get_view_angle(view_camera[0]);

	draw_sprite_ext(spr_index,img_frame,x,y,scale,scale,angle,image_blend, global.alpha);

	// Drawing chop dust
	if(!canHit) {
		var xx = x+lengthdir_x(12,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(12,-camera_get_view_angle(view_camera[0])+90);

		var angle1 = random_range(0, 180);
		var angle2 = random_range(0, 180);
		var angle3 = random_range(0, 360);
		draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle-angle1, image_blend, global.alpha);
		draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle-angle2, image_blend, global.alpha);
		draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle+angle3, image_blend, global.alpha);
	}

	/*
	if(damageTick) {
		
		if(damageTickStatus = 1){
			var xx = x+lengthdir_x(12,-camera_get_view_angle(view_camera[0])+90);
			var yy = y+lengthdir_y(12,-camera_get_view_angle(view_camera[0])+90);

			var angle1 = random_range(0, 180);
			var angle2 = random_range(0, 180);
			var angle3 = random_range(0, 360);
			draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle-angle1, image_blend, 1);
			draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle-angle2, image_blend, 1);
			draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle+angle3, image_blend, 1);
		}
		if(damageTickStatus = 2){
			var flame = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
		    var flame = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
			var flame = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
			flame.z = 14;	
		}
		damageTick = false;
	}*/

}