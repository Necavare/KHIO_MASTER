if(collision_circle(x,y,125, o_player, true, true)) {
	mode = irandom_range(1,2);
	alarm[1] = 120;
	sprite_index = s_goblin_run_3;
} else
	mode = 0;
	
