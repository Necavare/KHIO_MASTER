_filename = global.currentFile;
loadingLayerId = layer_get_id("LoadingLayer");
activeQueue = ds_queue_create();
generatorWallAngle  = 0;

numAdded = 0;
if(file_exists(_filename+".dat")){
	_wrapper = save_loadJsonFromFile(_filename);	
	_list = _wrapper[? "ROOT"]; //(ds_map_find_val)
	
	ground = layer_get_id("Ground");
	
	listSize = ds_list_size(_list);
	
	i = 0;
}
else{ //if file_exists fails
	show_error("file: "+_filename+" does not exist or cannot be found", false);
}

futurePlayerX = 0;
futurePlayerY = 0;

blockI =0;
//objStack = ds_stack_create();