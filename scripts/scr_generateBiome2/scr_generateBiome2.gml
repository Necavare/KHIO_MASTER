/// scr_generateBiome1(array, arrayX, arrayY, type (int))
/// @description generating biome
/// @param array
/// @param arrayX
/// @param arrayY
/// @param biomeType
function scr_generateBiome2(argument0, argument1, argument2, argument3, argument4) {
	var odds = argument4; //the current odds of continuing outwards
	if(odds<=0)
		return; //just exit, it wont ever succeed

	//determining what type of biome it is
	var array = argument0;
	var arrayX = argument1;
	var arrayY = argument2;
	var type = argument3;

	var arrayLength = array_length_2d(array, 0)-1;
	var arrayHeight = array_height_2d(array)-1;

	//show_debug_message("arrayX: "+string(arrayX) + "|| arrayL: "+string(arrayLength));
	//show_debug_message("arrayY: "+string(arrayY) + "|| arrayH: "+string(arrayHeight));

	//check if its out of bounds of room and set it to in boands
	if(arrayX < 0){arrayX = arrayLength+arrayX;} //if its smaller: wrap
	else if(arrayX > arrayLength){arrayX = arrayX-arrayLength;} //if its larger: wrap
	if(arrayY < 0){arrayY = arrayHeight+arrayY;} //if its smaller: wrap
	else if(arrayY > arrayHeight){arrayY = arrayY-arrayHeight;}

	//odds of going in a certain direction (calculated here for effeceincy)
	var oddsU = irandom(odds)//up
	var oddsUL = irandom(odds)//up+left
	var oddsUR = irandom(odds)//up+right
	var oddsL = irandom(odds)//left
	var oddsR = irandom(odds)//right
	var oddsD = irandom(odds)//down
	var oddsDL = irandom(odds)//down+left
	var oddsDR = irandom(odds)//down+right

	//find bottom and top left corners
	//find top left x
	var topLeftX = arrayX-1;
	if(topLeftX < 0){topLeftX = arrayLength+topLeftX;} //if its smaller: wrap
	else if(topLeftX > arrayLength){topLeftX = topLeftX-arrayLength;} //if its larger: wrap
	
	//find top left y
	var topLeftY = arrayY-1;
	if(topLeftY < 0){topLeftY = arrayHeight+topLeftY;} //if its smaller: wrap
	else if(topLeftY > arrayHeight){topLeftY = topLeftY-arrayHeight;}
	
	//find top right x (requires previous definitions)
	var topRightX = arrayX+1;
	if(topRightX < 0){topRightX = arrayLength+topRightX;} //if its smaller: wrap
	else if(topRightX > arrayLength){topRightX = topRightX-arrayLength;} //if its larger: wrap
	
	//find bottom left y (requires previous definitions)
	var bottomLeftY = arrayY+1;
	if(bottomLeftY < 0){bottomLeftY = arrayHeight+bottomLeftY;} //if its smaller: wrap
	else if(bottomLeftY > arrayHeight){bottomLeftY = bottomLeftY-arrayHeight;}




	//show_debug_message("arrayX: "+string(arrayX)+"arrayY: "+string(arrayY)+"odds: "+string(odds));



	//actually calculating the wrapped new array values based on above odds
	if(oddsU>0 && array[arrayX, topLeftY]!=type){//up
	  biome_create_wrap2(array, arrayX, arrayY-1, type);
	  scr_generateBiome2(array, arrayX, arrayY-1, type, odds-5);
	}
	if(oddsD>0 && array[arrayX, bottomLeftY]!=type){//down
		biome_create_wrap2(array, arrayX, arrayY+1, type);
		scr_generateBiome2(array, arrayX, arrayY+1, type, odds-5);
	}
	if(oddsL>0 && array[topLeftX, arrayY]!=type) {//left
	  biome_create_wrap2(array, arrayX-1, arrayY, type);
	  scr_generateBiome2(array, arrayX-1, arrayY, type, odds-5);
	}
	if(oddsR>0 && array[topRightX, arrayY]!=type){//right
		biome_create_wrap2(array, arrayX+1, arrayY, type);
		scr_generateBiome2(array, arrayX+1, arrayY, type, odds-5);
	}


	if(oddsUL>0 && array[topLeftX, topLeftY]!=type){//up+left
	  biome_create_wrap2(array, arrayX-1, arrayY-1, type);
	  scr_generateBiome2(array, arrayX-1, arrayY-1, type, odds-5);
	}
	if(oddsUR>0 && array[topRightX, topLeftY]!=type){//up+right
	  biome_create_wrap2(array, arrayX+1, arrayY-1, type);
	  scr_generateBiome2(array, arrayX+1, arrayY-1, type, odds-5);
	}
	if(oddsDL>0 && array[topLeftX, bottomLeftY]!=type){//down+left
		biome_create_wrap2(array, arrayX-1, arrayY+1, type);
		scr_generateBiome2(array, arrayX-1, arrayY+1, type, odds-5);
	}
	if(oddsDR>0 && array[topRightX, bottomLeftY]!=type){//down+right
		biome_create_wrap2(array, arrayX+1, arrayY+1, type);
		scr_generateBiome2(array, arrayX+1, arrayY+1, type, odds-5);
	}


}
