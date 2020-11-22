// Automatically stopping bleeding/broken bones
if(isBleeding && check_inventory(item.bandage, 1, -1)) {
	isBleeding = false;
	if(health_ < 100)
		health_ += 5;
		
	inventory_remove(item.bandage, 1);
}

if(isInjured && check_inventory(item.splint, 1, -1)) {
	isInjured = false;
	
	inventory_remove(item.splint, 1);
}

if(health_ > 100)
	health_ = 100;

if(place_meeting(x,y,o_compound_wall)) {
	var wall = instance_nearest(x,y,o_compound_wall);
	if(!wall.keyCard) {
		healthKick = true;
		isBleeding = true;

		health_ -= 10*armor;

		move(3, point_direction(wall.x, wall.y, x,y), 10, 10);
	
		switch(irandom_range(0,1)) {
			case 0: audio_play_sound(sn_spike_1, 1, 0); break;
			case 1: audio_play_sound(sn_spike_2, 1, 0); break;
		}
	} 
	
	if(wall.buildZ > -wall.image_number)
		move(1, point_direction(wall.x, wall.y, x,y), 10, 10);

	global.compoundEntered = true;
}

// Music
if(audio_is_playing(sn_title) && room != r_title)
	audio_stop_sound(sn_title);
	
var camp = instance_nearest(x,y,o_wall_wood);
var enemy = instance_nearest(x,y,o_enemySword);
var enemyB = instance_nearest(x,y,o_enemyBow);
nearSword = false;
nearBow = false;

if(instance_exists(enemy)) {
	if(point_distance(x,y,enemy.x,enemy.y) < 200)
		nearSword = true;
	
	if(point_distance(x,y,enemy.x,enemy.y) < 50)
		campDynamic = true;
	else
		campDynamic = false;
} else if(instance_exists(enemyB)) {
	if(point_distance(x,y,enemyB.x,enemyB.y) < 200)
		nearBow = true;
		
	if(point_distance(x,y,enemyB.x,enemyB.y) < 50)
		campDynamic = true;
	else
		campDynamic = false;
} 

if(instance_exists(camp) && camp.isCamp) {
	if(point_distance(x,y,camp.x,camp.y) < 200)
		nearCamp = true;
	else
		nearCamp = false;
}	


if(nearCamp || nearSword || nearBow) {	
	if(audio_group_is_loaded(camp_music))
		audio_group_set_gain(camp_music, global.SN_MUSIC, 2500);
	if(audio_group_is_loaded(main_music))
		audio_group_set_gain(main_music, 0, 2500);
	if(!audio_is_playing(sn_camp_core))
		audio_play_sound(sn_camp_core, 1, 0);
		
	if(!audio_is_playing(sn_camp_dynamic))
		audio_play_sound(sn_camp_dynamic, 1, 0);
} 

if(!nearCamp && !nearSword && !nearBow) {
	if(audio_group_is_loaded(camp_music))
		audio_group_set_gain(camp_music, 0, 2500)
	if(audio_group_is_loaded(dynamic_music))
		audio_group_set_gain(dynamic_music, 0, 2500)
	if(audio_group_is_loaded(main_music))
		audio_group_set_gain(main_music, global.SN_MUSIC, 2500);
		
	if(audio_sound_get_gain(sn_camp_core) <= 0)
		audio_stop_sound(sn_camp_core);
		
	if(audio_sound_get_gain(sn_camp_dynamic) <= 0)
		audio_stop_sound(sn_camp_dynamic);
}

if(campDynamic) {	
	if(audio_group_is_loaded(dynamic_music))
		audio_group_set_gain(dynamic_music, global.SN_MUSIC, 2500);
}

if(!campDynamic) {	
	if(audio_group_is_loaded(dynamic_music))
		audio_group_set_gain(dynamic_music, 0, 2500);
}

if(!nearCamp && !nearSword && !nearBow && !audio_is_playing(sn_lonely) && room != r_title && !global.generatingEnvironment && irandom_range(0,200) == 0) {
	if(audio_group_is_loaded(camp_music))
		audio_group_set_gain(camp_music, 0, 2500)
	if(audio_group_is_loaded(dynamic_music))
		audio_group_set_gain(dynamic_music, 0, 2500)
	if(audio_group_is_loaded(main_music))
		audio_group_set_gain(main_music, global.SN_MUSIC, 2500);
	
	audio_play_sound(sn_lonely, 1, 0);
}

/*else if(instance_exists(enemy) && point_distance(x,y,enemy.x,enemy.y) < 50) {	
	if(audio_group_is_loaded(camp_music))
		audio_group_set_gain(camp_music, global.SN_MUSIC, 5000);
		
	if(audio_group_is_loaded(dynamic_music))
		audio_group_set_gain(dynamic_music, global.SN_MUSIC, 5000);
		
	if(audio_group_is_loaded(main_music))
		audio_group_set_gain(main_music, 0, 5000);
		
	if(!audio_is_playing(sn_camp_core))
		audio_play_sound(sn_camp_core, 1, 0);
		
	audio_play_sound(sn_camp_dynamic, 1, 0);
} 


if(audio_group_is_loaded(dynamic_music))
	audio_group_set_gain(dynamic_music, 0, 5000);
*/

//if(audio_sound_get_gain(sn_camp_core) <= 0)
	//audio_stop_sound(sn_camp_core);
//if(audio_sound_get_gain(sn_camp_dynamic) <= 0)
	//audio_stop_sound(sn_camp_dynamic);
//if(audio_sound_get_gain(sn_lonely) <= 0)
	//audio_stop_sound(sn_lonely);

// Audio listener
audio_listener_position(x,y,0);
audio_listener_orientation(0, 0, 1, dsin(global.camera_angle), -dcos(global.camera_angle), 0);

if(isHit && isHoldingBlock) {
	isHoldingBlock = false;
	if(instance_exists(o_tool))
		o_tool.isBlocking = false;
}

if(instance_exists(o_hud) && ((o_hud.lanternInst != -1 && o_hud.lanternInst.isLit) || (global.itemEquipped == item.torch && instance_exists(o_tool) && o_tool.isLit)))
	slightlyWarm = true;
else
	slightlyWarm = false;
	
// Checking for torch/flare on ground
var thrown = instance_nearest(x,y,o_tool_thrown);
if(instance_exists(thrown) && (thrown.item_ == item.torch || thrown.item_ == item.flare) && thrown.isLit && point_distance(x,y,thrown.x,thrown.y) < 70) 
	slightlyWarm = true;

//spawn birds
var birdOdds = irandom(1000);
if(global.hour > 8 && global.hour < 19)
	if((((isSleeping || isSitting) && birdOdds < 5)  ||  birdOdds < 1) && !global.generatingEnvironment && room == r_new){
		var birdAng = irandom(360);
		var birdLen = irandom_range(20,170);
		instance_create_depth(x+lengthdir_x(birdLen, birdAng), y+lengthdir_y(birdLen, birdAng), 1, o_bird);
	}

armor = 1;
if(global.headEquipped != -1){
	//54 is wood facemask
	if(global.headEquipped == 54){
		armor-=(1/8);
	}
	//56 is metal facemask
	if(global.headEquipped == 56){
		armor-=(1/4);
	}
	//81 is leather head
	if(global.headEquipped == 81){
		armor -= (1/6);	
	}
}
if(global.bodyEquipped != -1){
	//53 is wood chest
	if(global.bodyEquipped == 53){
		armor-=(1/8);
	}
	//55 is metal chest
	if(global.bodyEquipped == 55){
		armor-=(1/4);
	}
	//80 is leather chest
	if(global.bodyEquipped == 80){
		armor -= (1/6);
	}	
}

stealth = 0;
if(global.bodyEquipped == item.bluecloak){
	stealth = 1;	
}
if (global.headEquipped == item.pumpkin){
	stealth = 2;	
}

if(room == r_title) {
	isDying = false;
	isDead = false;
}

// Issue with multiple sheds in the same world
if(checkNearestShed && room != r_title && !global.generatingEnvironment && instance_exists(o_shed_floor)) {
	var nearShed = instance_nearest(x,y,o_shed_floor);
	if(instance_exists(nearShed) && !place_meeting(x,y,nearShed)) {
		nearShed.instRoof.drawRoof = true;
		global.playerInBuilding = false;
	}
}
	
if(isSleeping && isSpawning && keyboard_check(vk_anykey)) {
	isSleeping = false;
	isSpawning = false;
}

if(isDead) {
	global.interactingLoad = -1;
	global.interactingObject = -1;
	img_frame = 5;
	
	isHoldingTool = false;
	if(o_hud.alarm[6] == -1 && !o_hud.isGameover)
		o_hud.alarm[6] = 60*3;
		
	global.isInventoryOpen = false;
	
	if(instance_exists(o_tool))
		instance_destroy(o_tool);
	/*if(!instance_exists(o_dead)) {
		var dead = instance_create_depth(x+lengthdir_x(50, image_angle-90),y+lengthdir_y(50, image_angle-90),depth, o_dead);
		dead.image_angle = image_angle+180;
	}*/
}
	
if(global.temperature <= -15)
	isCold = true;
else
	isCold = false;
	
if(nearWarmth)
	isWarm = true;
else
	isWarm = false;
	


#region Setting stats max and min
if(health_ <= 0 && !isDying) {
	isDying = true;       
	isIdle = true;
	isWalking = false;
	isRunning = false;
	img_frame = 0;
	
	isHoldingTool = false;
	isHoldingWeapon = false;
	isHoldingBlock = false;
	if(instance_exists(o_tool))
		instance_destroy(o_tool);
}
	
if(health_ > maxHealth)
	health_ = maxHealth;
else if(health_ < 0)
	health_ = 0;

// Hunger
if(hunger_ < 0)
	hunger_ = 0;
	
if(hunger_ > 100)
	hunger_ = 100;
	
// Stamina
if(stamina > maxStamina)
	stamina = maxStamina;
else if(stamina < 0)
	stamina = 0;
	
if(isBleeding && alarm[4] == -1)
	alarm[4] = 60;
		
#endregion

if(healthKick && !kickBack) {
	kickBack = true;
	if(alarm[5] == -1)
		alarm[5] = 10;
}

#region Movement
	
	if(room == r_title)
		solid = false;
	else
		solid = true;
		
	var nearestFire = instance_nearest(x,y,par_flammable)
	
	if(place_meeting(x,y,nearestFire) && nearestFire.isOnFire) {
		isHit = true;
			
		objectHitting = nearestFire;
		health_-=5;
	}
	
	if(isInjured && !boneBreak) {
		switch(irandom(1)) {
			case 0: audio_play_sound(sn_bonebreak_1, 1, 0); break;
			case 1: audio_play_sound(sn_bonebreak_2, 1, 0); break;
		}
		
		boneBreak = true;
	}
	
	if(isInjured && isRunning && alarm[9] == -1) {
		alarm[9] = 60;
	}
	
	if(!isInjured)
		boneBreak = false;

	if(isHit && alarm[6] == -1) {
		
		
		if(lastHit < 3)
			lastHit++;
		else 
			lastHit = 0;
			
		switch(lastHit) {
			case 0: audio_play_sound(sn_bullet_hit_1, 1, 0); break;
			case 1: audio_play_sound(sn_bullet_hit_2, 1, 0); break;
			case 2: audio_play_sound(sn_spike_1, 1, 0); break;
			case 3: audio_play_sound(sn_spike_2, 1, 0); break;
		}
		
		healthKick = true;
		isSitting = false;
		isSleeping = false;
		
		if(instance_exists(objectHitting))
			move(3, point_direction(objectHitting.x, objectHitting.y, x,y), 10, 10);
		
		if(alarm[6] == -1)
			alarm[6] = 2;
	}

	if(!isDead && !isDying && !isSwinging && !isStabbing || (room == r_title && !isSitting)) {
		// Changing acceleration for ice
		if(place_meeting(x,y,o_pond) || place_meeting(x,y,o_lake) || place_meeting(x,y,o_pond2))
			acceleration = .8;
		else
			acceleration = 1;
		
		// If running with tool or weapon limit to only up
		if((isHoldingTool || isHoldingWeapon) && (isRunning || keyboard_check(global.K_RUN)) && (global.canMove) && (keyboard_check(global.K_UP) || keyboard_check(global.K_LEFT) || keyboard_check(global.K_RIGHT))) {
			xdir = 0;
			ydir = 0 - 1;
		} else if(global.canMove){
			// Get the move coordinates based on keyboard input.
			xdir = keyboard_check(global.K_RIGHT) - keyboard_check(global.K_LEFT);
			ydir = keyboard_check(global.K_DOWN) - keyboard_check(global.K_UP);
		}
		
		if(global.watchTower) {
			xdir = 0;
			ydir = 0;
		}
	
		// Saving last direction for roll
		if(keyboard_lastkey == global.K_UP || keyboard_check(global.K_UP))	
			lastVert = 0;
		else if(keyboard_lastkey == global.K_DOWN || keyboard_check(global.K_DOWN))
			lastVert = 1;
			
		if(keyboard_lastkey == global.K_RIGHT || keyboard_check(global.K_RIGHT))	
			lastHorz = 0;
		else if(keyboard_lastkey == global.K_LEFT || keyboard_check(global.K_LEFT))
			lastHorz = 1;
		
		if(!isRolling && !isIdle) {
			if(lastVert == 0 && lastHorz == 0)
				rollDirection = 0;
			else if(lastVert == 0 && lastHorz == 1)
				rollDirection = 1;
			else if(lastVert == 1 && lastHorz == 0)
				rollDirection = 2;
			else if(lastVert == 1 && lastHorz == 1)
				rollDirection = 3;
		} 
		
		if(isRolling) {
			switch(rollDirection) {
				case 0: xdir = 1; ydir = -1; break;
				case 1: xdir = -1; ydir = -1; break;
				case 2: xdir = 1; ydir = 1; break;
				case 3: xdir = -1; ydir = 1; break;
			}
			
			
			if(img_frame == 0)
				p_speed = 3.5;
			else if(img_frame == 1 || img_frame == 2)
				p_speed = 2.5;
			else if(img_frame == 3 || img_frame == 4)
				p_speed = 1.5;
			else
				p_speed = 1;
			
			acceleration = 1;
		}
	
		// Dont move if looting or editing name
		if(!global.canMove) {
			xdir = 0;
			ydir = 0;
		}
	
		// Getting the movement distance and direction.
		var move_dis = point_distance(0,0,xdir,ydir);
		var move_dir = point_direction(0,0, xdir, ydir);

		// Move the player towards coordinates base on image frame and check for collisions.
		if((isWalking && (img_frame != 0 && img_frame != 4)) || (isRunning && (img_frame != 0 && img_frame != 3)) || (isRolling))
			move(acceleration, move_dir + -global.camera_angle, p_speed, move_dis);
		else if((isWalking && (img_frame == 0 || img_frame == 4)) || (isRunning && (img_frame == 0 || img_frame == 3)))
			move(acceleration, move_dir + -global.camera_angle, p_speed/1.2, move_dis);

		// Dodging	
		if(keyboard_check_pressed(global.K_DODGE) && !isRolling && isStanding && !isSitting && !isSleeping && !isHarvesting && global.canMove && !isSwinging && !isStabbing && !global.generatingEnvironment) {
			
			var costToRoll = 10;
			if(global.headEquipped != -1){
				//58 is wood facemask
				if(global.headEquipped == 58){
					costToRoll+=2;
				}
				//61 is metal facemask
				if(global.headEquipped == 61){
					costToRoll+=4;
				}
			}
			if(global.bodyEquipped != -1){
				//59 is wood chest
				if(global.bodyEquipped == 59){
					costToRoll+=2;
				}
				//60 is metal chest
				if(global.bodyEquipped == 60){
					costToRoll+=4;
				}
			}
			
			if(stamina >= costToRoll){
			
				isRolling = true;
				img_frame = 0;
				alarm[0] = 1;
				newFootprint = true;
				stamina-=costToRoll;
				
				switch(flap) {
					case 0: audio_play_sound(sn_flap_1,1,0); flap++; break;
					case 1: audio_play_sound(sn_flap_2,1,0); flap=0; break;
				}
			
			
				if(instance_exists(o_tool) && isBlocking) {
					isHoldingBlock = false;
					o_tool.isBlocking = false;

					isBlocking = false;
					img_frame = 0;
					alarm[0] = 1;

					global.target = false;
				}
				

			}
			
		}
	
		// Idle/Walking/Running/Sitting
		if(!isRolling) {
			// Idle
			if((xdir == 0 && ydir == 0) || isSitting || isSleeping || isHarvesting) 
				isIdle = true;
			else if(!isSitting && !isSleeping)
				isIdle = false;
			
		
		//if((isHoldingTool || isHoldingWeapon) && (isRunning || keyboard_check(global.K_RUN)) && ydir > 0) {
		//	isWalking = true;
		//}
			// Running/Walking
			if(!isIdle && isStanding) {
				if(keyboard_check(global.K_RUN) && !global.isAiming && stamina > 0 && !((isHoldingTool || isHoldingWeapon) && (isRunning || keyboard_check(global.K_RUN)) && ydir > 0)) {
					if(isInjured) {
						p_speed = .65;
					} else {
						p_speed = .75;
					}
					isRunning = true;
					isWalking = false;
				} else {
					if(isInjured) {
						p_speed = .35;
					} else {
						p_speed = .45;
					}
					isWalking = true;
					isRunning = false;
				}
			} else {
				isWalking = false;
				isRunning = false;
			}
		
			// Sitting
			if((keyboard_check_pressed(global.K_SIT) || (isSitting && (keyboard_check_pressed(global.K_UP) || keyboard_check_pressed(global.K_DOWN) || keyboard_check_pressed(global.K_LEFT) || keyboard_check_pressed(global.K_RIGHT) || keyboard_check_pressed(global.K_DODGE))))
			&& room != r_title && !global.isCrateOpen && !isSleeping && !global.generatingEnvironment) {
				isSitting = !isSitting;
			
				// Starting animation from beginning
				if(isSitting)
					img_frame = 0;
			}
		}
	}
	
	if(isSwinging || isStabbing || isBlocking) {
		isIdle = false;
		isWalking = false;
		isRunning = false;
	}
	
	if(isWalking || isRunning) {
		isStanding = true;
		isSitting = false;
		isSleeping = false;
		isHarvesting = false;
		isHarvestingIdle = false;
	}
	//show_debug_message("XDIR" + string(xdir) + "YDIR" + string(ydir))
	//show_debug_message("SITTING" + string(isSitting) + "STANDING" + string(isStanding))
#endregion

#region Image Indexing

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

	// Setting direction reference to the global.dir.
	if(global.dir != dir_ref)
		dir_ref = global.dir;
	
	// Setting player angle based on movement direction
	if(!isSitting && !isSleeping && !isDying) {
		if(xdir == 0 && ydir == 1)
			img_index = 0;
		if(xdir == 1 && ydir == 1)
			img_index = 1;
		if(xdir == 1 && ydir == 0)
			img_index = 2;
		if(xdir == 1 && ydir == -1)
			img_index = 3;
		if(xdir == 0 && ydir == -1)
			img_index = 4;
		if(xdir == -1 && ydir == -1)
			img_index = 5;
		if(xdir == -1 && ydir == 0)
			img_index = 6;
		if(xdir == -1 && ydir == 1)
			img_index = 7;
	}
	
	if(xdir != 0 || ydir != 0) {
		lastDirX = xdir;
		lastDirY = ydir;
	}

#endregion

if(place_meeting(x,y,o_cavefloor) || room == r_cave) {
	isCave = true;
} else
	isCave = false;

//turn it off when generating for now cus it looks weird and just slows it down more

#region Creating Footprints

if(!isIdle && !isRolling && !isCave) {
	// Creating footprint objects
	if(img_index == 0) {
		if(isRunning) {	
			// Creating running footprint
			if(newFootprint) {
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(-3,-global.camera_angle),y + lengthdir_y(-3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 0) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle),y + lengthdir_y(3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 7) {
					var footprint = instance_create_depth(x + lengthdir_x(-3,-global.camera_angle),y + lengthdir_y(-3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 3) {
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
				if(img_frame == 0) {
					var footprint = instance_create_depth(x + lengthdir_x(-2,-global.camera_angle),y + lengthdir_y(-2,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle+125),y + lengthdir_y(4,-global.camera_angle+125),9001,o_footprint);
					footprint.objectIndex = self;
				}
				
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle),y + lengthdir_y(4,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 7) {
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
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+90),y + lengthdir_y(3,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 0) {
					var footprint = instance_create_depth(x,y,9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(1,-global.camera_angle+90),y + lengthdir_y(1,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 7) {
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
				if(img_frame == 0) {
					var footprint = instance_create_depth(x + lengthdir_x(6,-global.camera_angle+75),y + lengthdir_y(6,-global.camera_angle+75),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle+75),y + lengthdir_y(4,-global.camera_angle+75),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+90),y + lengthdir_y(3,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 7) {
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
				if(img_frame == 0) {
					var footprint = instance_create_depth(x + lengthdir_x(-4,-global.camera_angle),y + lengthdir_y(-4,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle),y + lengthdir_y(3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(-3,-global.camera_angle),y + lengthdir_y(-3,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 7) {
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
				if(img_frame == 0) {
					var footprint = instance_create_depth(x + lengthdir_x(6,-global.camera_angle-75),y + lengthdir_y(6,-global.camera_angle-75),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle-75),y + lengthdir_y(4,-global.camera_angle-75),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+45),y + lengthdir_y(3,-global.camera_angle+45),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 7) {
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
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(3,-global.camera_angle+90),y + lengthdir_y(3,-global.camera_angle+90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 0) {
					var footprint = instance_create_depth(x,y,9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 7) {
					var footprint = instance_create_depth(x + lengthdir_x(1,-global.camera_angle-90),y + lengthdir_y(1,-global.camera_angle-90),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 3) {
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
				if(img_frame == 0) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle),y + lengthdir_y(2,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(4,-global.camera_angle-125),y + lengthdir_y(4,-global.camera_angle-125),9001,o_footprint);
					footprint.objectIndex = self;
				}
			
				newFootprint = false;
			}
		} else {
			// Creating walking footprint
			if(newFootprint) {
				if(img_frame == 3) {
					var footprint = instance_create_depth(x + lengthdir_x(-4,-global.camera_angle),y + lengthdir_y(-4,-global.camera_angle),9001,o_footprint);
					footprint.objectIndex = self;
				} else if(img_frame == 7) {
					var footprint = instance_create_depth(x + lengthdir_x(2,-global.camera_angle-90),y + lengthdir_y(2,-global.camera_angle-90),9001,o_footprint);
					footprint.objectIndex = self;
				}
					
				newFootprint = false;
			}
		}
	}
} else if(isIdle && isHoldingTool && !isCave) {
	// Creating walking footprint
	if(newFootprint) {
		if(img_frame == 0) {
			var footprint = instance_create_depth(x + lengthdir_x(irandom_range(-1,1),-global.camera_angle),y + lengthdir_y(irandom_range(-1,1),-global.camera_angle),9001,o_footprint);
			footprint.objectIndex = self;
		} else if(img_frame == 5) {
			var footprint = instance_create_depth(x + lengthdir_x(irandom_range(-1,1),-global.camera_angle),y + lengthdir_y(irandom_range(-1,1),-global.camera_angle),9001,o_footprint);
			footprint.objectIndex = self;
		}
					
		newFootprint = false;
	}
} else if(isRolling && img_frame == 4 && newFootprint && !isCave) {
	var footprint = instance_create_depth(x,y,9001,o_footprint);
	footprint.objectIndex = self;
	footprint.isRolling = true;
		
	newFootprint = false;
}


#endregion