// Drawing roof if player not colliding
if(!global.generatingEnvironment){
	if(drawRoof)
	for (var i = 0; i < 18; i++) {
		var xx = x+lengthdir_x(i+38,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+38,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	}
}