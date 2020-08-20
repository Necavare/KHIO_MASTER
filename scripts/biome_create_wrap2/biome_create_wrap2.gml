/// biome_create_wrap2 (array, arrayX, arrayY, biome type)
/// @description creates an object taking into account wrapping world
/// @param array
/// @param arrayX
/// @param arrayY
/// @param biomeType
function biome_create_wrap2(argument0, argument1, argument2, argument3) {

	var array = argument0;
	var xT = argument1;
	var yT = argument2;
	var type = argument3;
	var arrayLength = array_length_2d(array, 0)-1;
	var arrayHeight = array_height_2d(array)-1;


	/*
	var xTTrue = xT*16;
	var yTTrue = yT*16;

	if(yTTrue<0)
		yT = (room_height+yTTrue)/16;
	if(yTTrue>room_height)
		yT = (yT-room_height)/16;
	if(xTTrue<0)
		xT = (room_width+xT)/16;
	if(xT>room_width)
		xT = (xT-room_width)/16;
	*/

	//check if its out of bounds of room and set it to in boands
	if(xT < 0){xT = arrayLength+xT;} //if its smaller: wrap
	else if(xT > arrayLength){xT = xT-arrayLength;} //if its larger: wrap
	if(yT < 0){yT = arrayHeight+yT;} //if its smaller: wrap
	else if(yT > arrayHeight){yT = yT-arrayHeight;}

	if((array[xT,yT] == 1) && (type == 2))//check types if their the same mix
		array[@xT,yT] = 3;
	if((array[xT,yT] == 2) && (type == 1))
		array[@xT,yT] = 3;

	else
		array[@xT,yT] = type; //if not mixing then just use
	


}
