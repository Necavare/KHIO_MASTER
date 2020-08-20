if(image_alpha > 0) {
	var sprite = sprite_index;
	var imgNum = image_number;

	var xx = 0;
	var yy = 0;

	var angle = -global.camera_angle+90;

	// Actually drawing
	for (var i = 0; i < imgNum; i++) {
		xx = x+lengthdir_x(i,angle);
		yy = y+lengthdir_y(i,angle);
		draw_sprite_ext(sprite, i,xx,yy, 1, 1, image_angle, image_blend, image_alpha);
	}
}