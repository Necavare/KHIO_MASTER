///@description Fading world in and out
if(fadeOutWorld){
	global.alpha-=.03;
	if(global.alpha < 0)
		global.alpha = 0;
}
else{
	global.alpha+=.03;
	if(global.alpha > 2)
		global.alpha = 2;
}
alarm[2] = 1;