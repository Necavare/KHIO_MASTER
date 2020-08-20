if(startZ != 14) {
	z = 14;
	startZ = 14;
}
	
// Fire effect for torch
if(global.itemEquipped == item.torch) {
	var fire = instance_create_depth(x+irandom_range(-1,1)+lengthdir_x(9.5, -global.camera_angle+swingAngle+90),y+irandom_range(-1,1)+lengthdir_y(9.5, -global.camera_angle+swingAngle+90),depth-1, o_effect_fire);
	fire.z = z;
	fire.createAsh = false;
} 

// Fire effect for torch
if(global.itemEquipped == item.flare) {
	var fire = instance_create_depth(x+irandom_range(-1,1)+lengthdir_x(9.5, -global.camera_angle+swingAngle+90),y+irandom_range(-1,1)+lengthdir_y(9.5, -global.camera_angle+swingAngle+90),depth-1, o_effect_flare);
	fire.z = z;
	fire.angle = image_angle;
}

if(side) {
	if(sprite_index != s_tool)
		draw_self_3d(z);
	else {
		var xx = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(sprite_index, image_index,xx,yy, -1, image_yscale, image_angle, image_blend, image_alpha);
	}
} else {
	if(sprite_index != s_tool)
		draw_self_3d(z);
	else {
		var xx = x+lengthdir_x(z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(z,-camera_get_view_angle(view_camera[0])+90);
		draw_sprite_ext(sprite_index, image_index,xx,yy, 1, image_yscale, image_angle, image_blend, image_alpha);
	}
}

if(aiming) {
	for(var h = 0; h < 1; h++){
		//drawing the lazer wheen aiming
		var xx1 = x+lengthdir_x(0,-camera_get_view_angle(view_camera[0])+90);//h+barrellength
		var yy1 = y+lengthdir_y(0,-camera_get_view_angle(view_camera[0])+90);//h+barrellength
		//xx1+= lengthdir_x(2, -camera_get_view_angle(view_camera[0]));
		//yy1+= lengthdir_y(2, -camera_get_view_angle(view_camera[0]));
		// Drawing sprite
		if(range == 0)
			draw_sprite_ext(s_tool_aim_long, aimImage, xx1, yy1, -.6, .6, -global.camera_angle-90, image_blend, image_alpha);
		else if(range == 1)
			draw_sprite_ext(s_tool_aim_medium, aimImage, xx1, yy1, -.6, .6, -global.camera_angle-90, image_blend, image_alpha);
		else if(range == 2)
			draw_sprite_ext(s_tool_aim_close, aimImage, xx1, yy1, -.6, .6, -global.camera_angle-90, image_blend, image_alpha);
	}
}