if(listIndex != -1){
	if(ds_list_find_value(global.caveLoadList, true)){
		room_instance_clear(ds_list_find_value(global.caveList, listIndex));
		room_set_persistent(ds_list_find_value(global.caveList, listIndex), false);
	}
	ds_list_set(global.caveList, listIndex, false);
}