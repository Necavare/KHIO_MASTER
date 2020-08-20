if(isOnFire) {
	if(!audio_is_playing(sn_fire)) {
		audio_emitter_position(fireEmitter, x, y, 0);
		audio_play_sound_on(fireEmitter, sn_fire, 1, 1);
	}
	
	if(z == 12) { // Birch/Spruce trees
		if(birchFlame)
			repeat(fireAmount) {
				var width = sprite_width/3;
				var height = sprite_height/3;
				var fireZ = irandom_range(0,81);
				var flame = instance_create_depth(x+irandom_range(-width,width),y+irandom_range(-height,height),depth-1, o_effect_fire);
				flame.z = fireZ;
			}
		else 
			repeat(fireAmount) {
				var fireZ = z+irandom_range(0,58);
				var fireins = instance_create_depth(x+irandom_range(-fireZ/4,fireZ/4),y+irandom_range(-fireZ/4,fireZ/4),depth-1, o_effect_fire);
				fireins.z = -fireZ+85;
			}
	} else {
		var width = sprite_width/2;
		var height = sprite_height/2;
		repeat(fireAmount) {
			var ranW = irandom_range(-width,width);
			var ranH = irandom_range(-height,height);
			if(isDoor)
				ranW += 11;
			var fire = instance_create_depth(x+lengthdir_x(ranH, image_angle+90)+lengthdir_x(ranW, image_angle),y+lengthdir_y(ranH, image_angle+90)+lengthdir_y(ranW, image_angle),depth-1, o_effect_fire);
			if(!createAsh)
				fire.createAsh = false;
		}
	}
			
	fireAmount+=.01;
	health_-=.01;
}