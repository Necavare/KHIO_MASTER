//persistant
/*
if(room != r_title && room != r_display_init)
	persistent = true;
*/

dir = irandom_range(0,3);
// Clouds
cloudX = 0;
cloudY = 0;
alpha =0; 

// Snow
isSnowing = false;
fadeInClouds = false;
dir = 0;

show_debug_message("weather is made");