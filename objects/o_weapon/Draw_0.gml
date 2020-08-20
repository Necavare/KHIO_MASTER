aimingAngle = -90;
//gun length from pivot to end : 16
/*if(target && weaponMode != 1){
	for(var h = 0; h < 1; h++){
		//drawing the lazer wheen aiming
		var xx1 = x+lengthdir_x(h+z,-camera_get_view_angle(view_camera[0])+90);//h+barrellength
		var yy1 = y+lengthdir_y(h+z,-camera_get_view_angle(view_camera[0])+90);//h+barrellength
		xx1+= lengthdir_x(2, -camera_get_view_angle(view_camera[0]));
		yy1+= lengthdir_y(2, -camera_get_view_angle(view_camera[0]));
		// Drawing sprite
		//draw_sprite_ext(s_rifleLazer, image_index, xx1, yy1, -.8, .8, image_angle+aimingAngle, image_blend, image_alpha);
	}
}*/
if(!o_player.isRolling) {
if(sprite_index == s_rifle)
	for (var i = 0; i < image_number; i+=.6) {
		// Drawing the rifle
		var xx = x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90);
		xx+= lengthdir_x(4, -camera_get_view_angle(view_camera[0]));
		yy+= lengthdir_y(4, -camera_get_view_angle(view_camera[0]));
		// Drawing sprite
		draw_sprite_ext(sprite_index, i, xx, yy, -.8, .8, image_angle+aimingAngle, image_blend, image_alpha);
	}
else if(sprite_index == s_shotgun_pump) {
	for (var i = 0; i < image_number; i+=.6) {
		// Drawing the rifle
		var xx = x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90);
		xx+= lengthdir_x(4, -camera_get_view_angle(view_camera[0]));
		yy+= lengthdir_y(4, -camera_get_view_angle(view_camera[0]));
		// Drawing sprite
		draw_sprite_ext(sprite_index, i, xx, yy, -.6, .6, image_angle+aimingAngle, image_blend, image_alpha);
	}
}
else if(sprite_index == s_crossbow || sprite_index == s_crossbow_shot) {
	for (var i = 0; i < image_number; i+=1) {
		// Drawing the rifle
		var xx = x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90);
		var yy = y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90);
		xx+= lengthdir_x(3, -camera_get_view_angle(view_camera[0]));
		yy+= lengthdir_y(3, -camera_get_view_angle(view_camera[0]));
		if(o_player.isRunning){//correction for running
			xx-= lengthdir_x(2, -camera_get_view_angle(view_camera[0]));
			yy-= lengthdir_y(2, -camera_get_view_angle(view_camera[0]));
		}
		// Drawing sprite
		draw_sprite_ext(sprite_index, i, xx, yy, -.8, .8, image_angle+aimingAngle, image_blend, image_alpha);
		
		if(i == 3 && ammo > 0) {
			if(o_player.isRunning) {
				var bx = (x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90))+lengthdir_x(.5, image_angle+aimingAngle+90);
				var by = (y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90))+lengthdir_y(.5, image_angle+aimingAngle+90);
			} else {
				var bx = (x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90))+lengthdir_x(2.5, image_angle+aimingAngle+90);
				var by = (y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90))+lengthdir_y(2.5, image_angle+aimingAngle+90);
			}
			
			draw_sprite_ext(s_bolt, 0, bx, by, -.8, .8, image_angle+aimingAngle, image_blend, image_alpha);
			
			if(boltLoad == 2) {
				if(o_player.isRunning) {
					var fxx = (x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90))+lengthdir_x(.5, image_angle);
					var fy = (y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90))+lengthdir_y(.5, image_angle);
				} else {
					var fxx = (x+lengthdir_x(i+z,-camera_get_view_angle(view_camera[0])+90))-lengthdir_x(10, image_angle+90);
					var fy = (y+lengthdir_y(i+z,-camera_get_view_angle(view_camera[0])+90))-lengthdir_y(10, image_angle+90);
				}
				
				var fire = instance_create_depth(fxx+irandom_range(-1,1),fy+irandom_range(-1,1),depth-1, o_effect_flare);
				fire.z = i+z;
				fire.angle = image_angle;
			}
		}
		
	}
}

if(options && ((mouse_check_button(global.M_LEFT)) || keyboard_check_released( ord("R")))) {
	options = false;
	// 0 = normal, 1 = poison, 2= fire, 3=bone normal, 4=bone poison, 5=flint normal, 6= flint poison,
	// 7 = metal normal, 8 = metal poison
	/*
	if(highlightLoad = -1){
		if(wBoltP)
			boltLoad = 0;
		else if(bBoltP)
			boltLoad = 3;
		else if(flBoltP)
			boltLoad = 5;
		else if(mBoltP)
			boltLoad = 7;
		else if(wPoisBoltP)
			boltLoad = 1;
		else if(bPoisBoltP)
			boltLoad = 4;
		else if(flPoisBoltP)
			boltLoad = 6;
		else if(mPoisBoltP)
			boltLoad = 8;
		else if(fBoltP)
			boltLoad = 2;
	}
	else*/
		boltLoad = highlightLoad;
	/*
	//choose how many options their will be
	var optionNum = 2;
	if(boltP && fboltP && pboltP)
		optionNum = 3;
	
	var xx = optionsX;
	var yy = optionsY;
	if(optionNum = 2){
		// First option
		//decide wether first option is bolt or poison bolt
		
		if(device_mouse_x_to_gui(0) < xx - 10){
			if(boltP)
				boltLoad = 0;
			else
				boltLoad = 1;
		}
		
		// Second option	
		if(device_mouse_x_to_gui(0) > xx + 10){
			if(boltP){
				if(pboltP)
					boltLoad = 1;
				else
					boltLoad = 2;
			}
			boltLoad = 2;
		}
	}
	else if(optionNum == 3){
		// First option
		//decide wether first option is bolt or poison bolt
		if(device_mouse_x_to_gui(0) < xx - 69)
			boltLoad = 0;
			
		//if(device_mouse_x_to_gui(0) < xx - 64)
		//	window_mouse_set(xx - 64, yy);
		if((device_mouse_x_to_gui(0) > xx - 64) && (device_mouse_x_to_gui(0) < xx+59))
			boltLoad = 1;
		
		// Second option

		if(device_mouse_x_to_gui(0) > xx + 56)
			boltLoad = 2;
	}*/
	
	
	isloading = true;
		
}
}