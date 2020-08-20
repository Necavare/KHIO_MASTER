if(!global.generatingEnvironment){
	depth = -9999;

	for (var i = 0; i < image_number; i++) {
		var xx = x+lengthdir_x(buildZ+z+i,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(buildZ+z+i,-camera_get_view_angle(view_camera[0])+90);
		if(buildZ+i+z >= 0)
			draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	}

	//log[0] = -1;
	//log[1] = -1;
	//log[2] = -1;
	//log[3] = -1;
}