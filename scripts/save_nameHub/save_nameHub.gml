/// @desc save_createNameHub
function save_nameHub() {

	//SAVED UNDER NAME
	//   name_hub


	//******************************************************
	//other objects need to also be added down here \/\/\/\/
	//******************************************************

	//wrap root List in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", global.saveFileNames);
	ds_map_add(_wrapper, "MAX", global.saveFileMax);

	//save all of this to a string
	var _string = json_encode(_wrapper);
	save_StringToFile("name_hub", _string); //saved file name with the string of data

	//nuke data
	//ds_map_destroy(_wrapper);

	show_debug_message("load names saved");


}
