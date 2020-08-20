z+=.2;
//var angle = -camera_get_view_angle(view_camera[0])+90;
//for (var i = 0; i < 1; i++) {
	//var xx = x+lengthdir_x(z, angle);
	//var yy = y+lengthdir_y(z, angle);
	//draw_sprite_ext(sprite_index, fire_color,xx,yy, image_xscale, image_yscale, image_angle, image_blend, global.alpha);
//}

var angle = -global.camera_angle+90;

var xx = x+lengthdir_x(z,angle);
var yy = y+lengthdir_y(z,angle);
draw_sprite_ext(sprite_index, fire_color,xx,yy, 1, 1, image_angle, image_blend, global.alpha);