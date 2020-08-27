///@description take_hit(type)
///@param type // 0 = wood, 1 = stone, 2 = metal, 3 = flesh, 4 = grass
function take_hit(argument0, argument1) {
	object = argument0;
	type = argument1;

	var xx = o_tool.x;
	var yy = o_tool.y;
	
	if(global.itemEquipped == item.snowball)
		type = 5;

	if(!o_tool.isHitting && o_tool.isSwung) {
		o_tool.isHitting = true;
		o_camera.shake = .5;
	
		if(type == 0) { // Wooden Objects
		
			// Chop effect
			var spruce = true;
			if(object_index == o_birch || object_index == o_birch_stump || object_index == o_birch_log)
				spruce = false;
		
			repeat(6) {
				var chip = instance_create_depth(x, y, depth, o_particles);
				if(!spruce)
					chip.birch = true;
			}
		
			// Play sound
			switch(irandom_range(0,4)) {
				case 0: audio_play_sound(sn_chop_1, 1, 0); break;
				case 1: audio_play_sound(sn_chop_2, 1, 0); break;
				case 2: audio_play_sound(sn_chop_3, 1, 0); break;
				case 3: audio_play_sound(sn_chop_4, 1, 0); break;
				case 4: audio_play_sound(sn_chop_5, 1, 0); break;
			}
		
			// Taking health
			if(global.itemEquipped == item.stoneaxeB || global.itemEquipped == item.stoneaxeS 
			|| global.itemEquipped == item.boneaxeB || global.itemEquipped == item.boneaxeS 
			|| global.itemEquipped == item.metalaxeB || global.itemEquipped == item.metalaxeS) {
				object.health_ -= o_tool.damage;
			} else
				object.health_ -= o_tool.damage/20;
		
			if(global.itemEquipped == item.torch || global.itemEquipped == item.flare)
				object.isOnFire = true;
		
		} else if(type == 1) { // Stone objects
	
			// Play sound
			switch(irandom_range(0,4)) {
				case 0: audio_play_sound(sn_rock_1, 1, 0); break;
				case 1: audio_play_sound(sn_rock_2, 1, 0); break;
				case 2: audio_play_sound(sn_rock_3, 1, 0); break;
				case 3: audio_play_sound(sn_rock_4, 1, 0); break;
				case 4: audio_play_sound(sn_rock_5, 1, 0); break;
			}
		
			if(object_index != o_bigrock)
			if(global.itemEquipped == item.stonepicB || global.itemEquipped == item.stonepicS 
			|| global.itemEquipped == item.bonepicB || global.itemEquipped == item.bonepicS 
			|| global.itemEquipped == item.metalpicB || global.itemEquipped == item.metalpicS) {
				object.health_ -= o_tool.damage;
				repeat(5) {
					var chip = instance_create_depth(x, y, depth, o_particles);
						chip.rock = true;
				}
			}
		
			repeat(8) {
				var chip = instance_create_depth(xx, yy, depth, o_particles);
					chip.spark = true;
			}

		} else if(type == 2) { // Metal objects
		
			// Play sound
			switch(irandom_range(0,4)) {
				case 0: audio_play_sound(sn_metal_1, 1, 0); break;
				case 1: audio_play_sound(sn_metal_2, 1, 0); break;
				case 2: audio_play_sound(sn_metal_3, 1, 0); break;
				case 3: audio_play_sound(sn_metal_4, 1, 0); break;
				case 4: audio_play_sound(sn_metal_5, 1, 0); break;
			}
		
			if(global.itemEquipped == item.stonepicB || global.itemEquipped == item.stonepicS 
				 || global.itemEquipped == item.bonepicB || global.itemEquipped == item.bonepicS 
				 || global.itemEquipped == item.metalpicB || global.itemEquipped == item.metalpicS)
				 object.health_ -= o_tool.damage/3;
			if(global.itemEquipped == item.stoneaxeB || global.itemEquipped == item.stoneaxeS 
				|| global.itemEquipped == item.boneaxeB || global.itemEquipped == item.boneaxeS 
				|| global.itemEquipped == item.metalaxeB || global.itemEquipped == item.metalaxeS
				|| global.itemEquipped == item.boneclubB || global.itemEquipped == item.boneclubS)
					object.health_ -= o_tool.damage/20;
				
			repeat(8) {
				var chip = instance_create_depth(xx, yy, depth, o_particles);
					chip.spark = true;
			}
	
		} else if(type == 3) { // Flesh objects
			switch(irandom(2)) {
				case 0: audio_play_sound(sn_harvest_1, 1, 0); break;
				case 1: audio_play_sound(sn_harvest_2, 1, 0); break;
				case 2: audio_play_sound(sn_harvest_3, 1, 0); break;
			}
		
			// Effect
			repeat(10) {
				var chip = instance_create_depth(x, y, depth, o_particles);
					chip.blood = true;
			}
		
			object.health_ -= o_tool.damage;
		} else if(type == 4) { // Grass objects
		
			// Play sound
			if(object_index == o_grass || object_index == o_cattail) {
				switch(irandom(1)) {
					case 0: audio_play_sound(sn_grass_hit_1, 1, 0); break;
					case 1: audio_play_sound(sn_grass_hit_2, 1, 0); break;
				}
			} 
		
			if(object_index == o_bush || object_index == o_big_bush) {
				switch(irandom(1)) {
					case 0: audio_play_sound(sn_bush_hit_1, 1, 0); break;
					case 1: audio_play_sound(sn_bush_hit_2, 1, 0); break;
				}
			}
		
			if(object_index == o_tent) {
				switch(irandom(3)) {
					case 0: audio_play_sound(sn_bush_hit_1, 1, 0); break;
					case 1: audio_play_sound(sn_bush_hit_2, 1, 0); break;
					case 2: audio_play_sound(sn_grass_hit_1, 1, 0); break;
					case 3: audio_play_sound(sn_grass_hit_2, 1, 0); break;
				}
			}
		
			object.health_ -= o_tool.damage;
	
			if(global.itemEquipped == item.torch || global.itemEquipped == item.flare)
				object.isOnFire = true;
			
			// Effect
			//if(object.health_ <= 0) {
				repeat(2) {
					var chip = instance_create_depth(x, y, depth, o_particles);
					if(object_index == o_bush || object_index == o_big_bush)
						chip.stick = true;
					else
						chip.grass = true;
				}
			//}
		} else if(type == 5) { // SNOW
			o_tool.isHitting = true;
			repeat(5) {
				var chip = instance_create_depth(x, y, depth, o_particles);
				chip.snow = true;
			}
			object.isOnFire = false;
		}
	}


}
