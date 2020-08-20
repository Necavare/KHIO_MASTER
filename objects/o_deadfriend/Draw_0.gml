var scale = .6;
var angle = -camera_get_view_angle(view_camera[0]);

draw_sprite_ext(sprite_index,5,x,y,scale,scale,angle,image_blend,global.alpha);