/// @description Animation framerates/sounds
audio_emitter_position(enemy, x, y, 0);
if(isIdle && !playerInRange && !isAttacking) { // Idle framerate
	if(!isStunned && !isStumbled){
		if(img_frame < 3)
			img_frame++;
		else
			img_frame = 0;
	}
	else{
		if(img_frame < 12)
			img_frame++;
		else{
			img_frame = 0;
			isStunned = false;
			if(isStumbled)
				wasStumbled = true;
			isStumbled = false;
			parried = false;
		}
	}
	if(isStumbled)
		alarm[0] = 2;
	else if(isStunned)
		alarm[0] = 5;
	else
		alarm[0] = 8;
} else if((playerInRange && !playerFlee) || isAttacking){
	
	/*
	if(delayAttack){
		alarm[0] = 8;
		delayAttack = false;
	}else{*/
		if(heavyAttack){
			if(img_frame < 	11)
				img_frame++;
			else{
				if(wasStumbled)
					wasStumbled = false;
				img_frame = 0;
				hasSwung = false;	
				heavyAttack = false;
			}
			alarm[0] = 8;
			
			/*
			//show_debug_message("heavy attack frames: "+string(img_frame));
			if(img_frame < 7)
				img_frame++;
			else{
				img_frame = 0;
				hasSwung = false;
				heavyAttack = false;
			}
			if(img_frame == 1 || img_frame == 2){
				alarm[0] =24;
				//show_debug_message("here");
			}
			else
				alarm[0] = 8;*/
		}else{
			if(img_frame < 	9)
				img_frame++;
			else{
				img_frame = 0;
				if(wasStumbled)
					wasStumbled = false;
				hasSwung = false;
				heavyAttack = false;
				//random chance next will be heavy
				//if(irandom(99)<10){
					heavyAttack = true;	
				//}
			}
			alarm[0] = 8;
		}
		if(img_frame == 0){
			isAttacking = false;
			canParry = false;	
		}
		if(instance_exists(o_tool)){
			if((img_frame == 2) && !o_tool.isBlocking)
				canParry = true;
		}
		if(img_frame == 0 || img_frame > 5)
			canParry = false;	
		show_debug_message("can parry: "+string(canParry));
	//}
}else if(isWalking) { // Walking framerate
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