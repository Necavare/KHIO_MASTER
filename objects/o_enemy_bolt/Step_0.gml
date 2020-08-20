
if(x = bulletfirex && y = bulletfirey){
	instance_destroy(self);	
}
//change image to correct type
if(boltType == 0)//normal
	bulletdamage = 15;
else if(boltType == 1)//poison
	bulletdamage = 5;
else if(boltType == 2)//fire
	bulletdamage = 5;

if(place_meeting(x,y,o_player) && !o_player.isRolling){
	audio_emitter_position(bullet, x, y, 0);
	switch(irandom(1)) {
		case 0: audio_play_sound_on(bullet, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(bullet, sn_bullet_hit_2, 0, 1); break;
	}
	//audio_play_sound(sn_goodhit,0,0);
	//audio_play_sound(sn_goodhit,0,0);
	//audio_play_sound(sn_goodhit,0,0);
	o_player.isBleeding = true;
	var injureChance = irandom(99);
	if(injureChance  < 1)
		o_player.isInjured = true;
	o_player.health_-=bulletdamage*o_player.armor;
	show_debug_message("damageBolt:" +string(bulletdamage*o_player.armor));
	instance_destroy(self);
	
	repeat(8) {
		var blood = instance_create_depth(x, y, depth, o_particles);
			blood.spurt = true;
			var angle = -global.camera_angle-90;
			blood.dir_ = irandom_range(angle-30, angle+30);
	}
}

// Colliding with objects
if(place_meeting(x,y,o_birch) || place_meeting(x,y,o_pole_broken) || place_meeting(x,y,o_pole_wired))
	instance_destroy(self);

if(place_meeting(x,y,o_spruce) || place_meeting(x,y,o_shed_floor))
	instance_destroy(self);

if(place_meeting(x,y,o_house))
	instance_destroy(self);

if(place_meeting(x,y,o_car) || place_meeting(x,y,o_bigrock) || place_meeting(x,y,o_compound_wall) || place_meeting(x,y,o_compound_corner)
|| place_meeting(x,y,o_wall) || place_meeting(x,y,o_tall_wall) || place_meeting(x,y,o_wall_corner))
	instance_destroy(self);