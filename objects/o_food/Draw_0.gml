var xx = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
var yy = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);
draw_sprite_ext(sprite_index, image_index,xx,yy, 1, 1, image_angle, image_blend, image_alpha);