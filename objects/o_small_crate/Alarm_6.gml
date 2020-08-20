
	//alarm 6 debug
	show_debug_message("alarm 6 triggered");
	
	//find if their is a wall and if their is destroy one and then loot
	var hasWalls = false;
	for(var i = 0; i < instance_number(o_wall_wood); i++){
		var curWInst = instance_find(o_wall_wood, i);
		show_debug_message("wall i: "+string(i)+" with cycleID: "+string(curWInst.cycleId));
		if((point_distance(x,y,curWInst.x, curWInst.y) <= 200) && (curWInst.cycleId != -1)){
			show_debug_message("wall added with cycle: "+string(curWInst.cycleId));
			if(ds_list_find_index(surroundingWalls, curWInst) == -1)
				ds_list_add(surroundingWalls, curWInst);
			hasWalls = true;	
		}
	}
	
	//search for the doors
	for(var h = 0; h < instance_number(o_door_sides); h++){
		var curDInst = instance_find(o_door_sides, h);
		if((point_distance(x,y,curDInst.x, curDInst.y) <= 200) && (curDInst.cycleId != -1)){
			if(ds_list_find_index(surroundingWalls, curDInst) == -1)
				ds_list_add(surroundingWalls, curDInst);
		}
	}
	
	
	for(var j = 0; j < ds_list_size(surroundingWalls); j++){
		var currWInst2 = ds_list_find_value(surroundingWalls, j);
		if(ds_list_find_index(cycleList, currWInst2.cycleId) == -1){
			ds_list_add(cycleList, currWInst2.cycleId);
			show_debug_message("cycleIdAdd: "+string(currWInst2.cycleId));
		}
	}
	
alarm[6] = 60;