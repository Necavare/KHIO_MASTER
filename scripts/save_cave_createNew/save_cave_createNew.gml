/// @desc save_cave_createNew(filename)
/// @arg filename
/// @arg index
function save_cave_createNew(argument0, argument1) {
	var _filename = argument0; //<-file name for master
	var _index = argument1; //<- index of cave

	//check if its valid
	if(ds_list_find_index(global.caveInstanceIndexVal, _index) != -1){

	//create a root list
	//var _root_list = ds_list_create(); <-created already here


	//**********************************************
	//-----------------
	//    type key
	//----------------
	// 0 = global/nonglobal initilizer variables 
	// 1 = basic objects ("par_3d_obj", trees, boxes, animals etc.)
	// 2 = markers 
	// 3 = o_hud stuff, minimap blocks, marker library, inventory etc.
	// 4 = player
	//**********************************************

	//for every instance, create a map



	//instance_activate_all();
	var numAdded = 0;


	//******************************************
	//ADD THINGS HERE !!!!!!!!!!!!!!!!!!!!!!!!!!
	//******************************************
	//theirs already a root list we created with the caves!
	var _root_list  = ds_list_find_value(global.caveInstances, ds_list_find_index(global.caveInstanceIndexVal, _index));

	if(_root_list == undefined)
		show_debug_message("undefined root_list");
		
	//wrap root List in a map
	var _wrapper = ds_map_create();
	ds_map_add_list(_wrapper, "ROOT", _root_list);

	//save all of this to a string
	var _string = json_encode(_wrapper);
	save_StringToFile(_filename+"-"+string(_index), _string); //saved file name with the string of data

	//nuke data
	ds_list_destroy(_root_list);
	ds_map_destroy(_wrapper);

	show_debug_message("cave saved index :: "+string(_index));

	}

}
