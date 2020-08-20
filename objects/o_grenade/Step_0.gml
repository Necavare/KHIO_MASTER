if(!global.generatingEnvironment && !global.isPaused && o_weather.isSnowing && alarm[4] == -1 && isExploded)
	alarm[4] = room_speed * 5;

if(z > 0)
	z-=3;
	
if(z <= 0) {
	z = 0;
	explode = true;
}
	
if(explode && !isExploded) {
	o_camera.shake = 4;
	audio_emitter_position(grenade, x, y, 0);
	audio_play_sound_on(grenade, sn_grenade, 0, 1);
	sprite_index = s_grenade_explode;
	isExploded = true;
	repeat(20) {
		var chip = instance_create_depth(x, y, depth, o_particles);
		chip.grenade = true;
	}
	repeat(30) {
		instance_create_depth(x+irandom_range(-16,16), y+irandom_range(-16,16), depth, o_effect_fire);	
	}
	z = -14;
	
	if(collision_circle(x,y,45,o_player, true, true)) {
		o_player.isHit = true;
			
		o_player.objectHitting = self;
		o_player.health_-=25*o_player.armor;
	}
}

depth = 8999;
