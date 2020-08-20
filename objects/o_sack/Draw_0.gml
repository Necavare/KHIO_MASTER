var angle = -global.camera_angle+90;
var oX = x;
var oY = y;
	// Actually drawing
for (var i = 0; i < image_number; i+=.8) {
	var xx = oX+lengthdir_x(z+i,angle);
	var yy = oY+lengthdir_y(z+i,angle);

	draw_sprite_ext(sprite_index, i,xx,yy, .8, .8, image_angle, image_blend, 1);
}