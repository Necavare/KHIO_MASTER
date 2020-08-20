/// scr_clipping_secondary(instance, copy)
/// @description scr_clipping_secondary(instance, copy)
/// @param instance
/// @param copyBool
function scr_clipping_secondary(argument0, argument1) {

	//destroys itself if in contact with another instance (marked as solid) or with a certainobject
	var inst= argument0;
	var copy = argument1;

	if(!copy){
		//var instCopy = scr_checkWrap(inst, 2);
	}

	for(var  i = 0; i < ds_list_size(enemyCampX_list); i++){
				if(point_distance(x,y,ds_list_find_value(enemyCampX_list, i), ds_list_find_value(enemyCampY_list, i)) < ds_list_find_value(enemyCampR_list, i))
					instance_destroy(argument0);
			}
	

	with (inst) {
		//make sure its not inside of a camp
	
	
		//keep it out of the key area
		if(point_distance(x,y,global.keyx, global.keyy) < 35)
			instance_destroy(self);
		if(collision_point(global.keyx, global.keyy, self, false, true))
			instance_destroy(self);
	
		//keep it out of compound if its a tree
		if(object_index== o_spruce || object_index == o_birch || object_index == o_birch_stump || object_index == o_spruce_stump || object_index == o_rock || object_index == o_bigrock || object_index == o_rocks){
			if(point_distance(x,y,global.compoundX, global.compoundY)< 380){
				show_debug_message("too close to compound");
				instance_destroy(self);	
			}
		}
	
		//keep it out of the middle section
		if(collision_circle((room_width/2)+500, room_height/2+80, 100, self, true, false))
			instance_destroy(self);
		if(collision_circle(x,y, 50, o_wall, true, true))
			instance_destroy(self);
		if(collision_circle(x,y, 50, o_broken_wall, true, true))
			instance_destroy(self);
		if(collision_circle(x,y, 50, o_tall_wall, true, true))
			instance_destroy(self);
		if(collision_circle(x,y, 50, o_compound_wall, true, true))
			instance_destroy(self);
	
		//keep it away from houses/sheds and camps (ie. walls)
		if(collision_circle(x,y, 150, o_house_floor, true, true))
			instance_destroy(self);
		if(collision_circle(x,y,150, o_shed_floor, true, true))
			instance_destroy(self);
		if(collision_circle(x,y,150, o_wall_wood, true, true))
			instance_destroy(self);
		if(collision_circle(x,y,150, o_watertower, true, true))
			instance_destroy(self);
	
		if(place_meeting(x,y,o_house_floor)||place_meeting(x,y,o_shed_floor)||place_meeting(x,y,o_road_block)||place_meeting(x,y,o_pitfall)||
		place_meeting(x, y, o_player)||place_meeting(x,y,par_3d_object)||place_meeting(x,y,o_pond2)||place_meeting(x,y,o_firepit)||place_meeting(x,y,o_aaturret)||place_meeting(x,y,o_bush)||place_meeting(x,y,o_big_bush)||place_meeting(x,y,o_digmound)){		
			//if(place_meeting(x,y,o_road_block))
			//	show_debug_message("road block self delete");
			instance_destroy(self);	
			//show_debug_message("secondary self destroy");
		}	
	}


}
