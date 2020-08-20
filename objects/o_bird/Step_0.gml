// Standing still/running
if(!isDead && !isHop && !isFlying) {
	if(irandom_range(0,100) == 0 && isLooking) {
		isLooking = false;
		alarm[0] = 30*1;
	}

	if(!isLooking)
		sprite_index = s_bird_down;
	else
		sprite_index = s_bird;
		
	frame = 0;
	
	// Randomly hopping
	if(irandom_range(0, 500) == 0) {
		alarm[1] = 5;
		isHop = true;
		image_angle = irandom_range(0, 360);
		audio_emitter_position(bird, x, y, 0);
		switch(irandom_range(0,2)) {
			case 0: audio_play_sound_on(bird, sn_bird_chirp_1, 0, 1); break;
			case 1: audio_play_sound_on(bird, sn_bird_chirp_2, 0, 1); break;
			case 2: audio_play_sound_on(bird, sn_bird_chirp_3, 0, 1); break;
		}
		
	}
	// Randomly flying away
	if(irandom_range(0, 2000) == 0) {
		isFlying = true;
		image_angle = irandom_range(0, 360);
		
		audio_emitter_position(bird, x, y, 0);
		switch(irandom_range(0,1)) {
			case 0: audio_play_sound_on(bird, sn_animal_flee_1, 0, 1); break;
			case 1: audio_play_sound_on(bird, sn_animal_flee_2, 0, 1); break;
		}
	}
}
else if(!isDead && isHop) {
	
	z = 1;
	
	x = x + lengthdir_x(2, image_angle + 90);
	y = y + lengthdir_y(2, image_angle + 90);
}
else if(!isDead && isFlying) {
	
	if(frame == 0)
		sprite_index = s_bird_fly_1;
	else if(frame == 1)
		sprite_index = s_bird_fly_2;
	else if(frame == 2)
		sprite_index = s_bird_fly_3;
	else if(frame == 3) 
		sprite_index = s_bird_fly_4;
	else if(frame == 4) 
		sprite_index = s_bird_fly_3;
	else if(frame == 5)
		sprite_index = s_bird_fly_2;
		
	x = x + lengthdir_x(2, image_angle + 90);
	y = y + lengthdir_y(2, image_angle + 90);
		
	if(!collision_circle(o_player.x, o_player.y, 200, self, true, false))
		instance_destroy(self);
}

// Need to add collision for player and other animals.
if(collision_circle(o_player.x, o_player.y, 50, self, true, false) || (instance_exists(o_weapon) && !o_weapon.canshoot))
	if(!isFlying) {
		frame = 0;
		isFlying = true;
		
		audio_emitter_position(bird, x, y, 0);
		switch(irandom_range(0,1)) {
			case 0: audio_play_sound_on(bird, sn_animal_flee_1, 0, 1); break;
			case 1: audio_play_sound_on(bird, sn_animal_flee_2, 0, 1); break;
		}
	}
	
//bullet contact
if((place_meeting(x,y,o_bullet)||place_meeting(x,y,o_buckshot)||place_meeting(x,y,o_bolt)) && !bcontact  && !isDead) {
	var bulletC = -1; //set it to colliding instance
	
	if(place_meeting(x,y,o_bullet))
		bulletC = instance_place(x,y, o_bullet)
		
	if(place_meeting(x,y,o_buckshot))
		bulletC = instance_place(x,y, o_buckshot);
		
	if(place_meeting(x,y,o_bolt))
		bulletC = instance_place(x,y, o_bolt);
		
	bird_health-=5;
	deathAngle = bulletC.image_angle;
	o_camera.shake = 2;
	bcontact = true;
	canHit = false;
	alarm[3] = 20;
	chopFrame = 0;
	instance_destroy(bulletC);
	
	audio_emitter_position(bird, x, y, 0);
	audio_play_sound_on(bird, sn_animal_death, 0, 1);
}
else{
	bcontact = false;
}

if(bird_health <= 0){
	isDead = true;
	sprite_index = s_bird_dead;
	image_angle = deathAngle;
	
	if(deathMove) {
		x+=lengthdir_x(1,image_angle);
		y+=lengthdir_y(1,image_angle);
		
		if(alarm[4] == -1)
			alarm[4] = 10;
	}
}

var nade = instance_nearest(x,y,o_grenade);
if(instance_exists(nade) && collision_circle(nade.x,nade.y,35,self, true, false) && !nade.isExploded) {
	bird_health = 0;
	deathAngle = -point_direction(x,y,nade.x,nade.y);
}

if(isDead) {
	if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && health_ > 0)
		take_hit(self, 3);
}

if(health_ <= 0) {
	instance_destroy(self);
	instance_create_depth(x,y,depth,o_blood_spot);
	
	var meat = instance_create_depth(x,y,depth, o_item);
		meat.image_index = item.meat;
		meat.direction = irandom_range(0,360);
		meat.bounce = true;
		meat.item_count = irandom_range(1,2);
		meat.durability = 11;
			
	// Create bone item
	var bone = instance_create_depth(x,y,depth, o_item);
		bone.image_index = item.bones;
		bone.direction = irandom_range(0,360);
		bone.bounce = true;
		bone.item_count = irandom_range(1,2);
}