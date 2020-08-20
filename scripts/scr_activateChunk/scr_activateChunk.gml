/// scr_activateChunk(x,y)
/// @description scr_activateChunk(x,y) activates all objects in that chunk
/// @param x
/// @param y
function scr_activateChunk(argument0, argument1) {

	var xA = argument0;
	var yA = argument1;

	var listInst = ds_grid_get(global.smallChunkGrid, xA, yA);

	var sizeList = ds_list_size(listInst);

	for(var  listI = 0; listI < sizeList; listI++){
		instance_activate_object(ds_list_find_value(listInst, listI));	
	}




}
