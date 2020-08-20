z+=.2;

for (var i = 0; i < 2; i++)
{
	var xx = x+lengthdir_x(z+i,-camera_get_view_angle(view_camera[0])+90);
	var yy = y+lengthdir_y(z+i,-camera_get_view_angle(view_camera[0])+90);
	draw_sprite_ext(sprite_index, fire_color,xx,yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}