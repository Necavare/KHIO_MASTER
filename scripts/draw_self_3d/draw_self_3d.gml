///@description draw_self_3d(z)
///@param z
function draw_self_3d() {
	var z = argument[0];
	if(!global.generatingEnvironment || room == r_title) {
		var angle = -global.camera_angle+90;
		var alpha = global.alpha;
	
		var sprite = sprite_index;
		var img_angle = image_angle;
	
		// Actually drawing
		for (var i = 0; i < image_number; i++) {
			var xx = x+lengthdir_x(z+i,angle);
			var yy = y+lengthdir_y(z+i,angle);
			if(i+z >= 0 || z < 0)
				draw_sprite_ext(sprite, i,xx,yy, image_xscale, image_yscale, img_angle, image_blend, alpha);
		}
	}


}
