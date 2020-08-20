//draw_self_3d(.6,z);
for (var i = 0; i < 1; i+=.6) {
	var xx = x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90);

	draw_sprite_ext(sprite_index, image_index,xx,yy, image_xscale, .6, image_angle, image_blend, global.alpha);
}