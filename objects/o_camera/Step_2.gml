//if(room == r_new){

if(roomShiftDelay)
	roomShift = true;
else
	roomShift = false;

if (point_distance(o_player.x, o_player.y, room_center_x, room_center_y) >= (room_height/2)-400 && !global.generatingEnvironment){
	//roomShift = true;
	roomShiftDelay = true;
	global.drawLoad = true;
}

//}
/*
else
	roomShift = false;