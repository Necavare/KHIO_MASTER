/*if(!isOnFire) {
	movement += value;
	draw_self_3d_wind(1, z, movement);
} else */
if(health_ > 0)
	draw_self_3d_wind(1, z);

/*var angle = -camera_get_view_angle(view_camera[0])+90;
movement += value;

if(room == r_title) {
	//draw_self_3d(1);
	// Drawing Grass
	for (var i = 0; i < image_number; i++) {
		var xx = x + lengthdir_x(i,angle);
		var yy = y + lengthdir_y(i,angle);
	
		if(!isOnFire) {
			
	
			// Grass wind
			xx += lengthdir_x(sine/(1.5+i*.05),image_angle);
			yy += lengthdir_y(sine/(1.5+i*.05),image_angle);
		}
	
		draw_sprite_ext(sprite_index, i, xx,yy, image_xscale, image_yscale, image_angle, image_blend, global.alpha);
	}
}

if(!global.generatingEnvironment) {

	// Drawing tree dust
	if(hitCount >= 0) {
		var xx = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);
	
		draw_sprite_ext(s_tree_dust, hitCount+6,xx,yy, .6, .6, image_angle, image_blend, image_alpha);
	}

if(health_ <= 0) {
		isGame = false;
	
		for (var i = 0; i < image_number; i+=.6) {
			if(i > 12) {
				var xx = x+lengthdir_x(i-z,-camera_get_view_angle(view_camera[0])+90);
				var yy = y+lengthdir_y(i-z,-camera_get_view_angle(view_camera[0])+90);
			}
			else {
				var xx = x+lengthdir_x(i,-camera_get_view_angle(view_camera[0])+90);
				var yy = y+lengthdir_y(i,-camera_get_view_angle(view_camera[0])+90);
			}
		
			if(i-z > 12)
				draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
			
			if(i < 12)
				draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
		}
} else {
	// Drawing Grass
	for (var i = 0; i < image_number; i++) {
		var xx = x + lengthdir_x(i,angle);
		var yy = y + lengthdir_y(i,angle);
	
		if(!isOnFire) {
			var sine = sin(movement+(i/5));
	
			// Grass wind
			xx += lengthdir_x(sine/(1.5+i*.05),image_angle);
			yy += lengthdir_y(sine/(1.5+i*.05),image_angle);
		}
	
		draw_sprite_ext(sprite_index, i, xx,yy, image_xscale, image_yscale, image_angle, image_blend, global.alpha);
	}
}
}*/