///@description Cooking food
if((items[# 0, 0] == item.meat || items[# 0, 0] == item.human  || items[# 0, 0] == item.fungi) && isLit) {
	count[# 0, 0]--;
	
	// Spawning new item	
	var new_item = instance_create_layer(x, y, "items", o_item);

	if(items[# 0, 0] == item.meat)
		new_item.image_index = item.cookedmeat; 
	else if(items[# 0, 0] == item.human)
		new_item.image_index = item.cookedhuman; 
	else if(items[# 0, 0] == item.fungi)
		new_item.image_index = item.cookedfungi; 
		
	new_item.direction = point_direction(x,y,mouse_x,mouse_y);
	new_item.item_count = 1;
	new_item.durability = 11;
	
	alarm[1] = -1;
}
