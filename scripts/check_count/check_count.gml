/// @description check_count()
/// @param item
/// @param count
function check_count() {
	var itemToCount = argument[0];
	var itemCount = argument[1];

	var items = o_hud.items;
	var count = o_hud.count;

	var totalCount = 0;

	// Searching through hotbar for item
	for(var ix = 0; ix < 3; ix++)
		if(o_hud.hotbarItems[# 0, ix] == itemToCount)
			totalCount += o_hud.hotbarCount[# 0, ix];
		
	// Searching through inventory for item
	for(var ix = 0; ix < 4; ix++)
		for(var iy = 0; iy < 3; iy++) {
			if(items[# ix, iy] == itemToCount)
				totalCount += count[# ix, iy];
		}

	if(totalCount >= itemCount)
		return true;


}
