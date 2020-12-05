function scr_createCave_load(index_){
	
	//this script creates the room itself and sets it up in its dat astructures
	
	room_pointer = room_add();
	//ds_list_insert(global.caveList, index_, room_pointer2);
	
	ds_list_replace(global.caveList, index_, room_pointer);
	//ds_list_add(global.caveList, room_pointer); //add it to the list
	
	
	//ds_list_insert(global.caveLoadList, index_, false);
	ds_list_replace(global.caveLoadList, index_, false);
	//ds_list_add(global.caveLoadList, false);
	
	
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
	
	//if it needs to get preloaded
	//this needs to be put into the scr_Generate_cave not here!!!!
	/*
	if(ds_list_find_value(global.caveLoadList, index_)){
			save_cave_loadFile(global.currentFile+"-"+string(index_)+".dat");
	}*/
	show_debug_message("saved cave room index :: "+string(index_));
}