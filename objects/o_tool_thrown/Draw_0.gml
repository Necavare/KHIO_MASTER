/*if(sprite_index != s_tool)
	draw_self_3d(z);
else {
	var xx = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);
	draw_sprite_ext(sprite_index, image_index,xx,yy, 1, image_yscale, image_angle, image_blend, image_alpha);
}*/

if(side) {
	if(sprite_index != s_tool)
		draw_self_3d(z);
	else {
		var xx = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(sprite_index, image_index,xx,yy, -1, image_yscale, image_angle, image_blend, global.alpha);
	}
} else {
	if(sprite_index != s_tool)
		draw_self_3d(z);
	else {
		var xx = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(sprite_index, image_index,xx,yy, 1, image_yscale, image_angle, image_blend, global.alpha);
	}
}