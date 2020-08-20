/// scr_cycleCheck(objList)
/// @description scr_cycleCheck(objList) returns -1 if no cycle, and cycle id otherwise
/// @param objList
function scr_cycleCheck(argument0) {

	var objList = argument0;
	var connectedList = ds_list_create();
	var isCycle = false;
	ds_list_copy(connectedList, objList);
	//var selfInst = argument1;

	for(var objI = 0; objI < ds_list_size(objList); objI++){
		var objIadj = ds_list_find_value(objList, objI).adjacency_list;
		for(var objI2 = 0; objI2 < ds_list_size(objIadj); objI2++){
			if(ds_list_find_index(connectedList, ds_list_find_value(objIadj, objI2)) == -1)
				ds_list_add(connectedList, ds_list_find_value(objIadj, objI2));
			else 
				isCycle = true;
		}
	}

	//loop through the connected list and set the cycle value
	if(isCycle){
		global.wallCycleIndex++;
		var cycleIdV = global.wallCycleIndex;
		for(var conI = 0; conI < ds_list_size(connectedList); conI++){
			var conInst = ds_list_find_value(connectedList, conI);
			conInst.cycleId = cycleIdV;	
		}
		return cycleIdV;
	}
	else
		return -1;

	//find if 


}
