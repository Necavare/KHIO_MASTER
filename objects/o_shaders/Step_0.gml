
if(instance_exists(o_debugger) && o_debugger.pauseDay)
	hour_of_day = .5;
	
if(room == r_testing) {
	hour_of_day = .1;
	global.hour = (hour_of_day / (1/24));
}

if(room == r_cave) {
	hour_of_day = .15;
	global.hour = (hour_of_day / (1/24));
}

// Get key times
var time		= hour_of_day;

key_previous	= min(floor(time * number_of_key_times), number_of_key_times -1);
key_next		= (key_previous + 1) mod number_of_key_times;

// Get lerp amount
var lerp_amt	= (time - key_previous/number_of_key_times) * number_of_key_times;

// Mix colors
color_mix		=  [lerp(color[key_previous,0], color[key_next,0], lerp_amt),
					lerp(color[key_previous,1], color[key_next,1], lerp_amt),
					lerp(color[key_previous,2], color[key_next,2], lerp_amt)];
					
con_sat_brt_mix	=  [lerp(con_sat_brt[key_previous,0], con_sat_brt[key_next,0], lerp_amt),
					lerp(con_sat_brt[key_previous,1], con_sat_brt[key_next,1], lerp_amt),
					lerp(con_sat_brt[key_previous,2], con_sat_brt[key_next,2], lerp_amt),
					lerp(con_sat_brt[key_previous,3], con_sat_brt[key_next,3], lerp_amt),
					lerp(con_sat_brt[key_previous,4], con_sat_brt[key_next,4], lerp_amt)];
					
/* DEBUGGING

if(keyboard_check_direct(vk_up) && b_threshold <= 1)
	b_threshold+=.01;
if(keyboard_check_direct(vk_down) && b_threshold >= 0)
	b_threshold-=.01;
if(keyboard_check_direct(vk_right) && b_range <= 1)
	b_range+=.01;
if(keyboard_check_direct(vk_left) && b_range >= 0)
	b_range-=.01;
	
if(keyboard_check_direct(ord("O")) && b_intensity <= 1)
	b_intensity+=.01;
if(keyboard_check_direct(ord("P")) && b_intensity >= 0)
	b_intensity-=.01;
	
if(keyboard_check_direct(ord("K")) && b_darken <= 1)
	b_darken+=.01;
if(keyboard_check_direct(ord("L")) && b_darken >= 0)
	b_darken-=.01;
	
if(keyboard_check_direct(ord("N")) && b_saturation <= 1)
	b_saturation+=.01;
if(keyboard_check_direct(ord("M")) && b_saturation >= 0)
	b_saturation-=.01;
	
if(keyboard_check_direct(ord("U")) && b_blur <= 1)
	b_blur+=.01;
if(keyboard_check_direct(ord("I")) && b_blur >= 0)
	b_blur-=.01;
	
if(keyboard_check_direct(ord("H")) && b_sigma <= 1)
	b_sigma+=.01;
if(keyboard_check_direct(ord("J")) && b_sigma >= 0)
	b_sigma-=.01;
	
	
show_debug_message("------------------------------");
show_debug_message("THRESHOLD: " + string(b_threshold));
show_debug_message("RANGE: " + string(b_range));
show_debug_message("INTENSITY: " + string(b_intensity));
show_debug_message("DARKEN: " + string(b_darken));
show_debug_message("SATURATION: " + string(b_saturation));
show_debug_message("BLUR: " + string(b_blur));
show_debug_message("SIGMA: " + string(b_sigma));
show_debug_message("------------------------------");*/