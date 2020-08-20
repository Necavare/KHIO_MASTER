///@description draw_self_3d_wind(z)
///@param z
function draw_self_3d_wind() {
	var z = argument[1];
	if(!global.generatingEnvironment || room == r_title) {
	
		var wind = global.wind;
		var angle = -global.camera_angle+90;
		var alpha = global.alpha;
	
		var sprite = sprite_index;
		var img_angle = image_angle;

		// Actually drawing
		for (var i = 0; i < image_number; i++) {
			var xx = x+lengthdir_x(z+i,angle);
			var yy = y+lengthdir_y(z+i,angle);
			if(i > 2) {
				var sine = sin(wind+(i/5));
				xx += lengthdir_x(sine/(1.5+i*.05),img_angle);
				yy += lengthdir_y(sine/(1.5+i*.05),img_angle);
			}
		
			draw_sprite_ext(sprite, i,xx,yy, 1, 1, img_angle, image_blend, alpha);
		}

	}


}
