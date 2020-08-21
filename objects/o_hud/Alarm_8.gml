///@description Food decaying
// Checking inventory
for(var xx = 0; xx < width; xx++)
	for(var yy = 0; yy < height; yy++) {
		for(var i = 0; i < array_length(global.food); i++) {
			if(items[# xx, yy] == global.food[i] && durability[# xx, yy] > 0) {
				durability[# xx, yy]-=.0001;
			} else if(items[# xx, yy] == global.food[i] && durability[# xx, yy] <= 0) {
				items[# xx, yy] = 79;
				durability[# xx, yy] = -1;
			}
		}
	}
	
// Checking hotbar
for(var iy = 0; iy < 3; iy++) {
	for(var i = 0; i < array_length(global.food); i++) {
		if(hotbarItems[# 0, iy] == global.food[i] && hotbarDurability[# 0, iy] > 0) {
			hotbarDurability[# 0, iy]-=.0001;
		} else if(hotbarItems[# 0, iy] == global.food[i] && hotbarDurability[# 0, iy] <= 0) {
			hotbarItems[# 0, iy] = 79;
			hotbarDurability[# 0, iy] = -1;
		}
		}
	}
	
alarm[8] = 1;