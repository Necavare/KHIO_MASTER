/// scr_find_chunk(x_real, y_real)
/// @description scr_find_chunk(x_real, y_real)
/// @param x_real
/// @param y_Real
function scr_find_chunk(argument0, argument1) {

	//*************************************************************************************
	// this function will take in an x and y value and find the chunk they are in
	//*************************************************************************************

	var xR = argument0+global.xoffset;
	var yR = argument1+global.yoffset;
	var blockWidthR = room_width/global.blockXNum;
	var blockHeightR = room_height/global.blockYNum;

	//find their old positions by going backwards with offset
	if (yR < 0) { yR += room_height; }
	if (yR >= room_height) { yR -= room_height; }
	if (xR < 0) { xR += room_width; }
	if (xR >= room_width) { xR -= room_width; }

	/*
	show_debug_message("----------------------------------------");
	show_debug_message("     xR: "+string(xR));
	show_debug_message("     yR: "+string(yR));
	show_debug_message("	 finding chunk");
	show_debug_message("----------------------------------------");
	*/

	//************************
	//      normal loop
	//************************
	var iv = 0;
	//find the bx and by values from the i value

	for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
		for(var by2 = 0; by2 < global.blockYNum; by2++){
			if((xR < (blockWidthR*(bx2+1)))&&(xR >= (blockWidthR*(bx2+1))-blockWidthR)){
				if((yR < (blockHeightR*(by2+1))) && (yR >= (blockHeightR*(by2+1))-blockHeightR)){
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
			return 0;
		}//by 0
		if(yR < blockHeightR*2){
			return 1;
		}//by 1
		if(yR < blockHeightR*3){
			return 2;
		}//by 2
		if(yR < blockHeightR*4){
			return 3;
		}//by 3
		if(yR < blockHeightR*5){
			return 4;
		}//by 4
	}


	//bx 1
	if(xR < blockWidthR*2){
		if(yR < blockHeightR){
			return 5;
		}//by 0
		if(yR < blockHeightR*2){
			return 6;
		}//by 1
		if(yR < blockHeightR*3){
			return 7;
		}//by 2
		if(yR < blockHeightR*4){
			return 8;
		}//by 3
		if(yR < blockHeightR*5){
			return 9;
		}//by 4
	}

	//bx 2
	if(xR < blockWidthR*3){
		if(yR < blockHeightR){
			return 10;
		}//by 0
		if(yR < blockHeightR*2){
			return 11;
		}//by 1
		if(yR < blockHeightR*3){
			return 12;
		}//by 2
		if(yR < blockHeightR*4){
			return 13;
		}//by 3
		if(yR < blockHeightR*5){
			return 14;
		}//by 4
	}

	//bx 3
	if(xR < blockWidthR*4){
		if(yR < blockHeightR){
			return 15;
		}//by 0
		if(yR < blockHeightR*2){
			return 16;
		}//by 1
		if(yR < blockHeightR*3){
			return 17;
		}//by 2
		if(yR < blockHeightR*4){
			return 18;
		}//by 3
		if(yR < blockHeightR*5){
			return 19;
		}//by 4
	}

	//bx 4
	if(xR < blockWidthR*5){
		if(yR < blockHeightR){
			return 20;
		}//by 0
		if(yR < blockHeightR*2){
			return 21;
		}//by 1
		if(yR < blockHeightR*3){
			return 22;
		}//by 2
		if(yR < blockHeightR*4){
			return 23;
		}//by 3
		if(yR < blockHeightR*5){
			return 24;
		}//by 4
	}*/


}
