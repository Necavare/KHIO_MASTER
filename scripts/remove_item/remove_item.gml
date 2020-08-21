/// @description remove_item()
/// @param object
/// @param x
/// @param y
/// @param amount
function remove_item() {
	var object = argument[0];
	var xx = argument[1];
	var yy = argument[2];
	var amount = argument[3];

	var single = false;
	var isLastSingle = false;

	for(var i = 0; i < array_length(global.singleItems); i++) {
		if(global.singleItems[i] == object.items[# xx, yy])
			single = true;
		if(global.singleItems[i] == global.last_item)
			isLastSingle = true;
	}
		
	if(single && global.isItemPicked && isLastSingle)  {
		object.items[# xx, yy] = global.last_item;
		return -1;
	} else if(single && global.isItemPicked && !isLastSingle) {
		object.items[# xx, yy] = global.last_item;
		object.count[# xx, yy] = global.picked_quantity;
		return -1;
	} else
		for(var i = 0; i < amount; i++)	{
			// Get the item count
			var item_count = object.count[# xx, yy];

			// Make sure we have items
			if(item_count > 0)
			{
				// Take 1 from the item count
				object.count[# xx, yy]--;
	
				// Check if its the last item
				if(item_count == 1)
				{
					object.items[# xx, yy] = item.none;
					object.durability[# xx, yy] = -1;
				}
			}
			else if(item_count == 0)
			{
				// return none
				return item.none;
			}
			else
			{
				show_error("The item count is less than zero", false);
			}
	
	
		}
	
	// Removing durability from slot
	if(single) {
		for(var i = 0; i < array_length(global.durabilityItems); i++)
			if(global.durabilityItems[i] == object.items[# xx, yy])
				object.durability[# xx, yy] = 0;
	}


}
