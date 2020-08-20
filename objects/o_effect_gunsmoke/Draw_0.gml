z+=.5;

for (var i = 0; i < 2; i++)
{
	var xx = x+lengthdir_x(16+i,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(16+i,-camera_get_view_angle(view_camera[0])+90);
	xx +=lengthdir_x(z+i,global.wepAngle+90);
	yy +=lengthdir_y(z+i,global.wepAngle+90);
	draw_sprite_ext(sprite_index, fire_color,xx,yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}