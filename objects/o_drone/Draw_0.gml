// Adjusting wind movement values
if(!global.generatingEnvironment || room == r_title){
	var angle = -camera_get_view_angle(view_camera[0])+90;
	
	// Drawing Grass
	for (var i = 0; i < image_number; i+=.9) {
		var xx = x + lengthdir_x(i+z*.6,angle);
		var yy = y + lengthdir_y(i+z*.6,angle);
	
		draw_sprite_ext(sprite_index, i, xx,yy, .9, .9, image_angle, image_blend, global.alpha);
	}

}