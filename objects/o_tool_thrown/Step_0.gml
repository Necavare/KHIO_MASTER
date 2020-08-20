// Creating fire effect for torch/flare
if(isLit) {
	// Need to add case for flares
	if(item_ == item.flare) {
		var fire = instance_create_depth(x+irandom_range(-1,1)+lengthdir_x(9, image_angle+90),y+irandom_range(-1,1)+lengthdir_y(9, image_angle+90),depth-1, o_effect_flare);
		fire.z = z;
		if(!audio_is_playing(sn_flare_burn)) {
			audio_emitter_position(emitter, x, y, 0);
			audio_play_sound_on(emitter, sn_flare_burn, 0, 1);
		}
	} else if(item_ == item.torch) {
		var fire = instance_create_depth(x+irandom_range(-1,1)+lengthdir_x(10, image_angle+90),y+irandom_range(-1,1)+lengthdir_y(10, image_angle+90),depth-1, o_effect_fire);
		fire.z = z;
		if(!audio_is_playing(sn_fire)) {
			audio_emitter_position(emitter, x, y, 0);
			audio_play_sound_on(emitter, sn_fire, 0, 1);
		}
	}
	
	everLit = true;
}

if(audio_is_playing(sn_fire) && !isLit) 
	audio_stop_sound(sn_fire);
	
if(audio_is_playing(sn_flare_burn) && !isLit) 
	audio_stop_sound(sn_flare_burn);

// Throwing
if(z < 0)
	z = 0;
	
if(z <= 0 && item_ == item.grenade) {
	instance_destroy(self);
	var nade = instance_create_depth(x,y,depth,o_grenade);
	nade.z = 5;
}

if(z > 0) {
	z-=2.5;
	
	switch(range) {
		case 0: image_angle+=100; break;
		case 1: image_angle+=80; break;
		case 2:image_angle+=60; break;
	}
} else {
	speed_ = -1;	
}

if(speed_ > 0) {
	x += lengthdir_x(speed_, angle);
	y += lengthdir_y(speed_, angle);
}


// Picking up
if(collision_circle(x,y,5,o_player,true,true) && z <= 1 && !o_player.isDead && !inventory_full(item_) && item_ != item.flare && item_ != item.torch) {
	if(isTutorial && global.isTutorial){
		//make it only certain amgles
		var polarity = choose(true, false);
		var ranAngVar = irandom_range(-20, 20);
		var ranAng = global.camera_angle;
		if(polarity)
			ranAng = ranAng+ranAngVar;
		else
			ranAng = ranAng+ranAngVar+180;
			
		var ranX = o_player.x + lengthdir_x(130, ranAng);
		var ranY = o_player.y + lengthdir_y(130, ranAng);
		
		
		var enemyStart = instance_create_depth(ranX,ranY, 1, o_enemySwordTutorial);
		//enemyStart.startingEnemy = true;
		enemyStart.playerDetected = true;
		//enemyStart.isBleeding = true;
	}
	
	instance_destroy(self);
	
	pickup_item(o_hud, item_, count, durability);
	
	item_notification(item_)
}

// Colliding with enemies
var enemySword = instance_nearest(x,y,o_enemySword);
if(instance_exists(enemySword) && position_meeting(x,y,enemySword)) {
	if(item_ == item.knife || item_ == item.poisonknife) {
		stuck = true;
		stuckX = enemySword.x;
		stuckY = enemySword.y;
		objectStuck = enemySword;
		z = 12;
		depth = enemySword.depth-1;
	} else {
		if(z > 4) {
			switch(range) {
				case 0: speed_ = 14/3; z = 14/3; break;
				case 1: speed_ = 11/3; z = 11/3; break;
				case 2: speed_ = 7/3; z = 7/3; break;
			}

			angle = -angle;
		}
	}
	enemySword.playerDetected = true;
}

var enemyBow = instance_nearest(x,y,o_enemyBow);
if(instance_exists(enemyBow) && position_meeting(x,y,enemyBow)) {
	if(item_ == item.knife || item_ == item.poisonknife) {
		stuck = true;
		stuckX = enemyBow.x;
		stuckY = enemyBow.y;
		objectStuck = enemyBow;
		z = 12;
		depth = enemyBow.depth-1;
	} else {
		if(z > 4) {
			switch(range) {
				case 0: speed_ = 14/3; z = 14/3; break;
				case 1: speed_ = 11/3; z = 11/3; break;
				case 2: speed_ = 7/3; z = 7/3; break;
			}

			angle = -angle;
		}
	}
	enemyBow.playerDetected = true;
}

if(stuck && instance_exists(objectStuck)) {
	x = stuckX;
	y = stuckY;
}

//depth = 9000;