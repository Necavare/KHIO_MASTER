for(var i = type; i < type + 2; i++) {
	var xx = x+lengthdir_x(i-type,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(i-type,-camera_get_view_angle(view_camera[0])+90);
	draw_sprite_ext(sprite_index, i,xx,yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}