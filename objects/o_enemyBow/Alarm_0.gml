/// @description Animation framerates/sounds
audio_emitter_position(enemy, x, y, 0);
if(isIdle && !playerInRange) { // Idle framerate
	if(img_frame < 3)
		img_frame++;
	else
		img_frame = 0;
		
	alarm[0] = 8;
} else if(playerInRange && !playerFlee){
	if(loadedArrow){//shooting
		if(img_frame < 	4)
			img_frame++;
		else{
			audio_play_sound_on(enemy, sn_crossbow_shoot, 0, 1);
			audio_play_sound_on(enemy, sn_crossbow_arrow, 0, 1);
			img_frame = 0;
			hasShot = false;
			loadedArrow = false;
		}
		alarm[0] = 8;
	}
	else{//reloading
		if(img_frame == 0)
			audio_play_sound_on(enemy, sn_crossbow_reload, 0, 1);
		
		if(img_frame < 	5)
			img_frame++;
		else{
			img_frame = 1;//set frame for the shooting frame
			loadedArrow = true;
		}
		alarm[0] = 8;
		if(towerPointer != -1)
			alarm[0] = 16;
	}
} else if(isWalking) { // Walking framerate
	if(img_frame < 7)
		img_frame++;
	else
		img_frame = 0;
		
	alarm[0] = 8;
} else if(isRunning) { // Running
	if(img_frame < 5)
		img_frame++;
	else
		img_frame = 0;
		
	alarm[0] = 6;
} 
	
// Creating Footprint sounds
if(!isIdle) {
	if(isWalking) {
		if(newFootprint == false && (img_frame == 6 || img_frame == 2))
			newFootprint = true;
			
			if((place_meeting(x,y,o_lake) || place_meeting(x,y,o_pond) || place_meeting(x,y,o_pond2)) && !global.generatingEnvironment) {
				if(lastNoise < 4)
					lastNoise++;
				else
					lastNoise = irandom_range(0,1);
					
				while(isWalking && !isRunning && (lastNoise == 0 || lastNoise == 1))
					lastNoise++;
				
				switch(lastNoise) {
					case 0: audio_play_sound_on(enemy, sn_icewalk_1,0, 1); break;
					case 1: audio_play_sound_on(enemy, sn_icewalk_2,0, 1); break;
					case 2: audio_play_sound_on(enemy, sn_icewalk_3,0, 1); break;
					case 3: audio_play_sound_on(enemy, sn_icewalk_4,0, 1); break;
					case 4: audio_play_sound_on(enemy, sn_icewalk_5,0, 1); break;
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
					case 0: audio_play_sound_on(enemy, sn_snowwalk_1, 0, 1); break;
					case 1: audio_play_sound_on(enemy, sn_snowwalk_2, 0, 1); break;
					case 2: audio_play_sound_on(enemy, sn_snowwalk_3, 0, 1); break;
					case 3: audio_play_sound_on(enemy, sn_snowwalk_4, 0, 1); break;
					case 4: audio_play_sound_on(enemy, sn_snowwalk_5, 0, 1); break;
					case 5: audio_play_sound_on(enemy, sn_snowwalk_6, 0, 1); break; 
				}
				
			}
			
			if(lastGrassNoise < 3)
				lastGrassNoise++;
			else
				lastGrassNoise = 0;
			
			// Grass/Bush rustling sound
			if(place_meeting(x,y,o_grass) || place_meeting(x,y,o_cattail) || place_meeting(x,y,o_bush) || place_meeting(x,y,o_big_bush)) {
				switch(lastGrassNoise) {
					case 0: audio_play_sound_on(enemy, sn_foliage_rustle_1, 0, 1); break;
					case 1: audio_play_sound_on(enemy, sn_foliage_rustle_2, 0, 1); break;
					case 2: audio_play_sound_on(enemy, sn_foliage_rustle_3, 0, 1); break;
					case 3: audio_play_sound_on(enemy, sn_foliage_rustle_4, 0, 1); break;
				}
			}
				
	} else if(isRunning) {
		if(newFootprint == false && (img_frame == 5 || img_frame == 2))
			newFootprint = true;
			
			if((place_meeting(x,y,o_lake) || place_meeting(x,y,o_pond) || place_meeting(x,y,o_pond2)) && !global.generatingEnvironment) {
				if(lastNoise < 4)
					lastNoise++;
				else
					lastNoise = irandom_range(0,1);
					
				while(isWalking && !isRunning && (lastNoise == 0 || lastNoise == 1))
					lastNoise++;
				
				switch(lastNoise) {
					case 0: audio_play_sound_on(enemy, sn_icewalk_1,0, 1); break;
					case 1: audio_play_sound_on(enemy, sn_icewalk_2,0, 1); break;
					case 2: audio_play_sound_on(enemy, sn_icewalk_3,0, 1); break;
					case 3: audio_play_sound_on(enemy, sn_icewalk_4,0, 1); break;
					case 4: audio_play_sound_on(enemy, sn_icewalk_5,0, 1); break;
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
					case 0: audio_play_sound_on(enemy, sn_snowwalk_1, 0, 1); break;
					case 1: audio_play_sound_on(enemy, sn_snowwalk_2, 0, 1); break;
					case 2: audio_play_sound_on(enemy, sn_snowwalk_3, 0, 1); break;
					case 3: audio_play_sound_on(enemy, sn_snowwalk_4, 0, 1); break;
					case 4: audio_play_sound_on(enemy, sn_snowwalk_5, 0, 1); break;
					case 5: audio_play_sound_on(enemy, sn_snowwalk_6, 0, 1); break; 
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
					case 0: audio_play_sound_on(enemy, sn_foliage_rustle_1, 0, 1); break;
					case 1: audio_play_sound_on(enemy, sn_foliage_rustle_2, 0, 1); break;
					case 2: audio_play_sound_on(enemy, sn_foliage_rustle_3, 0, 1); break;
					case 3: audio_play_sound_on(enemy, sn_foliage_rustle_4, 0, 1); break;
				}
			}
		}
	}
}