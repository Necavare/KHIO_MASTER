if(!global.generatingEnvironment){

	// Setting animation for current player mode
	if(isIdle) {
		spr_index = s_idle_oldman_down;
		// Animations for idle standing
		/*if(img_index == 0)
			
		else if(img_index == 1)
			spr_index = s_oldman_front_right;
		else if(img_index == 2)
			spr_index = s_oldman_right;
		else if(img_index == 3)
			spr_index = s_oldman_back_right;
		else if(img_index == 4)
			spr_index = s_oldman_back;
		else if(img_index == 5)
			spr_index = s_oldman_back_left;
		else if(img_index == 6)
			spr_index = s_oldman_left;
		else if(img_index == 7)
			spr_index = s_oldman_front_left;*/
	} //removed all other animation types

	// Setting animation for current player mode
	if(isIdle) {
		// Animations for idle standing
		if(img_index == 0)
			spr_index = s_idle_oldman_down;
		else if(img_index == 1)
			spr_index = s_idle_oldman_down_right;
		else if(img_index == 2)
			spr_index = s_idle_oldman_right;
		else if(img_index == 3)
			spr_index = s_idle_oldman_up_right;
		else if(img_index == 4)
			spr_index = s_idle_oldman_up;
		else if(img_index == 5)
			spr_index = s_idle_oldman_up_left;
		else if(img_index == 6)
			spr_index = s_idle_oldman_left;
		else if(img_index == 7)
			spr_index = s_idle_oldman_down_left;
	}  else if(isWalking) {
		// Animations for walking
		if(img_index == 0)
			spr_index = s_walk_oldman_down;
		else if(img_index == 1)
			spr_index = s_walk_oldman_down_right;
		else if(img_index == 2)
			spr_index = s_walk_oldman_right;
		else if(img_index == 3)
			spr_index = s_walk_oldman_up_right;
		else if(img_index == 4)
			spr_index = s_walk_oldman_up;
		else if(img_index == 5)
			spr_index = s_walk_oldman_up_left;
		else if(img_index == 6)
			spr_index = s_walk_oldman_left;
		else if(img_index == 7)
			spr_index = s_walk_oldman_down_left;
	} 

	// Drawing player
	var scale = .65;
	var angle = -camera_get_view_angle(view_camera[0]);

	draw_sprite_ext(spr_index,img_frame,x,y,scale,scale,angle,image_blend,image_alpha);

	// Drawing chop dust
	if(!canHit) {
		var xx = x+lengthdir_x(12,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(12,-camera_get_view_angle(view_camera[0])+90);

		var angle1 = random_range(0, 180);
		var angle2 = random_range(0, 180);
		var angle3 = random_range(0, 360);
		draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle-angle1, image_blend, 1);
		draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle-angle2, image_blend, 1);
		draw_sprite_ext(s_blood, chopFrame, xx, yy, .7, .7, -global.camera_angle+angle3, image_blend, 1);
	}

}