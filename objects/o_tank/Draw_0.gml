if(!global.generatingEnvironment || room == r_title){
	var angle = -global.camera_angle+90;
	var oX = x;
	var oY = y;
		// Actually drawing
	for (var i = 0; i < image_number; i+=.3) {
		var xx = oX+lengthdir_x(0+i,angle);
		var yy = oY+lengthdir_y(0+i,angle);

		draw_sprite_ext(sprite_index, i,xx,yy, 1, 1, image_angle, image_blend, 1);
	}
}