if(isLit) {
	if(global.lanternX == -1) {
		o_hud.hotbarDurability[# 0, global.lanternY] -= .1;
		
		if(o_hud.hotbarDurability[# 0, global.lanternY] <= 0) {
			o_hud.hotbarItems[# 0, global.lanternY] = -1;
			o_hud.hotbarCount[# 0, global.lanternY] = 0;
			o_hud.hotbarDurability[# 0, global.lanternY] = -1;
			instance_destroy(self);
		}
		
		o_hud.showHotbar = true;
	} else {
		o_hud.durability[# global.lanternX, global.lanternY] -= .5;
		
		if(o_hud.durability[# global.lanternX, global.lanternY] <= 0) {
			o_hud.items[# global.lanternX, global.lanternY] = -1;
			o_hud.count[# global.lanternX, global.lanternY] = 0;
			o_hud.durability[# global.lanternX, global.lanternY] = -1;
			instance_destroy(self);
		}
	}
	

}

alarm[1] = 60;