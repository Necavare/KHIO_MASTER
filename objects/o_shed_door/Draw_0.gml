// Drawing seperate door parts
if(!global.generatingEnvironment){
	for (var i = 0; i < image_number; i++) {
		var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(s_shed_door, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	}
}