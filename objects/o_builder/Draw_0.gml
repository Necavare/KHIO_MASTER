for (var i = 0; i < image_number; i++) {
	var sx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
	var sy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
	
	if(object == 10 && i < 3) {
		// Drawing building sprite
		if(object == 0)
			if(!spaceFree)
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_green, .1);
			else
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_red, .1);
			
		if(object > 0)
			if(!spaceFree)
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_red, .1);
			else
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_green, .1);
			
		if(object == 2) {
			var dx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90)+lengthdir_x(-11, image_angle);
			var dy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90)+lengthdir_y(-11, image_angle);
			if(!spaceFree)
				draw_sprite_ext(s_door, i, dx, dy, image_xscale, image_yscale, image_angle, c_red, .1);
			else
				draw_sprite_ext(s_door, i, dx, dy, image_xscale, image_yscale, image_angle, c_green, .1);
		}
	} else if(object != 10) {
		// Drawing building sprite
		if(object == 0)
			if(!spaceFree)
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_green, .1);
			else
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_red, .1);
			
		if(object > 0)
			if(!spaceFree)
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_red, .1);
			else
				draw_sprite_ext(sprite_index, i, sx, sy, image_xscale, image_yscale, image_angle, c_green, .1);
			
		if(object == 2) {
			var dx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90)+lengthdir_x(-11, image_angle);
			var dy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90)+lengthdir_y(-11, image_angle);
			if(!spaceFree)
				draw_sprite_ext(s_door, i, dx, dy, image_xscale, image_yscale, image_angle, c_red, .1);
			else
				draw_sprite_ext(s_door, i, dx, dy, image_xscale, image_yscale, image_angle, c_green, .1);
		}
	}
} 