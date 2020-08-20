// Drawing the item floating
var xx = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
var yy = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);

var sx = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);
var sy = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);

if(!wait) {
	// Drawing shadow
	draw_sprite_ext(sprite_index, image_index, sx, sy, .75, .75, image_angle, c_black, .1);

	// Drawing sprite
	draw_sprite_ext(sprite_index, image_index, xx, yy, .75, .75, image_angle, image_blend, image_alpha);
}