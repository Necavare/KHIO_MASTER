if(!global.generatingEnvironment){
//move out of anything its stuck in

var fixDir = irandom(360);

/*
if(!place_meeting(x,y,o_buckshot)&&!place_meeting(x,y,o_bullet)&&!place_meeting(x,y,o_bolt)&&!place_free(x,y))
{
	if(unstuckTimer > 0)
		unstuckTimer--;
	else{
		while(!place_meeting(x,y,o_buckshot)&&!place_meeting(x,y,o_bullet)&&!place_meeting(x,y,o_bolt)&&!place_free(x,y)){
			if(positiveFellow){
				x += lengthdir_x(0.5, fixDir);
				y += lengthdir_y(0.5, fixDir);
			}
			else if(!positiveFellow){
				x -= lengthdir_x(0.5, fixDir);
				y -= lengthdir_y(0.5, fixDir);
			}
		}
	}
}
else
	unstuckTimer = 120;
*/

#region Movement


	// Changing acceleration for ice
	if(place_meeting(x,y,o_pond) || place_meeting(x,y,o_lake))
		acceleration = .8;
	else
		acceleration = 1;

	if(collision_circle(x,y, 50, o_player, true, true)){
		move_dir = 0;
		isRunning = false;
		isWalking = false;
		isIdle = true;
		xdir = 0;
		ydir = 0;
		
		if(global.journalGate == 0) 
			global.journalGate = 1;
	}
	// Move the player towards coordinates base on image frame and check for collisions.
	else if((isWalking && (img_frame != 6 || img_frame != 2)) || (isRunning && (img_frame != 5 || img_frame != 2))){
		//mp_potential_step(x+lengthdir_x(move_dis, move_dir), y+lengthdir_y(move_dis, move_dir), p_speed, false);
		var placeX =x+lengthdir_x(1, move_dir);
		var placeY =y+lengthdir_y(1,move_dir);
		if(!place_free(placeX, placeY) && !place_meeting(placeX, placeY, o_player)){
			move_dir+=180;
			if(move_dir < 0)
				move_dir = 360+move_dir;
			if(move_dir > 360)
				move_dir = move_dir-360;
			startedMoving = true;
		}
		move(acceleration, move_dir, .35, move_dis);	
	}
	
	// Switching modes
	
	// Idle, walking, running
	if(xdir == 0 && ydir == 0) {
		isRunning = false;
		isWalking = false;
		isIdle = true;
	} 
	
	// Checking all current modes
	if(isIdle && (isWalking || isRunning))
		isIdle = false;
	
#endregion

#region Image Indexing
//keeping move_dir in 360 range
//var true_dir = move_dir-global.camera_angle;
// Setting direction reference to the global.dir.

true_dir = move_dir+global.camera_angle;
if(true_dir>360)
	true_dir = true_dir-360;
else if(true_dir < 0)
	true_dir = 360+true_dir;
if((!isIdle && startedMoving)||playerInRange){
	if(true_dir > 337.5 || true_dir < 22.5)
		img_index = 2;
	else if(true_dir > 22.5 && true_dir < 67.5)
		img_index = 3;
	else if(true_dir > 67.5 && true_dir < 112.5)
		img_index = 4;
	else if(true_dir > 112.5 && true_dir < 157.5)
		img_index = 5;
	else if(true_dir > 157.5 && true_dir < 202.5)
		img_index = 6;
	else if(true_dir > 202.5 && true_dir < 247.5)
		img_index = 7;
	else if(true_dir > 247.5 && true_dir < 292.5)
		img_index = 0;
	else if(true_dir > 292.5 && true_dir < 337.5)
		img_index = 1;
	startedMoving = false;
}

	// Changing the player index when camera is rotated left.
	if(global.dir > dir_ref)
		img_index++;	

	// Changing the player index when camera is rotated right.
	if(global.dir < dir_ref)
		img_index--;	

	// Exceptions for the camera rotation.
	if(global.dir == 7 && dir_ref == 0)
		img_index = img_index - 2;
		
	if(global.dir == 0 && dir_ref == 7)
		img_index = img_index + 2;
		
	if(img_index >= 8)
		img_index = 0;
		
	if(img_index < 0)
		img_index = 7;

	if(global.dir != dir_ref)
		dir_ref = global.dir;
// Setting player angle based on movement direction


#endregion

#region Creating Footprints



if(!isIdle) {
	// Creating footprint objects
	if(img_index == 0) {
		if(isRunning) {	
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(-3,-global.camera_angle),y + lengthdir_y(-3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 5) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle),y + lengthdir_y(3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(-3,-global.camera_angle),y + lengthdir_y(-3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle),y + lengthdir_y(3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		}
	} else if(img_index == 1) {
		if(isRunning) {
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 5) {
					var footprint = instance_create_depth(x + lengthdir_x(-2,-global.camera_angle),y + lengthdir_y(-2,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle+125),y + lengthdir_y(4,-global.camera_angle+125),9001,o_footprint);
					footprint.objectIndex = self;
				}
				
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle),y + lengthdir_y(4,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle-90),y + lengthdir_y(2,-global.camera_angle-90),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		}
	} else if(img_index == 2) {
		if(isRunning) {
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+90),y + lengthdir_y(3,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 5) {
					var footprint = instance_create_depth(x,y,9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(1,-global.camera_angle+90),y + lengthdir_y(1,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle-90),y + lengthdir_y(2,-global.camera_angle-90),9001,o_footprint);
					footprint.objectIndex = self;
				}
				
				newFootprint = false;
			}
		}
	} else if(img_index == 3) {
		if(isRunning) {
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 5) {
					var footprint = instance_create_depth(x + lengthdir_x(6,-global.camera_angle+75),y + lengthdir_y(6,-global.camera_angle+75),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle+75),y + lengthdir_y(4,-global.camera_angle+75),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+90),y + lengthdir_y(3,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle),y + lengthdir_y(3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		}
	} else if(img_index == 4) {
		if(isRunning) {
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 5) {
					var footprint = instance_create_depth(x + lengthdir_x(-4,-global.camera_angle),y + lengthdir_y(-4,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle),y + lengthdir_y(3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(-3,-global.camera_angle),y + lengthdir_y(-3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle),y + lengthdir_y(2,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
					
				}
					
				newFootprint = false;
			}
		}
	} else if(img_index == 5) {
		if(isRunning) {
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 5) {
					var footprint = instance_create_depth(x + lengthdir_x(6,-global.camera_angle-75),y + lengthdir_y(6,-global.camera_angle-75),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle-75),y + lengthdir_y(4,-global.camera_angle-75),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+45),y + lengthdir_y(3,-global.camera_angle+45),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(-3,-global.camera_angle),y + lengthdir_y(-3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		}
	} else if(img_index == 6) {
		if(isRunning) {
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+90),y + lengthdir_y(3,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 5) {
					var footprint = instance_create_depth(x,y,9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(1,-global.camera_angle-90),y + lengthdir_y(1,-global.camera_angle-90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle+90),y + lengthdir_y(2,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		}
	} else if(img_index == 7) {
		if(isRunning) {
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 5) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle),y + lengthdir_y(2,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle-125),y + lengthdir_y(4,-global.camera_angle-125),9001,o_footprint);
					footprint.objectIndex = self;
				}
			
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 2) {
					var footprint = instance_create_depth(x + lengthdir_x(-4,-global.camera_angle),y + lengthdir_y(-4,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 6) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle-90),y + lengthdir_y(2,-global.camera_angle-90),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		}
	}
}


#endregion


//====================================================================================================
//							HIT DETECTION AND DEATH
//====================================================================================================
// Destroying enemy
/*
if(enemy_health <= 0 && !isDying) {
	isIdle = true;
	isRunning = false;
	isWalking = false;
	isDying = true;
	alarm[4] = 25;
}

if(o_player.isHoldingTool && place_meeting(x,y,o_tool) && o_tool.isSwung && canHit) {
	p_speed = 25;
	acceleration = 3;


	move(acceleration, point_direction(x,y,o_player.x, o_player.y)+180, p_speed, 5);
	
	if(global.itemEquipped == item.torch){ //set damage tick for fire
		alarm[11] = 25;
		damageTick = true;
		damageTickStatus = 2;
	}
	
	else{
		alarm[11] = 60;
		damageTick = true;
		damageTickStatus = 3; //bleed
	}
	
	o_tool.isHitting = true;
	enemy_health-=o_tool.finalDamage;
	o_camera.shake = 2;
	
	var ranS = irandom_range(0, 2);
	//if(ranS == 0) audio_play_sound(sn_chop,0,0);
	//else if(ranS == 1) audio_play_sound(sn_chop1,0,0);
	//else if(ranS == 2) audio_play_sound(sn_chop2,0,0);
	canHit = false;
	alarm[3] = 20;
	chopFrame = 0;
	
}

if(chopFrame < 3)
	chopFrame+=.25;
else
	chopFrame = 0;
	
if(damageTick && damageTickStatus == 2){//fire
	var flame1 = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
	flame1.z = 14;
}
	*/
#region attacking
/*

if((img_frame == 3) && playerInRange && !hasSwung){
	var hurtBox = instance_create_depth(x,y,1, o_enemyHurtBox);
	hurtBox.userX = x;
	hurtBox.userY = y;
	hurtBox.img_index = img_index;
	hurtBox.image_angle = -global.camera_angle; //maybe not necessary
	if(heavyAttackChance)
		hurtBox.damageType = 1;
	hasSwung = true;
	heavyAttackChance = choose(false, true);
}*/
#endregion

}