///@description Durability for flammables
if(isLit) {
	o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] -= durability/4;
		
	if(o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] <= 0) {
		o_hud.hotbarItems[# 0, o_hud.hotbarSlot] = 0;
		o_hud.hotbarCount[# 0, o_hud.hotbarSlot] = 0;
		o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
		instance_destroy(self);
	}
	
	o_hud.showHotbar = true;

}

alarm[2] = 60;