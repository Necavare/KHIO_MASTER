//change image to correct type
if(boltType == 0)//normal
	image_index = 0;
else if(boltType == 1)//poison
	image_index = 2;
else if(boltType == 2)//fire
	image_index = 8;
	
var xx = x+lengthdir_x(16,-camera_get_view_angle(view_camera[0])+90);
var yy = y+lengthdir_y(16,-camera_get_view_angle(view_camera[0])+90);
draw_sprite_ext(sprite_index, image_index,xx,yy,1, image_yscale, image_angle, image_blend, image_alpha);

if(boltType == 2) {
	var fire = instance_create_depth(xx+irandom_range(-1,1)+lengthdir_x(10, image_angle),yy+irandom_range(-1,1)+lengthdir_y(10, image_angle),depth-1, o_effect_flare);
	fire.z = 16;
	fire.angle = image_angle;
}