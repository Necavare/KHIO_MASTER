/// scr_clipping_primary (instance, copy)
/// @description scr_clipping_primary(instance, copy)
/// @param instance
/// @param copyBool
function scr_clipping_priority(argument0, argument1) {


	//destroys any instance that the called instance is currently in contact with (marked as solid)
	var inst= argument0;
	var copy = argument1;



	with (inst) {
	
		//keep it out of the key area
		if(point_distance(x,y,global.keyx, global.keyy) < 35)
			instance_destroy(self);
		if(collision_point(global.keyx, global.keyy, self, false, true))
			instance_destroy(self);
	
		//check if theirs any solid objects (or if syour a special boy) 99
		if(!place_free(x,y)){ 	
			var list = ds_list_create();
			var num = instance_place_list(x, y, all , list, false);
		
			for (var i = 0; i < num; i++){
				if(instance_exists(list[| i])&&!list[| i].object_index == o_lake){
					instance_destroy(list[| i]);
				}
			}
	
			ds_list_destroy(list);
		}
	}


}
