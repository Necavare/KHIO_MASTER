/// scr_clipping_special(instance, copy)
/// @description scr_clipping_special(instance, copy)
/// @param instance
/// @param copyBool
function scr_clipping_special(argument0, argument1) {

	//if normally this thing shouldnt kill itself with other objects so cant use clipping secondary
	//destroys itself if in contact with objects which require this thing to be ded (grass mostly)
	var inst= argument0;
	var copy = argument1;

	if(!copy){
		//var instCopy = scr_checkWrap(inst, 3);
	}

	//instance_activate_region(x-(sprite_width/2)-15,y-(sprite_height/2)-15,sprite_width+30, sprite_height+30, true);
	if(inst.object_index == o_rock || inst.object_index == o_rocks){
	for(var  i = 0; i < ds_list_size(enemyCampX_list); i++){
		if(point_distance(x,y,ds_list_find_value(enemyCampX_list, i), ds_list_find_value(enemyCampY_list, i)) < ds_list_find_value(enemyCampR_list, i))
			instance_destroy(inst);
	}
	

	}

	with (inst) {
	
		//if its a grass or a bush keep it out of camps
		if(object_index == o_grass || object_index == o_bush || object_index == o_lillyofthevalley){
	
			for(var  i = 0; i < ds_list_size(o_generatorNStepNew.enemyCampX_list); i++){
				if(point_distance(x,y,ds_list_find_value(o_generatorNStepNew.enemyCampX_list, i), ds_list_find_value(o_generatorNStepNew.enemyCampY_list, i)) < ds_list_find_value(o_generatorNStepNew.enemyCampR_list, i)+20)
					instance_destroy(argument0);
			}
	
	
		}
	
		//keep it out of the key area
		if(point_distance(x,y,global.keyx, global.keyy) < 35)
			instance_destroy(self);
		if(collision_point(global.keyx, global.keyy, self, false, true))
			instance_destroy(self);
		
			//keep it out of compound if its a rock
		if(object_index == o_rock || object_index == o_rocks){
			if(point_distance(x,y,global.compoundX, global.compoundY)< 380){
				show_debug_message("too close to compound");
				instance_destroy(self);	
			}
		}
	
		//keep it out of the middle section
		if(collision_circle((room_width/2)+500, room_height/2+30, 80, self, true, false))
			instance_destroy(self);
	
		/*
		if(collision_circle(x,y, 50, o_big_bush, true, true))
			instance_destroy(self);
		*/
		
		if(place_meeting(x,y, o_lake)||place_meeting(x,y,o_pond)||place_meeting(x,y,o_pond2)||
		place_meeting(x,y,o_grass)||place_meeting(x,y,o_cattail)||place_meeting(x,y,o_cave_entrance)||
		place_meeting(x,y,o_house_floor)||place_meeting(x,y,o_shed_floor)||place_meeting(x,y,o_bush)||place_meeting(x,y,o_big_bush)
		||place_meeting(x,y,o_firepit)||place_meeting(x,y,o_watertower)||place_meeting(x,y,o_rock)||place_meeting(x,y, o_digmound)
		||place_meeting(x,y,o_car)||place_meeting(x,y,o_wall_wood)||place_meeting(x,y,o_door_wood)||
		place_meeting(x,y,o_door_sides)||place_meeting(x,y,o_spruce)||place_meeting(x,y,o_spruce_stump)||
		place_meeting(x,y,o_birch)||place_meeting(x,y,o_birch_stump)||place_meeting(x,y,o_tent)||
		place_meeting(x,y,o_small_crate)||place_meeting(x,y,o_wall)||place_meeting(x,y,o_broken_wall)||
		place_meeting(x,y,o_tall_wall)||place_meeting(x,y,o_compound_wall)||place_meeting(x,y,o_compound_access)||
		place_meeting(x,y,o_trapped_crate)||place_meeting(x,y,o_tank)||place_meeting(x,y,o_con_tall_wall)||place_meeting(x,y,o_con_wall)||
		place_meeting(x,y,o_con_wall_broken)||place_meeting(x,y,o_con_wall_corner)||place_meeting(x,y,o_bunker)||place_meeting(x,y,o_aaturret)){
			instance_destroy(self);	
		}
	}



}
