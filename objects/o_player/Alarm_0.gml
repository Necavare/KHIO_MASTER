/// @description Animation framerates/sounds
if(!isSwinging && !isStabbing && !isBlocking) {
	if(isIdle && !isSitting && !isSleeping && !isDying && isStanding && !isRolling && !isHarvesting && !isHarvestingIdle && !isRunning) { // Idle framerate
		if(img_frame < 3)
			img_frame++;
		else
			img_frame = 0;
		
		alarm[0] = 8;
	} else if(isHarvestingIdle && isHarvesting && !isSitting && !isSleeping && !isDying && !isRolling && !isRunning) { // Idle harvesting framerate
		if(img_frame < 3)
			img_frame++;
		else
			img_frame = 0;
		
		alarm[0] = 8;
	} else if(isWalking && !isRolling && !isRunning) { // Walking framerate
		if(img_frame < 7)
			img_frame++;
		else
			img_frame = 0;
	
		// Bobbing
		if(img_frame == 2 || img_frame == 6)
			bob = true;
		else 
			bob = false;
			
		if(instance_exists(o_tool))
			o_tool.frame = img_frame;
		
		alarm[0] = 8;
	} else if(isRunning || isRolling) { // Running/Dodging
		if(img_frame < 5)
			img_frame++;
		else
			img_frame = 0;
		
		// Bobbing
		if(img_frame == 2 || img_frame == 5)
			bob = true;
		else 
			bob = false;
			
		if(instance_exists(o_tool))
			o_tool.frame = img_frame;
			
		if(img_frame == 5)
			isRolling = false;
		
		alarm[0] = 6;
	} else if(isStanding && (isSitting || isSleeping || isDying || isHarvesting) && !isRolling && !isHarvestingIdle) { // Sitting/Sleeping/Harvesting
		if(img_frame < 5)
			img_frame++;
		else
			img_frame = 0;
	
		if(img_frame == 5) {
			isStanding = false;
			if(isDying) {
				isDead = true;
				audio_play_sound(sn_dodge_1, 1, 0);
			}
				
			if(isHarvesting)
				isHarvestingIdle = true;
		}
		
		alarm[0] = 8;
	} else if(!isStanding && (!isSitting || !isSleeping || !isHarvesting) && !isDying && !isRolling) { // Standing up from sleeping sitting or harvesting
		if(img_frame > 0)
			img_frame--;
		else
			img_frame = 5;
		
		if(img_frame == 0) {
			isStanding = true;
			isHarvestingIdle = false;
		}
		
		alarm[0] = 6;
	} else // Waiting for animation
		alarm[0] = 1;
} else if(isHoldingTool && (isSwinging || isStabbing) && !isRolling) {
	if(img_frame < 5)
		img_frame++;
	else
		img_frame = 0;
		
	o_tool.frame = img_frame;	
	
	p_speed = 1;
	acceleration = 1;

	move(acceleration, -global.camera_angle+90, p_speed, 1);

	// Throwing tool
	if(isStabbing && img_frame == 3) {
		global.interactingObject = -1;
		global.interactingLoad = -1;
	
		var tool = instance_create_depth(o_tool.x, o_tool.y, depth, o_tool_thrown);
		tool.sprite_index = o_tool.sprite_index; 
		tool.image_index = o_tool.image_index; 
		tool.range = o_tool.range;
		tool.isLit = o_tool.isLit;
		tool.side = o_tool.side;
		tool.angle = -global.camera_angle+90;
		tool.toolAngle = o_tool.startingAngle;
		tool.damage = o_tool.damage-1;
			
		tool.item_ = o_hud.hotbarItems[# 0, o_hud.hotbarSlot];
		tool.count = o_hud.hotbarCount[# 0, o_hud.hotbarSlot];
		tool.durability = o_hud.hotbarDurability[# 0, o_hud.hotbarSlot];
			
		if(o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] > 0) {
			o_hud.hotbarItems[# 0, o_hud.hotbarSlot] = 0;
			o_hud.hotbarCount[# 0, o_hud.hotbarSlot] = 0;
			o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
		} else if(o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] <= 0) {
			if(o_hud.hotbarCount[# 0, o_hud.hotbarSlot] > 0)
				o_hud.hotbarCount[# 0, o_hud.hotbarSlot]--;
			
			if(o_hud.hotbarCount[# 0, o_hud.hotbarSlot] <= 0) {
				o_hud.hotbarItems[# 0, o_hud.hotbarSlot] = 0;
				o_hud.hotbarCount[# 0, o_hud.hotbarSlot] = 0;
				o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
			}
		}
			
			
		o_hud.showHotbar = true;
	}
		
	
	// Resetting swing
	if((isSwinging || isStabbing) && img_frame >= 5) {
		isSwinging = false;
		isStabbing = false;
		o_tool.isSwung = false;
		o_tool.isStabbed = false;
		o_tool.frame = 0;
		o_tool.canSwing = true;
	}	
		
	alarm[0] = 3;
} else if(isHoldingTool && isBlocking && !isRolling) {
	if(img_frame < 7)
		img_frame++;
	else
		img_frame = 0;
	
	if(isHoldingBlock)
		img_frame = 4;	
		
	//img_frame = 6;
		
	o_tool.frame = img_frame;
		
	if(isBlocking && img_frame >= 4) {
		isHoldingBlock = true;
	} else if(!isBlocking)
		isHoldingBlock = false;
		
	if(img_frame >= 7 && isBlocking) {
		isBlocking = false;
	}
		
	alarm[0] = 2;
} else // Waiting for animation
	alarm[0] = 1;
	
//reset alarm timers if reloading to line up with reload time
//4 frames in reload animation with 20 tick alarm

// Creating Footprint sounds
if(!isIdle) {
	if(isWalking) {
		if(newFootprint == false && (img_frame == 7 || img_frame == 3))
			newFootprint = true;
		
		if(img_frame == 7 || img_frame == 3) {
			repeat(8) {
				var snow = instance_create_depth(x, y, depth, o_particles);
					snow.snow = true;
			}
		
			if((place_meeting(x,y,o_lake) || place_meeting(x,y,o_pond) || place_meeting(x,y,o_pond2)) && !global.generatingEnvironment) {
				if(lastNoise < 4)
					lastNoise++;
				else
					lastNoise = irandom_range(0,1);
					
				while(isWalking && !isRunning && (lastNoise == 0 || lastNoise == 1))
					lastNoise++;
				
				switch(lastNoise) {
					case 0: audio_play_sound(sn_icewalk_1,1,0); break;
					case 1: audio_play_sound(sn_icewalk_2,1,0); break;
					case 2: audio_play_sound(sn_icewalk_3,1,0); break;
					case 3: audio_play_sound(sn_icewalk_4,1,0); break;
					case 4: audio_play_sound(sn_icewalk_5,1,0); break;
				}
				
			} else {
				
				if(lastNoise < 5)
					lastNoise++;
				else
					lastNoise = irandom_range(0,3);
					
				while(isRunning && lastNoise == 4)
					lastNoise++;
					
				while(isRunning && lastNoise == 5)
					lastNoise = irandom_range(0,3);
				
				switch(lastNoise) {
					case 0: audio_play_sound(sn_snowwalk_1, 1, 0); break;
					case 1: audio_play_sound(sn_snowwalk_2, 1, 0); break;
					case 2: audio_play_sound(sn_snowwalk_3, 1, 0); break;
					case 3: audio_play_sound(sn_snowwalk_4, 1, 0); break;
					case 4: audio_play_sound(sn_snowwalk_5, 1, 0); break;
					case 5: audio_play_sound(sn_snowwalk_6, 1, 0); break; 
				}
				
			}
			
			if(lastGrassNoise < 3)
				lastGrassNoise++;
			else
				lastGrassNoise = 0;
			
			// Grass/Bush rustling sound
			if(place_meeting(x,y,o_grass) || place_meeting(x,y,o_cattail) || place_meeting(x,y,o_bush) || place_meeting(x,y,o_big_bush)) {
				switch(lastGrassNoise) {
					case 0: audio_play_sound(sn_foliage_rustle_1, 1, 0); break;
					case 1: audio_play_sound(sn_foliage_rustle_2, 1, 0); break;
					case 2: audio_play_sound(sn_foliage_rustle_3, 1, 0); break;
					case 3: audio_play_sound(sn_foliage_rustle_4, 1, 0); break;
				}
			}
		}
				
	} else if(isRunning) {
		if(newFootprint == false && (img_frame == 0 || img_frame == 3))
			newFootprint = true;
		
		if(img_frame == 0 || img_frame == 3) {
			repeat(12) {
				var snow = instance_create_depth(x, y, depth, o_particles);
					snow.snow = true;
			}
			
			if((place_meeting(x,y,o_lake) || place_meeting(x,y,o_pond) || place_meeting(x,y,o_pond2)) && !global.generatingEnvironment) {
				if(lastNoise < 4)
					lastNoise++;
				else
					lastNoise = irandom_range(0,1);
					
				while(isWalking && !isRunning && (lastNoise == 0 || lastNoise == 1))
					lastNoise++;
				
				switch(lastNoise) {
					case 0: audio_play_sound(sn_icewalk_1,1,0); break;
					case 1: audio_play_sound(sn_icewalk_2,1,0); break;
					case 2: audio_play_sound(sn_icewalk_3,1,0); break;
					case 3: audio_play_sound(sn_icewalk_4,1,0); break;
					case 4: audio_play_sound(sn_icewalk_5,1,0); break;
				}
				
			} else {
				
				if(lastNoise < 5)
					lastNoise++;
				else
					lastNoise = irandom_range(0,3);
					
				while(isRunning && lastNoise == 4)
					lastNoise++;
					
				while(isRunning && lastNoise == 5)
					lastNoise = irandom_range(0,3);
				
				switch(lastNoise) {
					case 0: audio_play_sound(sn_snowwalk_1, 1, 0); break;
					case 1: audio_play_sound(sn_snowwalk_2, 1, 0); break;
					case 2: audio_play_sound(sn_snowwalk_3, 1, 0); break;
					case 3: audio_play_sound(sn_snowwalk_4, 1, 0); break;
					case 4: audio_play_sound(sn_snowwalk_5, 1, 0); break;
					case 5: audio_play_sound(sn_snowwalk_6, 1, 0); break; 
				}
			}
		}
		
		if(img_frame == 5) {
			if(lastGrassNoise < 3)
				lastGrassNoise++;
			else
				lastGrassNoise = 0;
		
			// Grass/Bush rustling sound
			if(place_meeting(x,y,o_grass) || place_meeting(x,y,o_cattail) || place_meeting(x,y,o_bush) || place_meeting(x,y,o_big_bush)) {	
				switch(lastGrassNoise) {
					case 0: audio_play_sound(sn_foliage_rustle_1, 1, 0); break;
					case 1: audio_play_sound(sn_foliage_rustle_2, 1, 0); break;
					case 2: audio_play_sound(sn_foliage_rustle_3, 1, 0); break;
					case 3: audio_play_sound(sn_foliage_rustle_4, 1, 0); break;
				}
			}
		}
	}
} else if((isHoldingTool || isHoldingWeapon || isAimingWeapon) && isIdle && alarmRotationAngle != global.camera_angle) {
	if(img_frame == 5 || img_frame == 0) {
		repeat(8) {
			var snow = instance_create_depth(x, y, depth, o_particles);
				snow.snow = true;
		}
			
		if(newFootprint == false)
			newFootprint = true;
		
			if((place_meeting(x,y,o_lake) || place_meeting(x,y,o_pond) || place_meeting(x,y,o_pond2)) && !global.generatingEnvironment) {
				if(lastNoise < 4)
					lastNoise++;
				else
					lastNoise = irandom_range(0,1);
					
				while(isWalking && !isRunning && (lastNoise == 0 || lastNoise == 1))
					lastNoise++;
				
				switch(lastNoise) {
					case 0: audio_play_sound(sn_icewalk_1,1,0); break;
					case 1: audio_play_sound(sn_icewalk_2,1,0); break;
					case 2: audio_play_sound(sn_icewalk_3,1,0); break;
					case 3: audio_play_sound(sn_icewalk_4,1,0); break;
					case 4: audio_play_sound(sn_icewalk_5,1,0); break;
				}
				
			} else {
				
				if(lastNoise < 5)
					lastNoise++;
				else
					lastNoise = irandom_range(0,3);
					
				while(isRunning && lastNoise == 4)
					lastNoise++;
					
				while(isRunning && lastNoise == 5)
					lastNoise = irandom_range(0,3);
				
				switch(lastNoise) {
					case 0: audio_play_sound(sn_snowwalk_1, 1, 0); break;
					case 1: audio_play_sound(sn_snowwalk_2, 1, 0); break;
					case 2: audio_play_sound(sn_snowwalk_3, 1, 0); break;
					case 3: audio_play_sound(sn_snowwalk_4, 1, 0); break;
					case 4: audio_play_sound(sn_snowwalk_5, 1, 0); break;
					case 5: audio_play_sound(sn_snowwalk_6, 1, 0); break; 
				}
			}
			
			if(lastGrassNoise < 3)
				lastGrassNoise++;
			else
				lastGrassNoise = 0;
			
			// Grass/Bush rustling sound
			if(place_meeting(x,y,o_grass) || place_meeting(x,y,o_cattail) || place_meeting(x,y,o_bush) || place_meeting(x,y,o_big_bush)) {
				switch(lastGrassNoise) {
					case 0: audio_play_sound(sn_foliage_rustle_1, 1, 0); break;
					case 1: audio_play_sound(sn_foliage_rustle_2, 1, 0); break;
					case 2: audio_play_sound(sn_foliage_rustle_3, 1, 0); break;
					case 3: audio_play_sound(sn_foliage_rustle_4, 1, 0); break;
				}
			}
		}
}

if(alarmRotationAngle != global.camera_angle)
	alarmRotationAngle = global.camera_angle;
	
if(img_frame == 3 && isRolling) {
	switch(irandom_range(0, 1)) {
		case 0: audio_play_sound(sn_dodge_1, 1, 0); break;
		case 1: audio_play_sound(sn_dodge_2, 1, 0); break;
	}
}