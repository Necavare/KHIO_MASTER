//if(room == r_new){

if(roomShiftDelay)
	roomShift = true;
else
	roomShift = false;

if (point_distance(o_player.x, o_player.y, room_center_x, room_center_y) >= (room_height/2)-400 
		&& !global.generatingEnvironment){
	show_debug_message("player x : "+string(o_player.x) + "player y : " +string(o_player.y));
	show_debug_message("room center x : "+string(room_center_x)+"room center y: "+string(room_center_y));
	show_debug_message("room shift delay set true");
	//roomShift = true;
	roomShiftDelay = true;
	global.drawLoad = true;
}

//}
/*
else
	roomShift = false;