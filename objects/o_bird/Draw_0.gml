for (var i = 0+z; i < image_number+z; i+=.6) {
	var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
	draw_sprite_ext(sprite_index, i,xx,yy, .6, .6, image_angle, image_blend, global.alpha);
}