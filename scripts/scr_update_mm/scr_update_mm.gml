/// scr_update_mm(block_array, update_list_array, total_width, total_height)
/// @description scr_update_mm(block_array, update_list_array, total_width, total_height)
/// @param block_array
/// @param update_list_array
/// @param total_width
/// @param total_height
function scr_update_mm(argument0, argument1, argument2, argument3) {

	//********************************************************************
	// this function will update the minimap by redrawing necessary blocks
	//********************************************************************



	var blockArr = argument0;
	var updateArr = argument1;
	var width = argument2;
	var height= argument3;

	//for every element that need to be updated
	for(var i = 0; i < array_length_1d(updateArr); i++){
		//find the bx and by from iv
		//if their is an update at this i
		//bx 0 is  i(0,1,2,3,4)
		//bx 1 is  i(5,6,7,8,9)
		//bx 2 is  i(10,11,12,13,14)
		//bx 3 is  i(15,16,17,18,19)
		//bx 4 is  i(20,21,22,23,24)
		if(updateArr[i]){
		
			//************************
			//      normal loop
			//************************
			var iv = 0;
			//find the bx and by values from the i value
			var bx = 0;
			var by = 0;
			for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
				for(var by2 = 0; by2 < global.blockYNum; by2++){
					if(iv == i){
						bx = bx2;
						by = by2;
					}
				
					//draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
					iv++;
				}
			}
		
			/*
			if(i<5){//bx 0
				bx = 0;
				by = i;
			}
			if(i>4&&i<10){//bx 1
				bx = 1;
				by = i-5;
			}
			else if(i>9&&i<15){//bx 2
				bx = 2;
				by = i-10;
			}
			else if(i>14&&i<20){//bx 3
				bx = 3;
				by = i-15;
			}
			else if(i>19){//bx 4
				bx = 4;
				by = i-20;
			}*/
		
			show_debug_message("----------scr_update_mm--------------");
			show_debug_message("i: "+string(i));
			show_debug_message("bx: "+string(bx));
			show_debug_message("by: "+string(by));
			show_debug_message("-------------------------------------");
			sprite_delete(blockArr[@ i]);
			blockArr[@ i] = scr_create_map_block(bx, by, width, height);
		
			//set the history to true
		
			//var blockSpr = scr_create_map_block(bx, by, width, height);
			//global.blockArr[@ i] = blockSpr;
		} 
	}
	scr_clear_update(updateArr); // clean out the update array


}
