if(mode != 5) {
	mode = 3;
	alarm[1] = 120;

	sprite_index = s_goblin_run_3;

	if(global.itemEquipped == item.torch) {
		o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] = -1;
		audio_play_sound(sn_tool_break, 1, 0);
	}
}