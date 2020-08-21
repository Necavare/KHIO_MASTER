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
	
alarm[4] = 60;