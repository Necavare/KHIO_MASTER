if(spark) {
	image_xscale = 2;
	image_yscale = 2;
}

// Drawing the item floating
var xx = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
var yy = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);

// Drawing sprite
draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);