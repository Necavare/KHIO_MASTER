function scr_createCave_new(){
	
	//this script creates the room itself and sets it up in its dat astructures
	
	room_pointer = room_add();
	ds_list_add(global.caveList, room_pointer); //add it to the list
	ds_list_add(global.caveLoadList, false);
	
	var listIndex = ds_list_find_index(global.caveList, room_pointer);
	
	room_set_width(room_pointer, 5000);//set width
	room_set_height(room_pointer, 5000);//set height
	room_set_background_color(room_pointer, $333128, true)
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
	
	return listIndex;
}