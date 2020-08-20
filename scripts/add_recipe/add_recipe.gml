/// @description add_recipe()
/// @param object
/// @param item
function add_recipe() {
	var object = argument[0];
	var itemToAdd = argument[1];

	var width = 10;
	var height = 3;

	var canAdd = true;

	// Check for item in inventory
	for(var ix = 0; ix < width; ix++)
		for(var iy = 0; iy < height; iy++)	
			if(object[# ix, iy] == itemToAdd)
				canAdd = false;

	// Check for next empty slot
	if(canAdd) 
	for(var ix = 0; ix < width; ix++)
		for(var iy = 0; iy < height; iy++)	
			if(object[# ix, iy] == item.none) {
				object[# ix, iy] = itemToAdd;
				return true;
			}

	return false;


}
