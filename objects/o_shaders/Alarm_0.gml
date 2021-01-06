if(room != r_title) {
	if(minute_target == -1) {
		if(minute_of_day < 1440) {
			minute_of_day++;
		} else {
			minute_of_day = 0;
			global.days++;
			global.noSleep++;
		}
		
		if(global.isDev)
			alarm[0] = 30;
		else
			alarm[0] = 30;
	} else if(o_player.isSleeping) { // JUST USED FOR SLEEPING
		
		global.noSleep = 0;
	
		if(minute_of_day > 1140 || o_shaders.minute_of_day < 480) {
			if(minute_of_day < 1440) {
				minute_of_day+=5;
			} else {
				minute_of_day = 0;
				global.days++;
			}
		} else {
			minute_target = -1;
			if(o_player.isSleeping) {
				o_player.isSleeping = false;
			}
		}
	
		alarm[0] = 1;
	} else if(minute_target != -1) {
		if(minute_of_day < minute_target && minute_of_day < 1440) {
			minute_of_day++;
		} else if(minute_of_day > 1440) {
			minute_of_day = 0;
			global.days++;
		} else if(minute_of_day >= minute_target) {
			minute_target = -1;
		}
		
		alarm[0] = 1;
	}
} else {
	minute_of_day = 1050;
}

	hour_of_day = minute_of_day / 1440;

	global.hour = (hour_of_day / (1/24));
	global.minute = minute_of_day;

	// Changing temperature
	if(alarm[1] == -1)
		alarm[1] = 60;
	
	// Snowing
	if(alarm[3] == -1 && irandom_range(0,1200) == 0 && room != r_title)
		alarm[3] = 60;

// Changing players stats when not sleeping and not paused
if(!o_player.isSleeping && !global.isPaused) {
	if(!o_player.isRunning) { // Hunger
		if(o_player.isInjured) {
			o_player.hunger_ -= 2/30; // Lose 2 hunger per hour when injured
		} else {	
			o_player.hunger_ -= 1/30; // Lose 2 hunger per hour
		}
		
	} else if(!o_player.isSitting) {
		o_player.hunger_ -= 2/30; // Lose 2 hunger per hour when not sitting
	} else if(o_player.isSitting) {
		o_player.hunger_ -= 1/30; // Lose 1 hunger per hour when sitting
	}

	if(o_player.hunger_ <= 0)
		o_player.hunger_ = 0;

	// Health
	if(o_player.health_ > 0) {
		if(o_player.isCold && !o_player.slightlyWarm) {
			o_player.health_ -= 5/30; // Lose 5 health per hour when cold
		} else if(o_player.isCold && o_player.slightlyWarm) {
			o_player.health_ -= 2/30; // Lose 2 health per hour when cold and holding torch/lantern
		}
		
		if(o_player.hunger_ <= 0) {
			o_player.health_ -= 1/30; // Lose 1 health per hour when hunger is empty
		}

		if(o_player.isInjured && o_player.isRunning) {
			if(!o_player.healthKick) {
				o_player.healthKick = true;
			}
			o_player.health_ -= 1/30; // Lose 1 health per hour when running with broken leg
		}
	}
}

if(hour_of_day <= .1) {
	if((global.noSleep >= 2 && irandom(200) == 0) || (global.noSleep < 2 && irandom(750) == 0))
		instance_create_layer(o_player.x+irandom_range(-350,350), o_player.y+irandom_range(-350,350), "items", o_bat); 	
}