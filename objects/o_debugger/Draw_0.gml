if(drawCollisions)
	with(all) {
		if(sprite_index != -1 && object_index != o_hud) {
			mask_index = sprite_index;
			draw_sprite_ext(mask_index, 0, x,y,1,1,image_angle, c_red, .5);
		}
	}