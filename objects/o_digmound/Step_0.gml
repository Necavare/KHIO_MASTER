if(!global.generatingEnvironment && !global.isPaused && o_weather.isSnowing && alarm[0] == -1)
	alarm[0] = room_speed * 5;
	
if(global.generatingEnvironment){
	image_alpha = 1;
}

depth = 8999;

if(!place_meeting(x,y,o_player))
	drawKick = false;