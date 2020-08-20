draw_self_3d(0);

if(!canHit && chopFrame != -1) {
	//var xx = x+lengthdir_x(10,-camera_get_view_angle(view_camera[0])+90);
	//var yy = y+lengthdir_y(10,-camera_get_view_angle(view_camera[0])+90);

	//draw_sprite_ext(s_stone_chop, chopFrame, xx, yy, 1, 1, -global.camera_angle, image_blend, 1);
	//draw_sprite_ext(s_stone_chop, chopFrame, xx, yy, 1, 1, -global.camera_angle+30, image_blend, 1);
	
	light = instance_create_depth(x,y,depth, o_light);
	light.image_xscale = .5;
	light.image_yscale = .5;
	alarm[2] = 1;
}