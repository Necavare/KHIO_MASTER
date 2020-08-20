/// @desc save_nuke
function save_nuke() {
	show_debug_message("nuking files");
	global.saveFileNames = ds_list_create();

	save_loadNameHub();
	//delete all normal files and overhead sprites
	for(var i =0; i <ds_list_size(global.saveFileNames); i++){
		file_delete(ds_list_find_value(global.saveFileNames, i)+".dat");
		file_delete(ds_list_find_value(global.saveFileNames, i)+"-os.png");
	
		//"-os.png" <-overhead
	}

	//delete settings file
	file_delete("settings_hub.dat");
	//delete name library
	file_delete("name_hub.dat");

	//clear out name list
	ds_list_destroy(global.saveFileNames);


}
