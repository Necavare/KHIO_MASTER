if(playerNear || enemy_health < healthMax)
	for (var i = 0; i < enemy_health; i++) {
		var offX = 10;
		var offY = -3.5;
		var xx = x+lengthdir_x(i*2, -global.camera_angle+90)+lengthdir_x(offX, angle)+lengthdir_x(offY, angle-90);
		var yy = y+lengthdir_y(i*2, -global.camera_angle+90)+lengthdir_y(offX, angle)+lengthdir_y(offY, angle-90);
				
		draw_sprite_ext(s_stats, 2,xx,yy, -image_xscale/1.5, image_yscale/1.5, angle, image_blend, image_alpha);
	}