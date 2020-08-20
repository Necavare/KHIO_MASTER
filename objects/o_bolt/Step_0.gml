if(doOnce){
	//choose image and damage
	if(boltType == 0){//wooden normal
		image_index = choose(0,1);
		bulletdamage = 1;
	}else if(boltType == 1){//wooden poison
		image_index = choose(10,11);
		bulletdamage = 1;
	}else if(boltType == 2){//flame bolt
		image_index = choose(8,9);
		bulletdamage = 1;
	}else if(boltType == 3){//bone normal
		image_index = choose(2,3);
		bulletdamage = 2;
	}else if(boltType == 4){//bone poison
		image_index = choose(10, 11);
		bulletdamage = 2;
	}else if(boltType == 5){//flint normal
		image_index = choose(4,5);
		bulletdamage = 3;
	}else if(boltType == 6){//flint poison
		image_index = choose(10, 11);
		bulletdamage = 3;
	}else if(boltType == 7){//metal normal
		image_index = choose(6,7);
		bulletdamage = 5;
	}else if(boltType == 8){//metal poison
		image_index = choose(10, 11);
		bulletdamage = 5;
	}
	
	doOnce = false;
}

if(x = bulletfirex && y = bulletfirey){
	instance_destroy(self);	
}
	
if(place_meeting(x,y,o_enemySword)){
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
	enemyS.damageTick = true; //set tick to true
	if(boltType == 1 || boltType == 4 || boltType == 6 || boltType == 8)
		enemyS.damageTickStatus = 1;
	else if(boltType == 2)
		enemyS.damageTickStatus = 2;
	else
		enemyS.damageTickStatus = 3;
	//enemyS.damageTickStatus = boltType;


	//if(boltType == 1 || boltType == 2 || boltType == 4 || boltType == 6 || boltType == 8)
	//	enemyS.alarm[11] = 60;// set initial alarm
	enemyS.alarm[11] = 60;
	
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
	enemyB.damageTick = true; //set tick to true
	if(boltType == 1 || boltType == 4 || boltType == 6 || boltType == 8)
		enemyB.damageTickStatus = 1;
	else if(boltType == 2)
		enemyB.damageTickStatus = 2;
	else
		enemyB.damageTickStatus = 3;
	//enemyS.damageTickStatus = boltType;


	//if(boltType == 1 || boltType == 2 || boltType == 4 || boltType == 6 || boltType == 8)
	//	enemyS.alarm[11] = 60;// set initial alarm
	enemyS.alarm[11] = 60;
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
		squirrel.damageTick = true; //set tick to true
		squirrel.damageTickStatus = boltType;
		if(boltType!=0)
			squirrel.alarm[11] = 25;// set initial alarm
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
	rabbit.damageTick = true; //set tick to true
	rabbit.damageTickStatus = boltType;
	if(boltType!=0)
		rabbit.alarm[11] = 25;// set initial alarm
	instance_destroy(self);
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