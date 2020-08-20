/// scr_clipping_primary (instance, copy)
/// @description scr_clipping_primary(instance, copy)
/// @param instance
/// @param copyBool
function scr_clipping_primary(argument0, argument1) {


	//destroys any instance that the called instance is currently in contact with (marked as solid)
	var inst= argument0;
	var copy = argument1;

	var deleted = false;
	with(inst){
	
		//if its a grass or a bush keep it out of camps
		if(object_index == o_grass || object_index == o_bush){
	
			for(var  i = 0; i < ds_list_size(enemyCampX_list); i++){
				if(point_distance(x,y,ds_list_find_value(enemyCampX_list, i), ds_list_find_value(enemyCampY_list, i)) < ds_list_find_value(enemyCampR_list, i))
					instance_destroy(argument0);
			}
	
	
		}
	
		//keep it out of the key area
		if(point_distance(x,y,global.keyx, global.keyy) < 35)
			instance_destroy(self);
		if(collision_point(global.keyx, global.keyy, self, false, true))
			instance_destroy(self);
	
		//keep it out of compound if its a big rock
		if(object_index == o_bigrock){
			if(point_distance(x,y,global.compoundX, global.compoundY)< 380){
				show_debug_message("too close to compound");
				instance_destroy(self);	
			}
		}
	
		//keep it out of the middle section
		//if(object_index != o_lake && object_index != o_pond && object_index != o_pond2){
			if(collision_circle(room_width/2+500, room_height/2+30, 100, self, true, false)){
				instance_destroy(self);
				deleted = true;	
			}
		//}
	
		//keep it off of priority objects
		//if(object_index == o_lake || object_index == o_pond || object_index == o_pond2){
			if(place_meeting(x,y,o_wall) || place_meeting(x,y,o_broken_wall) || place_meeting(x,y,o_tall_wall)||place_meeting(x,y,o_compound_wall)||place_meeting(x,y,o_firepit)||place_meeting(x,y, o_tent)){
				instance_destroy(self);
				deleted = true;
			}
			if(place_meeting(x,y,o_wall_wood) && (object_index != o_wall_wood && object_index != o_door_sides)){
				instance_destroy(self);
				deleted = true;
			}
		//}
	
		//else if(!copy){
		else{
			if(collision_circle(room_width/2+500, room_height/2+30, 100, self, true, false)){
				deleted= true;
				/*
				if(object_index == o_lake)
					show_debug_message("lake too close");
				else if(object_index == o_pond)
					show_debug_message("pond too close");
				else if(object_index == o_pond2)
					show_debug_message("pond2 too close");
				show_debug_message("lakes");*/
				instance_destroy(self);
			}
		}
	}
	/*
	if(deleted)
		show_debug_message("deleted true"); */
	if(!deleted){

	if(!copy){
		//this is not the reason for clipping not working but still is buggy, come back later
		var instCopy = scr_checkWrap(inst, 1);
	}

	with (inst) {

		//instance_activate_region(x-(sprite_width/2)-30,y-(sprite_height/2)-30,sprite_width+60, sprite_height+60, true);
	
		//first check if any non solid objects are in the way that should not be clipped onto
		//and its not cliff
		if(place_meeting(x, y, o_player)||place_meeting(x, y, o_player_hitBox)||place_meeting(x,y, o_lake)||place_meeting(x,y, o_pond)
			||place_meeting(x,y,o_pond2)||place_meeting(x,y,o_shed_floor)||place_meeting(x,y,o_house_floor)){
			
				//changed || to &&
				//if(object_index != o_wall_wood || object_index != o_door_wood || object_index != o_tower ||
				//	object_index != o_anvil || object_index != o_tent || object_index != o_pond || 
				//	object_index != o_lake){
				if((object_index != o_wall_wood) && (object_index != o_spikes_metal) && (object_index != o_spikes_wood) && (object_index!=o_door_wood) 
				&& (object_index != o_tower) && (object_index != o_small_crate) && (object_index != o_door_sides) &&
				(object_index != o_tent) && (object_index != o_player) && (object_index != o_road_block) && (object_index != o_lake)
				&& (object_index != o_enemyBow) &&(object_index != o_enemySword)) {
					instance_destroy(self);
				}
				if((object_index == o_pond || object_index == o_pond2) && place_meeting(x,y,o_lake))
					instance_destroy(self);
				//	}
				//if((object_index == o_lake) && (place_meeting(x,y,o_pond) || place_meeting(x,y,o_pond2)))
				
				return;
		}
	
		if(place_meeting(x,y,o_wall_wood) || place_meeting(x,y, o_spikes_metal) || place_meeting(x,y,o_spikes_wood) || 
		place_meeting(x,y,o_door_wood) || place_meeting(x,y,o_door_sides) || place_meeting(x,y, o_house_floor) || place_meeting(x,y,o_shed_floor)){
			//delete houses with contact to walls or doors or other buildings
			if(object_index == o_shed_floor || object_index == o_house_floor)
				instance_destroy(self);
		}
	
		if((object_index == o_firepit || object_index == o_tent) && (place_meeting(x,y,o_tent) || place_meeting(x,y, o_firepit) || place_meeting(x,y, o_small_crate)))
			instance_destroy(self);

		/*
		if((object_index == o_firepit) && point_distance(x,y, instance_nearest(x,y,o_tent)) < 50)
			instance_destroy(self);
		*/	
		//check if theirs any solid objects (or if syour a special boy) 99
		if(!place_free(x,y)||object_index==o_lake||object_index==o_pond||object_index == o_pond2){ 	
			var list = ds_list_create();
			var num = instance_place_list(x, y, all , list, false);
		
			for (var i = 0; i < num; i++){
			
				//dont remove certain objects but remove all else (unless your a sepcial boy)
				if (instance_exists(list[| i])&&
				!(list[| i].object_index == o_grass)
				||object_index == o_lake||object_index == o_pond||object_index== o_pond2){
				//^ this line caused some problems before keep an eye on it in relation to problems with clipping
				//and the lakes	
					//if its a house or shed dont delete it
					//if!(!(object_index == o_bigrock || object_index == o_lake || object_index == o_pond || object_index == o_shed_floor || object_index == o_house_floor) && list[| i].object_index == o_bigrock){
						if(instance_exists(list[| i])&&(object_index == o_lake)&&(list[| i].object_index == o_pond2||list[| i].object_index == o_pond)){
							show_debug_message("destroy pond");
							instance_destroy(list[| i]);
						}
						if(instance_exists(list[| i])&&(object_index == o_pond2)&&(list[| i].object_index == o_pond)&&!(list[| i].object_index==o_generatorNStepNew)){
							instance_destroy(list[| i]);
						}
						if(instance_exists(list[| i])&&(object_index == o_lake || object_index == o_pond2 || object_index == o_pond)&&
						(list[| i].object_index == o_shed_floor || list[| i].object_index == o_house_floor)){
							instance_destroy(list[| i]);
						}
						if(object_index == o_tower && list[| i].object_index == o_tower)
							instance_destroy(list[| i]);
						else if(instance_exists(list[| i]) && list[| i].object_index!=o_player&&list[| i].object_index != o_player_hitBox&&list[| i].object_index != o_hud_slot && 
							list[| i].object_index != o_road_block && list[| i].object_index != o_car && list[| i].object_index != o_pole_broken && 
							list[| i].object_index != o_pole_wired && list[| i].object_index!=o_snow_texture&&list[| i].object_index != o_lake
							&&list[| i].object_index!=o_pond&&list[|i].object_index!=o_pond2&&list[| i].object_index!=o_wall_wood&& list[| i].object_index !=o_firepit&&
							list[| i].object_index != o_spikes_wood && list[| i].object_index != o_spikes_metal && list[| i].object_index!=o_door_wood&&list[| i].object_index!=o_tower && 
							list[| i].object_index != o_tower_log && list[| i].object_index != o_tower_ladder && list[| i].object_index != o_tower_roof &&
							list[| i].object_index != o_tent && list[| i].object_index != o_small_crate &&
							list[| i].object_index != o_enemySword && list[| i].object_index != o_enemyBow && list[|i].object_index != o_watertower 
							&&!(list[| i].object_index==o_generatorNStepNew) && list[| i].object_index != o_shed && list[| i].object_index != o_shed_back 
							&&  list[| i].object_index != o_shed_door && list[| i].object_index != o_shed_side && list[| i].object_index != o_shed_roof && 
							list[| i].object_index != o_shed_pillar && list[| i].object_index != o_house && list[| i].object_index != o_house_back && 
							list[| i].object_index != o_house_door && list[| i].object_index != o_house_side && list[| i].object_index != o_house_roof && 
							list[| i].object_index != o_house_floor && list[| i].object_index != o_shed_floor){
							instance_destroy(list[| i]);
							//if(object_index == o_lake || object_index == o_pond)
							//	show_debug_message("primary lake/pond destroy");
						}
					//}
				}
			}
	
			ds_list_destroy(list);
		}
	}
	
	}


}
