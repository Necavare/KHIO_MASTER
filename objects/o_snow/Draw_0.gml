var angle = -global.camera_angle+90;

var xx = x+lengthdir_x(z,angle);
var yy = y+lengthdir_y(z,angle);
draw_sprite_ext(sprite_index, 0,xx,yy, 1, 1, image_angle, image_blend, image_alpha);