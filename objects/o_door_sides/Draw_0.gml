// Drawing door sides for building
if(!global.generatingEnvironment){
	for (var i = 0; i < image_number; i++) {
		var xx = x+lengthdir_x(i+buildZ,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+buildZ,-camera_get_view_angle(view_camera[0])+90);
		if(i+buildZ >= 0) {
			if(!isBuilt)
				draw_sprite_ext(s_door_sides, i,xx,yy, 1, 1, image_angle, $333128, .1);
			else
				draw_sprite_ext(s_door_sides, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
		}
	}
}