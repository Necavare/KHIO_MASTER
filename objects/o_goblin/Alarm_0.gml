if(mode == 0) {
	if(sprite_index == s_goblin_idle_1)
		sprite_index = s_goblin_idle_2;
	else if(sprite_index == s_goblin_idle_2)
		sprite_index = s_goblin_idle_1;
	else
		sprite_index = s_goblin_idle_1;
		
	alarm[0] = 15;
} else {
	/*if(sprite_index == s_goblin_run_1) {
		sprite_index = s_goblin_run_2;
		alarm[0] = 10;
	} else*/
	
	if(anim == 0) {
		if(sprite_index == s_goblin_run_2) {
			sprite_index = s_goblin_run_3;
			alarm[0] = 15;
			
			anim = 1;
		} else if(sprite_index == s_goblin_run_3) {
			sprite_index = s_goblin_run_2;	
			alarm[0] = 10;
			anim = 1;
		} else {
			sprite_index = s_goblin_run_3;
			alarm[0] = 15;
		}
	} else {
		if(sprite_index == s_goblin_run_2m) {
			sprite_index = s_goblin_run_3m;
			alarm[0] = 15;
			
			anim = 0;
		} else if(sprite_index == s_goblin_run_3m) {
			sprite_index = s_goblin_run_2m;	
			alarm[0] = 10;
			anim = 0;
		} else {
			sprite_index = s_goblin_run_3m;
			alarm[0] = 15;
		}
	}
		
}



