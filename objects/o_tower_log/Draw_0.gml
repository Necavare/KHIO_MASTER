if(!global.generatingEnvironment){
	// Drawing door sides for building
	for (var i = 0; i < image_number; i++) {
		var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
		if(!isBuilt)
			draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, $333128, .1);
		else
			draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	}
}