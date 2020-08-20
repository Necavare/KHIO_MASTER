//if(instance_exists(housePointer))
/*
with(housePointer){
	//if(instance_exists(instDoor)){
		instance_destroy(instDoor);
	//}
	//if(instance_exists(instBack)){
		instance_destroy(instBack);
	//}
	//if(instance_exists(instFloor)){
		instance_destroy(instFloor);
	//}
	//if(instance_exists(instRoof)){
		instance_destroy(instRoof);
	//}
	//if(instance_exists(instSideL)){
		instance_destroy(instSideL);
	//}
	//if(instance_exists(instSideR)){
		instance_destroy(instSideR);
	//}
}*/


//show_debug_message("destroy floor house");
instance_destroy(housePointer);
//if(instance_exists(instRoof.id))
instance_destroy(roofPointer);
//instance_destroy(instRoof);
//instance_destroy(doorPointer);
instance_destroy(backPointer);
instance_destroy(sideLPointer);
instance_destroy(sideRPointer);

if(roofPointer == pointer_null || doorPointer == pointer_null || backPointer == pointer_null ||
	sideLPointer == pointer_null || sideRPointer == pointer_null){
	//show_debug_message("they are null pointers");		
}



//since it only adds if its generating, you dont need to remove
if(!global.generatingEnvironment){ 
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