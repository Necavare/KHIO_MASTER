/*
if(target) {
	// Drawing the item floating
	var xx = targetX+lengthdir_x(16,-camera_get_view_angle(view_camera[0])+90);
	var yy = targetY+lengthdir_y(16,-camera_get_view_angle(view_camera[0])+90);

	draw_sprite_ext(s_target, 0, xx, yy, .5, .5, targetAngle, image_blend, 1);
}*/

if(target) {
	// Drawing the item floating
	var xx = targetX+lengthdir_x(16,-camera_get_view_angle(view_camera[0])+90);
	var yy = targetY+lengthdir_y(16,-camera_get_view_angle(view_camera[0])+90);

	draw_sprite_ext(s_target, 0, xx, yy, .5, .5, targetAngle, image_blend, 1);
} else if(global.isAiming) {
	// Drawing the item floating
	var xx = x+lengthdir_x(-86, image_angle-10);
	var yy = y+lengthdir_y(-86, image_angle-10);
	draw_sprite_ext(s_target, 0, xx, yy, .25, .25, targetAngle, image_blend, 1);
}
