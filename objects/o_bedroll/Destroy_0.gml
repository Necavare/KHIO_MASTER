if(!global.generatingEnvironment){
	ds_map_delete(global.minimapVar, id); //remove it from the array of all minimap variables
	//remove it from the active array
	if(ds_list_find_index(global.activemm,id)){//if it is registered active
		var pos = ds_list_find_index(global.activemm, id); //find pos
		ds_list_delete(global.activemm, pos); //remove it from the list
	}
	//refresh update array
	if(!global.generatingEnvironment){
		//scr_refresh_update(x+global.xoffset,y+global.yoffset);	
	}
}