audio_emitter_position(bird, x, y, 0);

if(!isDead && isFlying) {
	
	if(frame == 0)
		sprite_index = s_bat_fly_1;
	else if(frame == 1)
		sprite_index = s_bat_fly_2;
	else if(frame == 2)
		sprite_index = s_bat_fly_3;
	else if(frame == 3) 
		sprite_index = s_bat_fly_4;
	else if(frame == 4) 
		sprite_index = s_bat_fly_3;
	else if(frame == 5)
		sprite_index = s_bat_fly_2;
		
	var speed_ = choose(1.5, 1.75, 2)
	
	if(isAttacking) {
		x = x + lengthdir_x(1, image_angle + 90);
		y = y + lengthdir_y(1, image_angle + 90);
		
		image_angle=point_direction(x, y, o_player.x, o_player.y)-90;
	} else if(isFleeing) {
		x = x + lengthdir_x(speed_, image_angle + 90);
		y = y + lengthdir_y(speed_, image_angle + 90);
		
		image_angle=point_direction(x, y, o_player.x, o_player.y)+90;
		
		if(irandom_range(0,50) == 0)
			isFleeing = false;
	} else {
		x = x + lengthdir_x(speed_, image_angle + 90);
		y = y + lengthdir_y(speed_, image_angle + 90);
		
		if(dir)
			image_angle+=choose(1, 1.5, 2, 2.5);
		else
			image_angle-=choose(1, 1.5, 2, 2.5);
	}
	
	if(irandom_range(0,500) == 0) {
		switch(irandom_range(0,2)) {
			case 0: audio_play_sound_on(bird, sn_bat_chirp_1, 0, 1); break;
			case 1: audio_play_sound_on(bird, sn_bat_chirp_2, 0, 1); break;
			case 2: audio_play_sound_on(bird, sn_bat_chirp_3, 0, 1); break;
		}
	}
	
	if(collision_circle(x,y, 750, o_player, false, true) && irandom_range(0,500) == 0 && !isFleeing) {
		audio_play_sound_on(bird, sn_bat_attack, 0, 1);
		isAttacking = true;
	}
	
	if(place_meeting(x,y,o_player) && isAttacking && z <= 15) {
		isFleeing = true;
		isAttacking = false;
		
		o_player.isBatHit = true;
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
	sprite_index = s_bat_dead;
	image_angle = deathAngle;
	
	if(deathMove) {
		x+=lengthdir_x(1,image_angle);
		y+=lengthdir_y(1,image_angle);
		
		if(alarm[4] == -1)
			alarm[4] = 10;
	}
}

var nade = instance_nearest(x,y,o_grenade);
if(instance_exists(nade) && collision_circle(nade.x,nade.y,35,self, true, false) && !nade.isExploded && z <= 25) {
	bird_health = 0;
	deathAngle = -point_direction(x,y,nade.x,nade.y);
}

var thrown = instance_nearest(x,y, o_tool_thrown);
if(collision_circle(x,y, 10, o_tool_thrown, true, true) && thrown.z > 0 && canHit && z <= 25) {
	bird_health-=thrown.damage*3;
	o_camera.shake = 2;
	
	switch(irandom(1)) {
		case 0: audio_play_sound_on(bird, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(bird, sn_bullet_hit_2, 0, 1); break;
	}
	
	repeat(3) {
		var blood = instance_create_depth(x, y, depth, o_particles);
			blood.spurt = true;
			var angle = -global.camera_angle+90;
			blood.dir_ = irandom_range(angle-30, angle+30);
		}
	
	canHit = false;
	alarm[3] = 20;
	chopFrame = 0;
	
	// Setting new target
	var ang = irandom_range(0, 360);
	targetX = x + lengthdir_x(8, ang);
	targetY = y + lengthdir_y(8, ang);
}

if(place_meeting(x,y,o_tool) && o_tool.isSwung && canHit && !isDead) {
	bird_health-=o_tool.finalDamage;
	o_camera.shake = 2;
			
	switch(irandom(1)) {
		case 0: audio_play_sound_on(bird, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(bird, sn_bullet_hit_2, 0, 1); break;
	}
	
	repeat(3) {
		var blood = instance_create_depth(x, y, depth, o_particles);
		blood.spurt = true;
		var angle = -global.camera_angle+90;
		blood.dir_ = irandom_range(angle-30, angle+30);
	}
			
	canHit = false;
	alarm[3] = 20;
	chopFrame = 0;
} 

if(isDead) {
	if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && health_ > 0 && canHit)
		take_hit(self, 3);
}

if(health_ <= 0) {
	instance_destroy(self);
	instance_create_depth(x,y,depth,o_blood_spot);
	
	var meat = instance_create_depth(x,y,depth, o_item);
		meat.item_ = item.meat;
		meat.direction = irandom_range(0,360);
		meat.bounce = true;
		meat.item_count = irandom_range(1,2);
		meat.durability = 11;
			
	// Create bone item
	var bone = instance_create_depth(x,y,depth, o_item);
		bone.item_ = item.bones;
		bone.direction = irandom_range(0,360);
		bone.bounce = true;
		bone.item_count = irandom_range(1,2);
}