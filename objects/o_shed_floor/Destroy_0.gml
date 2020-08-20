if(instance_exists(instRoof))
	instance_destroy(instRoof);
	
if(instance_exists(shedPointer))
	instance_destroy(shedPointer);
/*
un necessary since it doesnt have a minimap symbol

//since it only adds if its generating, you dont need to remove
if(!global.generatingEnvironment){ 
	ds_map_delete(global.minimapVar, id); //remove it from the array of all minimap variables
	//remove it from the active array
	if(ds_list_find_index(global.activemm,id)){//if it is registered active
		var pos = ds_list_find_index(global.activemm, id); //find pos
		ds_list_delete(global.activemm, pos); //remove it from the list
	}
	//refresh update array
	if(!global.generatingEnvironment){
		scr_refresh_update(x+global.xoffset,y+global.yoffset);	
	}
}*/
//since it only adds if its generating, you dont need to remove
if(!global.generatingEnvironment || global.loading){ 
	ds_map_delete(global.minimapVar, id); //remove it from the array of all minimap variables
	//remove it from the active array
	if(ds_list_find_index(global.activemm,id)){//if it is registered active
		var pos = ds_list_find_index(global.activemm, id); //find pos
		ds_list_delete(global.activemm, pos); //remove it from the list
	}
	//refresh update array
	if(!global.generatingEnvironment && !global.generatingGrass){
		//scr_refresh_update(x+global.xoffset,y+global.yoffset);	
	}
}