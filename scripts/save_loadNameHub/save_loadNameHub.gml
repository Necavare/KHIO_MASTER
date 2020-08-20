/// @desc save_loadFile
function save_loadNameHub() {

	// name is : "name_hub"

	//load


	if(file_exists("name_hub.dat")){
		var _wrapper = save_loadJsonFromFile("name_hub");	
		var _list = _wrapper[? "ROOT"]; //(ds_map_find_val)
	
		for(var i = 0; i < ds_list_size(_list); i++){
			var name = _list[| i];// ds_list_find_value
			ds_list_add(global.saveFileNames, name); //re add it to the list	
		}
	
		global.saveFileMax = _wrapper[? "MAX"];
	
		ds_map_destroy(_wrapper);
		show_debug_message("load names Loaded");
	}
	else{
		show_debug_message("load name failure");	
	}


}
