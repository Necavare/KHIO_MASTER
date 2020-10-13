// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createCave_new(){
	room_pointer = room_add();
	ds_list_add(global.caveList, room_pointer); //add it to the list
	ds_list_add(global.caveLoadList, false);
	
	var listIndex = ds_list_find_index(global.caveList, room_pointer);
	
	room_set_width(room_pointer, 5000);//set width
	room_set_height(room_pointer, 5000);//set height
	room_set_persistent(room_pointer, true); //makes all instances saved within the room, SLOW
	
	//create layers:
	//items
	layer_create(0, "items");
	//main
	layer_create(1, "Main");
	//player
	layer_create(2, "Player");
	//ground
	layer_create(3, "Ground");
	
	room_instance_add(room_pointer, 2250, 2250, o_cavefloor);//add floor
	room_instance_add(room_pointer, 2250, 2500, o_cavefloor);
	room_instance_add(room_pointer, 2500, 2250, o_cavefloor);
	room_instance_add(room_pointer, 2500, 2500, o_cavefloor);
	room_instance_add(room_pointer, 2250, 2500, o_cave_exit);//add exit
	
	return listIndex;
}