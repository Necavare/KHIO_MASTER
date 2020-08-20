/// draw_all_instances_mm(ds list, xp, yp, xscale, yscale, alpha)
/// @description draw_all_instances_mm(ds list, xp, yp, xscale, yscale, alpha)
/// @param ds list
/// @param xp
/// @param yp
/// @param xscale
/// @param yscale
/// @param alpha
function draw_all_instances_mm(argument0, argument1, argument2, argument3, argument4, argument5) {

	//for every id in the list
	for(var k=0; k<ds_list_size(argument0); k++){
		draw_instance_mm(ds_list_find_value(argument0,k), argument1, argument2, argument3, argument4, argument5);
	}


}
