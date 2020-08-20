/// @description drag_item
/// @param item
/// @param count
/// @param durability
function check_inventory() {
	var item = argument[0];
	var count = argument[1];
	var durability = argument[2];

	var counting = 0;

	if(o_hud.craftingItems[# 0, 0] == item && o_hud.craftingDurability[# 0, 0] >= durability)
		counting += o_hud.craftingCount[# 0, 0];

	for(var ix = 0; ix < 3; ix++)
		for(var iy = 0; iy < 3; iy++) {
			if(counting < count) {
				// Looking through hotbar
				if(ix == 0 && o_hud.hotbarItems[# 0, iy] == item && o_hud.hotbarDurability[# 0, iy] >= durability) {
					counting += o_hud.hotbarCount[# 0, iy];
					if(item == item.lantern) {
						global.lanternX = -1;
						global.lanternY = iy;
					}
				}
		
				// Looking through inventory
				if(item != item.lantern && item != item.sack)
				if(o_hud.items[# ix, iy] == item && o_hud.durability[# ix, iy] >= durability) {
					counting += o_hud.count[# ix, iy];
					if(item == item.lantern) {
						global.lanternX = ix;
						global.lanternY = iy;
					}
				}
			} else
				break;
		}
	
	if(counting >= count)
		return true;
	else
		return false;


}
