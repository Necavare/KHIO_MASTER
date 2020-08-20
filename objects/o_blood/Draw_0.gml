if(z != 0)
for (var i = 0; i < image_number; i+=.6) {
	var xx = x+lengthdir_x(z+i,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(z+i,-camera_get_view_angle(view_camera[0])+90);
	draw_sprite_ext(sprite_index, i,xx,yy, .6, .6, image_angle, image_blend, imageAlpha_);
}

if(z == 0) {
	var xx = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);
	draw_sprite_ext(sprite_index, image_index,xx,yy, .6, .6, image_angle, image_blend, imageAlpha_);
}