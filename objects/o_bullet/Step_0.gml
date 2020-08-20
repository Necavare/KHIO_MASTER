if(x = bulletfirex && y = bulletfirey){
	instance_destroy(self);	
}


if(place_meeting(x,y,o_enemySword)) {
	audio_emitter_position(bullet, x, y, 0);
	switch(irandom(1)) {
		case 0: audio_play_sound_on(bullet, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(bullet, sn_bullet_hit_2, 0, 1); break;
	}
	var enemyS = instance_place(x,y, o_enemySword);
	enemyS.enemy_health-=bulletdamage;
	o_camera.shake = 2;
	enemyS.bcontact = true;
	enemyS.canHit = false;
	enemyS.alarm[3] = 20;
	enemyS.chopFrame = 0;
	instance_destroy(self);
}
if(place_meeting(x,y,o_enemyBow)){
	audio_emitter_position(bullet, x, y, 0);
	switch(irandom(1)) {
		case 0: audio_play_sound_on(bullet, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(bullet, sn_bullet_hit_2, 0, 1); break;
	}
	var enemyB = instance_place(x,y, o_enemyBow);
	enemyB.enemy_health-=bulletdamage;
	o_camera.shake = 2;
	enemyB.bcontact = true;
	enemyB.canHit = false;
	enemyB.alarm[3] = 20;
	enemyB.chopFrame = 0;
	instance_destroy(self);
}


if(place_meeting(x,y,o_squirrel)){
	audio_emitter_position(bullet, x, y, 0);
	switch(irandom(1)) {
		case 0: audio_play_sound_on(bullet, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(bullet, sn_bullet_hit_2, 0, 1); break;
	}
	
		var squirrel = instance_place(x,y,o_squirrel);
		squirrel.squirrel_health = bulletdamage;
		squirrel.deathAngle = image_angle;
		o_camera.shake = 2;
		squirrel.bcontact = true;
		squirrel.canHit = false;
		squirrel.alarm[3] = 20;
		instance_destroy(self);
}

if(place_meeting(x,y,o_rabbit)){
	audio_emitter_position(bullet, x, y, 0);
	switch(irandom(1)) {
		case 0: audio_play_sound_on(bullet, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(bullet, sn_bullet_hit_2, 0, 1); break;
	}
	
	var rabbit = instance_place(x,y,o_rabbit);
	rabbit.rabbit_health-=bulletdamage;
	rabbit.deathAngle = image_angle;
	o_camera.shake = 2;
	rabbit.bcontact = true;
	rabbit.canHit = false;
	rabbit.alarm[3] = 20;
	instance_destroy(self);
}

// Colliding with objects
if(place_meeting(x,y,o_birch) || place_meeting(x,y,o_pole_broken) || place_meeting(x,y,o_pole_wired)) {
	instance_destroy(self);
	repeat(4) {
		var chip = instance_create_depth(x, y, depth, o_particles);
		chip.birch = true;
	}
}

if(place_meeting(x,y,o_spruce) || place_meeting(x,y,o_shed_floor)) {
	instance_destroy(self);
	repeat(4) {
		var chip = instance_create_depth(x, y, depth, o_particles);
	}
}

if(place_meeting(x,y,o_house))
	instance_destroy(self);

if(place_meeting(x,y,o_car) || place_meeting(x,y,o_bigrock) || place_meeting(x,y,o_compound_wall) || place_meeting(x,y,o_compound_corner)
|| place_meeting(x,y,o_wall) || place_meeting(x,y,o_tall_wall) || place_meeting(x,y,o_wall_corner)) {
	instance_destroy(self);
	repeat(4) {
		var chip = instance_create_depth(x, y, depth, o_particles);
		chip.spark = true;
	}
}