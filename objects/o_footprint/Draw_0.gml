var angle = -global.camera_angle+90;
var oX = x;
var oY = y;
	// Actually drawing
for (var i = 0; i < image_number; i++) {
	var xx = oX+lengthdir_x(-2+i,angle);
	var yy = oY+lengthdir_y(-2+i,angle);

	draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, 1);
}

if(drawKick) {
	var xx = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);
	draw_sprite_ext(s_snowkick, kickIndex, xx,yy, .8, 1, image_angle, image_blend, 1);
	draw_sprite_ext(s_snowkick, kickIndex, o_player.x,o_player.y, .8, 1, image_angle+90, image_blend, 1);
	draw_sprite_ext(s_snowkick, kickIndex, o_player.x,o_player.y, .8, 1, image_angle-90, image_blend, 1);
}