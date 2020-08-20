/// draw_all_instances_mm(ds_list, x_off, y_off, xp, yp, xscale, yscale, alpha)
/// @description draw_all_instances_mm(ds_list, x_off, y_off, xp, yp, xscale, yscale, alpha)
/// @param ds_list
/// @param x_off
/// @param y_off
/// @param xp
/// @param yp
/// @param xscale
/// @param yscale
/// @param alpha
function draw_all_instances_offset_mm(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	//for every id in the list
	for(var k=0; k<ds_list_size(argument0); k++){
		draw_instance_offset_mm(ds_list_find_value(argument0,k), argument1, argument2, 
		argument3, argument4, argument5, argument6, argument7);
	}
	/*
	if(global.bigLakePointer != -1){
		draw_instance_offset_mm(global.bigLakePointer, argument1, argument2, argument3, argument4, 
		argument5, argument6, argument7);
	}*/


}
