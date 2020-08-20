// Drawing roof if player not colliding
if(!global.generatingEnvironment){
	if(drawRoof)
	for (var i = 0; i < 9; i++) {
		var xx = x+lengthdir_x(i+27,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+27,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(s_shed_roof, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	}
}