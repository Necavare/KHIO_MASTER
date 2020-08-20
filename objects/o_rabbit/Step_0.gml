if(!global.generatingEnvironment){
	if(!isDead) {

		// Standing still
		if(!isJumping && !isDead) {
			// Chance of looking down
			if(irandom_range(0,120) == 0 && isLooking) {
				isLooking = false;
				alarm[0] = 60*2;
			}

			// Changing sprite if looking
			if(!isLooking)
				sprite_index = s_rabbit_down;
			else
				sprite_index = s_rabbit;
		
			frame = 0;
		} else { // Running
			// Setting running sprite
			if(frame == 0)
				sprite_index = s_rabbit_jump_1;
			else if(frame == 1)
				sprite_index = s_rabbit_jump_2;
			else if(frame == 2)
				sprite_index = s_rabbit_jump_3;
			else if(frame == 3)
				sprite_index = s_rabbit_jump_3;
	
			// Actually moving
			if(frame == 2 || frame == 3) {
				x = x + lengthdir_x(1.5, image_angle + 90);
				y = y + lengthdir_y(1.5, image_angle + 90);
			}
		}

		// Randomly start running
		if(irandom_range(0, 300) == 0 && !isDead) {
			isJumping = true;
			image_angle = irandom_range(0, 360);
		}
	
		// Randomly getting attracted to trap
		var trap = instance_nearest(x,y,o_trap);
		if(instance_exists(trap) && !neverAttracted && !isAttracted && irandom_range(0, 5) != 0 && !collision_circle(o_player.x, o_player.y, 75, self, true, false)) {
			if(collision_circle(trap.x, trap.y, 55, self, true, false) && trap.isSet) {
				isJumping = true;
				isAttracted = true;
				image_angle = point_direction(trap.x, trap.y, x, y)+90;
			}
		}
	
		// Eating from trap
		if(isAttracted && position_meeting(x,y,trap) && !isTrapped) {
			isJumping = false;
			isLooking = false;
			depth = trap.depth+1;
		}
	
		// Actually trapping
		if(isAttracted && position_meeting(x,y,trap)) {
			var trap = instance_place(x,y,o_trap);
		
			isLooking = false;
			depth = trap.depth+1;
		
			var chanceToKill = irandom_range(0,500);
		
			if(chanceToKill < 50) {
				isDead = true;
				isTrapped = true;
			} else { // Setting trap off and running away
				isFleeing = true;
				alarm[5] = 60 * irandom_range(45,60);
				isAttracted = false;
				neverAttracted = true;
				trap.isSet = false;
			}
		
			if(!trap.isSet) {
				isFleeing = true;
				alarm[5] = 60 * irandom_range(45,60);
				isAttracted = false;
				neverAttracted = true;
			}
		}

		// Running from setoff traps 
		if(instance_exists(o_trap)) {
			var trap = instance_nearest(x,y,o_trap);	 
			if(instance_exists(trap) && collision_circle(trap.x, trap.y, 55, self, true, false) && !trap.isSet) {
				isFleeing = true;
				alarm[5] = 60 * irandom_range(45,60);
				isAttracted = false;
				neverAttracted = true;
			}
		}
	
		// Fleeing from player and gunshots
		if(collision_circle(o_player.x, o_player.y, 75, self, true, false) && !isFleeing || (instance_exists(o_weapon) && !o_weapon.canshoot && collision_circle(o_player.x, o_player.y, 300, self, true, false))) {
			isFleeing = true;
			neverAttracted = true;
			alarm[5] = 60 * irandom_range(45,60);
			image_angle = -point_direction(o_player.x, o_player.y, x, y)+90;
			
			if(instance_exists(o_weapon) && !o_weapon.canshoot) {
				audio_emitter_position(rabbit, x, y, 0);
				switch(irandom_range(0,1)) {
					case 0: audio_play_sound_on(rabbit, sn_animal_flee_1, 0, 1); break;
					case 1: audio_play_sound_on(rabbit, sn_animal_flee_2, 0, 1); break;
				}
			}
		}
	
		// Fleeing
		if(isFleeing) {
			isJumping = true;
			isAttracted = false;
		
			var bush = instance_nearest(x,y,o_bush);
	
			if(collision_circle(x, y, 75, bush, true, false) && !bush.isRabbit)
				image_angle = point_direction(bush.x, bush.y, x, y)+90;
			else if(collision_circle(o_player.x, o_player.y, 75, self, true, false))
				image_angle = -point_direction(x, y, o_player.x, o_player.y);
			else if(irandom_range(0,50) == 0)
				image_angle = irandom_range(-point_direction(o_player.x, o_player.y, x, y)+90-90, -point_direction(o_player.x, o_player.y, x, y)+90+90);
		}
	
		// Getting hit by tool
		
		if(place_meeting(x,y,o_tool) && o_tool.isSwung && canHit) {
			if(global.itemEquipped == item.torch || global.itemEquipped == item.flare){ //set damage tick for fire
				alarm[11] = 25;
				damageTick = true;
				damageTickStatus = 2;
			}
			rabbit_health-=o_tool.finalDamage;
			o_camera.shake = 2;
			
			switch(irandom(1)) {
				case 0: audio_play_sound_on(rabbit, sn_bullet_hit_1, 0, 1); break;
				case 1: audio_play_sound_on(rabbit, sn_bullet_hit_2, 0, 1); break;
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
		
		var thrown = instance_nearest(x,y, o_tool_thrown);
		if(place_meeting(x,y,thrown) && thrown.z > 0 && canHit) {
			if(thrown.isLit && (thrown.item_ == item.torch || thrown.item_ == item.flare)){ //set damage tick for fire
				alarm[11] = 25;
				damageTick = true;
				damageTickStatus = 2;
			}
			rabbit_health-=thrown.damage*5;
			o_camera.shake = 2;
	
			switch(irandom(1)) {
				case 0: audio_play_sound_on(rabbit, sn_bullet_hit_1, 0, 1); break;
				case 1: audio_play_sound_on(rabbit, sn_bullet_hit_2, 0, 1); break;
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
		
	} else if(isDead && isTrapped)
		sprite_index = s_rabbit_dead;
		
	//bullet contact
	if((place_meeting(x,y,o_bullet)||place_meeting(x,y,o_buckshot)) && !bcontact  && !isDead) {
		var bulletC = instance_place(x,y, o_bullet); //set it to colliding instance
		if(bulletC == noone)
			bulletC = instance_place(x,y, o_buckshot);
		
		rabbit_health-=bulletC.bulletdamage;
		deathAngle = bulletC.image_angle;
		o_camera.shake = 2;
		bcontact = true;
		canHit = false;
		alarm[3] = 20;
		chopFrame = 0;
		instance_destroy(bulletC);
	
		audio_emitter_position(rabbit, x, y, 0);
		audio_play_sound_on(rabbit, sn_animal_death, 0, 1);
	}
	else{
		bcontact = false;
	}

	// Setting raabbit to killed
	if(rabbit_health <= 0){
		if(!isDead) {
			isDead = true;
			sprite_index = s_rabbit_dead;
			image_angle = deathAngle;
			damageTick = false;
			alarm[11] = 0;
		}
	
		if(deathMove) {
			x+=lengthdir_x(1,image_angle);
			y+=lengthdir_y(1,image_angle);
		
			if(alarm[4] == -1)
				alarm[4] = 10;
		}
	}

	if(chopFrame < 3)
		chopFrame+=.25;
	else
		chopFrame = 0;
}

var nade = instance_nearest(x,y,o_grenade);
if(instance_exists(nade) && collision_circle(nade.x,nade.y,35,self, true, false) && !nade.isExploded) {
	rabbit_health = 0;
	deathAngle = -point_direction(x,y,nade.x,nade.y);
}

if(isDead) {
	// Destroys the instance
	if(health_ <= 0)
		instance_destroy(self);
		
	if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && health_ > 0)
		take_hit(self, 3);
		
	if(isTrapped)
		sprite_index = s_rabbit_trapped;
}