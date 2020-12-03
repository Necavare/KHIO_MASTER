if(global.censoring && !censor) {
	// Cowardly
	string1_1 = "Ahhhh"
	string1_2 = "Leave me alone!"
	string1_3 = "@%$# off!"
	string1_4 = "I dont wanna die!"
	string1_5 = "I am too young to die!"
	string1_6 = "Please dont kill me!"

	// Chasing Player
	string2_1 = "Get back here!"
	string2_2 = "Little @%*$#!"
	string2_3 = "Quit running!"
	string2_4 = "I'll spit on your grave!"
	string2_5 = "Shoot at him!"

	// Freak out
	string3_1 = "Ahhh!"
	string3_2 = "@%$#!"
	string3_3 = "Put it out!"
	string3_4 = "Someone get the water!"

	// Gets hit
	string4_1 = "Mother@#%*$#!"
	string4_2 = "I'll get you for that!"
	string4_3 = "@#%*$#%!"
	string4_4 = "Tis but a scratch!"
	string4_5 = "Ouch"
	
	censor = true;
} else if(!global.censoring && censor) {
	// Cowardly
	string1_1 = "Ahhhh"
	string1_2 = "Leave me alone!"
	string1_3 = "Fuck off!"
	string1_4 = "I dont wanna die!"
	string1_5 = "I am too young to die!"
	string1_6 = "Please dont kill me!"

	// Chasing Player
	string2_1 = "Get back here!"
	string2_2 = "Little bitch!"
	string2_3 = "Quit running!"
	string2_4 = "I'll spit on your grave!"
	string2_5 = "Shoot at him!"

	// Freak out
	string3_1 = "Ahhh!"
	string3_2 = "Fuck!"
	string3_3 = "Put it out!"
	string3_4 = "Someone get the water!"

	// Gets hit
	string4_1 = "Motherfucker!"
	string4_2 = "I'll get you for that!"
	string4_3 = "Dammit!"
	string4_4 = "Tis but a scratch!"
	string4_5 = "Ouch"
	
	censor = false;
}

if(!global.generatingEnvironment){
	
// Finding angle
var distance1 = -global.camera_angle-angle;
var distance2 = -360-global.camera_angle-angle;
var distance3 = 360-global.camera_angle-angle;

var distancefinal = min(abs(distance1), abs(distance2), abs(distance3));

if(distancefinal = abs(distance1))
	distancefinal = distance1;
if(distancefinal = abs(distance2))
	distancefinal = distance2;
if(distancefinal = abs(distance3))
	distancefinal = distance3;
angle += (distancefinal)*.05;
	
if(angle > 0){
	angle = angle-360;	
}
if(angle < -360){
	angle = 360 + angle;
}

if(collision_circle(x,y,50,o_player,true,true))
	playerNear = true;
else
	playerNear = false;

var fixDir = irandom(360);
if(!place_meeting(x,y,o_buckshot)&&!place_meeting(x,y,o_bullet)&&!place_meeting(x,y,o_bolt)&&!place_meeting(x,y,o_tool_thrown)&&(towerPointer == -1)&&!place_free(x,y))
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

var thrown = instance_nearest(x,y, o_tool_thrown);
if(collision_circle(x,y,5,thrown,true,true) && thrown.z > 0 && canHit) {
	p_speed = 25;
	acceleration = 3;
	
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
	
	enemy_health-=thrown.damage*2;
	o_camera.shake = 2;
	
	switch(irandom(1)) {
		case 0: audio_play_sound_on(enemy, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(enemy, sn_bullet_hit_2, 0, 1); break;
	}
	
	repeat(4) {
		var blood = instance_create_depth(x, y, depth, o_particles);
			blood.spurt = true;
			var angle1 = -global.camera_angle+90;
			blood.dir_ = irandom_range(angle1-30, angle1+30);
	}
	
	canHit = false;
	alarm[3] = 20;
	chopFrame = 0;
}

var nade = instance_nearest(x,y,o_grenade);
if(instance_exists(nade) && (collision_circle(nade.x,nade.y,35,self, true, false) || place_meeting(x,y,nade)) && !nade.isExploded && canHit) {
	enemy_health-=3.5;
	
	switch(irandom(1)) {
		case 0: audio_play_sound_on(enemy, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(enemy, sn_bullet_hit_2, 0, 1); break;
	}
	
	repeat(4) {
		var blood = instance_create_depth(x, y, depth, o_particles);
			blood.spurt = true;
			var angle1 = -global.camera_angle+90;
			blood.dir_ = irandom_range(angle1-30, angle1+30);
	}
	
	canHit = false;
	alarm[3] = 20;
}

#region Movement

	// Changing acceleration for ice
	if(place_meeting(x,y,o_pond) || place_meeting(x,y,o_lake))
		acceleration = .8;
	else
		acceleration = 1;
	
	// Fleeing from player and gunshots
	if( ((point_distance(x,y,o_player.x, o_player.y) <= 40) && !loadedArrow && instance_exists(o_tool)) || cowardlyFellow) {
		playerFlee = true;
	}
	else if(point_distance(x,y,o_player.x, o_player.y) >= 50)
		playerFlee = false;
	
	// You can set the move coordinates here. 
	var detectDis = 80;
	if(global.itemEquipped == item.torch || global.itemEquipped == item.lantern)
		detectDis = 110;
	if(global.bodyEquipped == item.bluecloak)
		detectDis -= 80;
	if(global.headEquipped == item.pumpkin)
		detectDis -= 40;
	if(detectDis <= 10)
		detectDis = 10;
	if((point_distance(x,y,o_player.x, o_player.y) <= detectDis)&&!playerFlee&&!freakOut){
		if(cowardlyFellow){
			if(!playerFlee){
				alarm[5] = 	60*15;//afte 15 seconds they stop being cowardly
			}
			playerFlee = true;
		}else if(!o_player.isDead && !o_player.isDying){
			if(!playerDetected){
				audio_play_sound_on(self, sn_enemy_notice, 0, 1);
				playerPrevDetected = true;
				alarm[9] = 60*90;	
			}
			playerDetected = true;
		}else if(!playerPrevDetected)
			playerDetected = false;
	}
	
	if((distance_to_object(o_bullet) <= 45)){
			if(!playerDetected){
				audio_play_sound_on(self, sn_enemy_notice, 0, 1);
				playerPrevDetected = true;
				alarm[9] = 60*90;
			}
			playerDetected = true;
	}
	if((distance_to_object(o_tool_thrown) <= 45)){
		if(!playerDetected){
			audio_play_sound_on(self, sn_enemy_notice, 0, 1);
			playerPrevDetected = true;
			alarm[9] = 60*90;
		}
		playerDetected = true;
	}
		
	if((point_distance(x,y,o_player.x, o_player.y)< 60)&&(point_distance(x,y,o_player.x, o_player.y)> 40)&&!playerFlee&&!freakOut){
		if(!cowardlyFellow){
			if(!playerInRange)
				img_frame = 0;
			playerInRange = true;
		}
	}
	else if(((img_frame == 0) && (point_distance(x,y,o_player.x, o_player.y) > 70)) || playerFlee || freakOut)
		playerInRange = false;
	
	if(playerFlee){
		isRunning = true;
		isWalking = false;
		isIdle = false;
		p_speed = 0.7;
		move_dis = 1000;
		move_dir = -point_direction(x, y, o_player.x, o_player.y);
		xdir = x+lengthdir_x(100, move_dir);
		ydir = y+lengthdir_y(100, move_dir);
	}
	else if(playerInRange && !isDying){
		/*
		if((isRunning == true) && !loadedArrow){//if he used to be running
			img_frame = 1;//skip a frame so reload doenst look bad
		}*/
		
		isRunning = false;
		isWalking = false;
		isIdle = true;
		p_speed =0;
		xdir = o_player.x;
		ydir = o_player.y;
		move_dir = point_direction(x,y,xdir, ydir);
	}
	else if(playerDetected && !isDying){
		if(chaseDelay > 0)
			chaseDelay--;
		isRunning = true;
		isWalking = false;
		isIdle = false;
		p_speed = 0.7; //running
		xdir = o_player.x;
		ydir = o_player.y;
		
		// Getting the movement distance and direction.
		if(chaseDelay == 0){
			startedMoving = true;
			move_dis = point_distance(x,y,xdir,ydir);
			move_dir = point_direction(x,y, xdir, ydir);
		}
	}

	// Move the player towards coordinates base on image frame and check for collisions.
	if((isWalking && (img_frame != 6 || img_frame != 2)) || (isRunning && (img_frame != 5 || img_frame != 2))){
		//mp_potential_step(x+lengthdir_x(move_dis, move_dir), y+lengthdir_y(move_dis, move_dir), p_speed, false);
		var placeX =x+lengthdir_x(1, move_dir);
		var placeY =y+lengthdir_y(1,move_dir);
		
		var flammableList = ds_list_create();
			collision_point_list(placeX, placeY, par_flammable, false, true, flammableList, false);
			var flammableTrue = false;
			for(var i = 0; i <ds_list_size(flammableList); i++){
				if(ds_list_find_value(flammableList, i).isOnFire){
					flammableTrue = true;	
				}
			}
			
		if( (!place_free(placeX, placeY)||flammableTrue) && !place_meeting(placeX, placeY, o_player)&& !place_meeting(placeX, placeY, o_door_wood)){
			if(playerDetected)
				chaseDelay = 15;
			if(positiveFellow)
				dirChange = -5;
			else
				dirChange = 5;
			move_dir+=dirChange;
			startedMoving = true;
		}
		
		if(isWalking)
			p_speed = .35;
		
		move(acceleration, move_dir, p_speed, move_dis);	
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
	
	//if tower pointer is not -1 then put it on the tower its pointing too
	if(towerPointer != -1 && instance_exists(towerPointer)){
		x = towerPointer.x+lengthdir_x(towerPointer.z,-camera_get_view_angle(view_camera[0])+90)+lengthdir_x(16, towerPointer.image_angle+90);
		y = towerPointer.y+lengthdir_y(towerPointer.z,-camera_get_view_angle(view_camera[0])+90)+lengthdir_y(16, towerPointer.image_angle+90);
		depth = towerPointer.depth - 1;
		isIdle = true;
		isRunning = false;
		isWalking = false;
		freakOut = false;
		playerFlee = false;
		playerDetected = true;
		playerInRange = true;
	}
#endregion

#region Image Indexing
//keeping move_dir in 360 range
//var true_dir = move_dir-global.camera_angle;
true_dir = move_dir+global.camera_angle;
if(true_dir>360)
	true_dir = true_dir-360;
else if(true_dir < 0)
	true_dir = 360+true_dir;
if((!isIdle && startedMoving)||(playerInRange)||playerFlee){
	/*
	if(true_dir<30 || true_dir>330)
		img_index = 2;//right
	else if(true_dir>=30 && true_dir<=60)
		img_index = 3//upright
	else if(true_dir>60 && true_dir<120)
		img_index = 4;//up
	else if(true_dir>=120 && true_dir <=150)
		img_index = 5;//upleft
	else if(true_dir>150 && true_dir < 210)
		img_index = 6;//left
	else if(true_dir>=210 && true_dir <=240)
		img_index = 7;//left down
	else if(true_dir>240 && true_dir<300)
		img_index = 0;//down
	else if(true_dir>=300 && true_dir<=330)
		img_index = 1;//right down
	*/	
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

	// Setting direction reference to the global.dir.
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
		alarm[11] = 60;
		damageTick = true;
		damageTickStatus = 2;
	}
	else{
		alarm[11] = 60;
		damageTick = true;
		damageTickStatus = 3;
	}
	
	switch(irandom(1)) {
		case 0: audio_play_sound_on(enemy, sn_bullet_hit_1, 0, 1); break;
		case 1: audio_play_sound_on(enemy, sn_bullet_hit_2, 0, 1); break;
	}
	
	repeat(8) {
		var blood = instance_create_depth(x, y, depth, o_particles);
			blood.spurt = true;
			var angle1 = -global.camera_angle+90;
			blood.dir_ = irandom_range(angle1-30, angle1+30);
	}
	
	o_tool.isHitting = true;
	enemy_health-=o_tool.finalDamage/4;
	o_camera.shake = 2;
	
	//var ranS = irandom_range(0, 2);
	//if(ranS == 0) audio_play_sound(sn_chop,0,0);
	//else if(ranS == 1) audio_play_sound(sn_chop1,0,0);
	//else if(ranS == 2) audio_play_sound(sn_chop2,0,0);
	canHit = false;
	alarm[3] = 20;
	chopFrame = 0;
	
	// Setting new target
	var ang = irandom_range(0, 360);
	targetX = x + lengthdir_x(8, ang);
	targetY = y + lengthdir_y(8, ang);
}

if(chopFrame < 3)
	chopFrame+=.25;
else
	chopFrame = 0;
	
if(damageTick && damageTickStatus == 2){//fire
	var flame1 = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
	flame1.z = 14;
}
	
#region attacking
if((img_frame == 3) && playerInRange && !hasShot && loadedArrow && !o_player.isDead && !o_player.isDying){
	//var hurtBox = instance_create_depth(x,y,1, o_enemyHurtBox);
	//hurtBox.img_index = img_index;
	//hurtBox.image_angle = -global.camera_angle; //maybe not necessary
	var launchX = x+lengthdir_x(16, -global.camera_angle+90);
	var launchY = y+lengthdir_y(16, -global.camera_angle+90);
	var hitX = o_player.x//+lengthdir_x(10, -global.camera_angle+90);
	var hitY = o_player.y//+lengthdir_y(10, -global.camera_angle+90);
	
	
	var bolt = instance_create_depth(launchX,launchY,1, o_enemy_bolt);
	var fireAng = point_direction(launchX,launchY,hitX, hitY);
	bolt.image_angle = fireAng;
	bolt.bulletfirex = launchX+lengthdir_x(80, fireAng);
	bolt.bulletfirey = launchY+lengthdir_y(80, fireAng);
	
	hasShot = true;
}
#endregion

}