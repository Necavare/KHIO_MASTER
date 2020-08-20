///@description Bleeding
if(isBleeding && !isDead) {
	if(!global.isPaused) {
		health_ -= 1;
	
		if(!o_player.healthKick) {
			o_player.healthKick = true;
		}
	
		if(!global.isPaused)
			audio_play_sound(sn_bleed, 1, 0);
	
		repeat(10) {
			var tick = instance_create_depth(x+irandom_range(-4, 4),y+irandom_range(-4, 4),depth-1,o_blood);
			if(isSitting)
				tick.z = irandom_range(0, 5);
			else
				tick.z = irandom_range(0, 15);
			
			tick.image_angle = point_direction(0,0, xdir, ydir);
			tick.depth = depth - 1;
		}
	
		timeBled++;
		if(timeBled >= choose(9,10,11,12,13,14)){
			isBleeding = false;
			timeBled = 0;	
		}
	}
	alarm[4] = 60;

}