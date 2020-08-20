/// scr_refresh_update_mm(x_real, y_real)
/// @description scr_refresh_update_mm(x_real, y_real)
/// @param x_real
/// @param y_Real
function scr_refresh_update(argument0, argument1) {

	//*************************************************************************************
	// this function will take in an x and y value and change the update list to what will 
	// need to be updated due to a change at those x and y coordinates
	//*************************************************************************************

	//depending on the x and y position set the correct i element in the update list to true
	var listArr = global.blockUpdateArr;
	var xR = argument0;
	var yR = argument1;
	var blockWidthR = room_width/global.blockXNum;
	var blockHeightR = room_height/global.blockYNum;
	global.minimapUpdated = true; // becuase something therefore has changed


	xR+=global.xoffset;
	yR+=global.yoffset;
	//find their old positions by going backwards with offset
	if (yR < 0) { yR += room_height; }
	if (yR >= room_height) { yR -= room_height; }
	if (xR < 0) { xR += room_width; }
	if (xR >= room_width) { xR -= room_width; }

	show_debug_message("----------------------------------------");
	show_debug_message("     xR+offset: "+string(xR));
	show_debug_message("     yR+offset: "+string(yR));
	show_debug_message("refreshing update list");
	show_debug_message("----------------------------------------");


	//************************
	//      normal loop
	//************************
	var iv = 0;
	//find the bx and by values from the i value
	for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
		for(var by2 = 0; by2 < global.blockYNum; by2++){
			if((xR < (blockWidthR*(bx2+1)))&&(xR >= (blockWidthR*(bx2+1))-blockWidthR)){
				if((yR < (blockHeightR*(by2+1))) && (yR >= (blockHeightR*(by2+1))-blockHeightR)){
					ds_list_set(global.blockUpdateHistory, iv, true);
					listArr[@ iv] = true;
					return iv;
				}
			}
			//draw_sprite(global.blockArr[iv], 0 , bx*(blockWidthmm), by*(blockHeightmm));
			iv++;
		}
	}

	/*
	//bx 0
	if(xR < blockWidthR){
		if(yR < blockHeightR){
			listArr[@ 0] = true;
			return 0;
		}//by 0
		if(yR < blockHeightR*2){
			listArr[@ 1] = true;
			return 1;
		}//by 1
		if(yR < blockHeightR*3){
			listArr[@ 2] = true;
			return 2;
		}//by 2
		if(yR < blockHeightR*4){
			listArr[@ 3] = true;
			return 3;
		}//by 3
		if(yR < blockHeightR*5){
			listArr[@ 4] = true;
			return 4;
		}//by 4
	}


	//bx 1
	if(xR < blockWidthR*2){
		if(yR < blockHeightR){
			listArr[@ 5] = true;
			return 5;
		}//by 0
		if(yR < blockHeightR*2){
			listArr[@ 6] = true;
			return 6;
		}//by 1
		if(yR < blockHeightR*3){
			listArr[@ 7] = true;
			return 7;
		}//by 2
		if(yR < blockHeightR*4){
			listArr[@ 8] = true;
			return 8;
		}//by 3
		if(yR < blockHeightR*5){
			listArr[@ 9] = true;
			return 9;
		}//by 4
	}

	//bx 2
	if(xR < blockWidthR*3){
		if(yR < blockHeightR){
			listArr[@ 10] = true;
			return 10;
		}//by 0
		if(yR < blockHeightR*2){
			listArr[@ 11] = true;
			return 11;
		}//by 1
		if(yR < blockHeightR*3){
			listArr[@ 12] = true;
			return 12;
		}//by 2
		if(yR < blockHeightR*4){
			listArr[@ 13] = true;
			return 13;
		}//by 3
		if(yR < blockHeightR*5){
			listArr[@ 14] = true;
			return 14;
		}//by 4
	}

	//bx 3
	if(xR < blockWidthR*4){
		if(yR < blockHeightR){
			listArr[@ 15] = true;
			return 15;
		}//by 0
		if(yR < blockHeightR*2){
			listArr[@ 16] = true;
			return 16;
		}//by 1
		if(yR < blockHeightR*3){
			listArr[@ 17] = true;
			return 17;
		}//by 2
		if(yR < blockHeightR*4){
			listArr[@ 18] = true;
			return 18;
		}//by 3
		if(yR < blockHeightR*5){
			listArr[@ 19] = true;
			return 19;
		}//by 4
	}

	//bx 4
	if(xR < blockWidthR*5){
		if(yR < blockHeightR){
			listArr[@ 20] = true;
			return 20;
		}//by 0
		if(yR < blockHeightR*2){
			listArr[@ 21] = true;
			return 21;
		}//by 1
		if(yR < blockHeightR*3){
			listArr[@ 22] = true;
			return 22;
		}//by 2
		if(yR < blockHeightR*4){
			listArr[@ 23] = true;
			return 23;
		}//by 3
		if(yR < blockHeightR*5){
			listArr[@ 24] = true;
			return 24;
		}//by 4
	}


/* end scr_refresh_update */
}
