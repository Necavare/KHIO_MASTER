if(!global.generatingEnvironment){
	draw_self_3d(0);

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

	//damage tick
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
		else if(damageTickStatus = 2){
			var flame = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
		    var flame = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
			var flame = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
			flame.z = 14;	
		}
		damageTick = false;
	}
}