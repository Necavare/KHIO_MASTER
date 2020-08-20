for(var i = 0; i < image_number; i++) {
	var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
		
	draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	
	if(i < 24 && upgraded)
		draw_sprite_ext(s_wall_metal, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
		
}