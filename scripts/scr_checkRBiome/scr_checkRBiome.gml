/// scr_checkRBiome(array, arrayX, arrayY, radius)
/// @description checkRadius(array, x, y, radius)
/// @param array
/// @param arrayX
/// @param arrayY
/// @param radius
/// @param default
function scr_checkRBiome(argument0, argument1, argument2, argument3, argument4) {

	var array = argument0;
	var arrayX=argument1;
	var arrayY = argument2;
	var num=argument3;
	var defaultVal = argument4; // this is the value that it thinks it wants, either 1 or 2
	var nondefaultVal = 0;
	if(defaultVal == 1){
		nondefaultVal = 2;
	}
	else if(defaultVal == 2){
		nondefaultVal = 1;
	}
	var arrayLength = array_length_2d(array, 0)-1;
	var arrayHeight = array_height_2d(array)-1;
	var exists2 = false;

	//returns the value of the nearby elements 1 for 1 and 2 for 2 starting from the outside

	//show_debug_message("arrayX: " +string(arrayX));
	//show_debug_message("arrayY: " +string(arrayY));

	var loopi = 1;
	while (loopi <= num){
		//show_debug_message("looping whole search by num (should only happen once per square)");
		//find distance of square sides
		var distance = 1+(2*num); 
		//\\when num is 1 so its a 3 x 3 square distance is three when its 2 and is 5 it is as well
	
	
		//find bottom and top left corners
		//find top left x
		var topLeftX = arrayX-loopi;
		if(topLeftX < 0){topLeftX = arrayLength+topLeftX;} //if its smaller: wrap
		else if(topLeftX > arrayLength){topLeftX = topLeftX-arrayLength;} //if its larger: wrap
	
		//find top left y
		var topLeftY = arrayY-loopi;
		if(topLeftY < 0){topLeftY = arrayHeight+topLeftY;} //if its smaller: wrap
		else if(topLeftY > arrayHeight){topLeftY = topLeftY-arrayHeight;}
	
		//find top right x (requires previous definitions)
		var topRightX = topLeftX+(distance-1);
		if(topRightX < 0){topRightX = arrayLength+topRightX;} //if its smaller: wrap
		else if(topRightX > arrayLength){topRightX = topRightX-arrayLength;} //if its larger: wrap
	
		//find bottom left y (requires previous definitions)
		var bottomLeftY = topLeftY+(distance-1);
		if(bottomLeftY < 0){bottomLeftY = arrayHeight+bottomLeftY;} //if its smaller: wrap
		else if(bottomLeftY > arrayHeight){bottomLeftY = bottomLeftY-arrayHeight;}
	
		/*
		show_debug_message("------------------------");
		show_debug_message("distance: "+string(distance));
		show_debug_message("xT: "+string(arrayX));
		show_debug_message("yT: "+string(arrayY));
		show_debug_message("arrayLength: "+string(arrayLength));
		show_debug_message("arrayHeight: "+string(arrayHeight));
		show_debug_message("------------------------");
		*/
	
		//go right from top then bottom
		//show_debug_message("go right from top and bottom");
		for(i = 0; i < distance; i++){
			// the y is unchanged
		
			//set the current value of loop
			var loopX = topLeftX+i;
			if(loopX < 0){loopX = arrayLength+loopX;} //if its smaller: wrap
			else if(loopX > arrayLength){loopX = loopX-arrayLength;} //if its larger: wrap
		
			var arrayVal1 = array[loopX, topLeftY];
			var arrayVal2 = array[loopX, bottomLeftY];
			//how_debug_message("loopX: "+string(loopX)+" topLeftY: "+string(topLeftY)+"val: "+string(arrayVal1));
			//show_debug_message("loopX: "+string(loopX)+" bottomLeftY: "+string(bottomLeftY)+"val: "+string(arrayVal2));
			if(arrayVal1==defaultVal||arrayVal2==defaultVal)
				return defaultVal;
			else if(arrayVal1==nondefaultVal||arrayVal2==nondefaultVal)
				exists2 = true;
		}
		//go down from left and right
		//show_debug_message("go down from left and right");
		for(i = 0; i < distance; i++){
			//the x is unchanged
		
			//set the current value of loop
			var loopY = topLeftY+i;
			if(loopY < 0){loopY = arrayHeight+loopY;} //if its smaller: wrap
			else if(loopY > arrayHeight){loopY = loopY-arrayHeight;}
		
			var arrayVal1 = array[topLeftX, loopY];
			var arrayVal2 = array[topRightX, loopY];
			//show_debug_message("topLeftX: "+string(topLeftX)+" loopY: "+string(loopY)+"val: "+string(arrayVal1));
			//show_debug_message("topRightX: "+string(topRightX)+" loopY: "+string(loopY)+"val: "+string(arrayVal2));
			if(arrayVal1==defaultVal||arrayVal2==defaultVal)
				return defaultVal;
			else if(arrayVal1==nondefaultVal||arrayVal2==nondefaultVal)
				exists2 = true;
		}
	
		loopi++;
	}
	if(exists2){ //if its not default
		return nondefaultVal;
	}
	else
		return 0;//no elements found or only mix


}
