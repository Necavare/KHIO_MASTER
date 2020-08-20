/// scr_checkWrap(instance, clipType)
/// @description scr_checkWrap(instance, clipType)
/// @param instance
/// @param clipType
function scr_checkWrap(argument0, argument1) {

	//this works the problem with sometimes not clipping is the nature of scr_clipping_primary since it deletes 
	//itself in contact with lakes or ponds if a lake is spawned over the wrap and contacts a lake
	//or pond it will delete itself as per that clipping, the only other option then would be to delete the pond
	//or lake in which case the question becomes which supercedes which?
	var inst= argument0;
	var clipType = argument1; // 1 primary, 2 secondary, 3 special, 4=has a floor instance

	with(inst){
		if(object_index == o_lake || object_index == o_pond2 || object_index == o_pond || object_index == o_house || object_index == o_shed){
			var rightdis = x+(sprite_width)-room_width-500;//xoffset since thats when it will matter
			var leftdis = x-(sprite_width)-500;
			var downdis = y+(sprite_height)-room_height;
			var updis = y-(sprite_height);
		
			/*
			if(object_index == o_lake){
				rightdis = x+(sprite_width)-(room_width/2)-500;//xoffset since thats when it will matter
				leftdis = x-(sprite_width)-500;
				downdis = y+(sprite_height)-room_height/2;
				updis = y-(sprite_height/2);	
			}*/
			if((rightdis > 0)||(leftdis < 0)||(downdis > 0)||(updis < 0)){ 
				var newx = x;
				var newy = y;
			#region rightdis > 0
				if(rightdis > 0){
					newx = 500;
					newx-=((sprite_width)-rightdis);	
					var instCopy1
					instCopy1 = instance_create_depth(newx, newy, 2, object_index);
					instCopy1.image_angle = image_angle;
					/* no longer need to do this
					var miniValues;
					miniValues[0] = sprite_index; //set sprite for minimap
					miniValues[1] = image_angle; //set angle of rotation
					miniValues[2] = newx; //x position
					miniValues[3] = newy; //y position
					miniValues[4] = 1;
					ds_map_replace(global.minimapVar, instCopy, miniValues);
					*/
					//ds_list_add(global.extraInst, instCopy);

	
					var miniValues1;
					miniValues1[0] = sprite_index; //set sprite for minimap
					miniValues1[1] = image_angle; //set angle of rotation
					miniValues1[2] = newx-500; //x position
					miniValues1[3] = newy; //y position
					miniValues1[4] = 1; //general depth, some objects can set this to 0 or other small number if bottom layer

					ds_stack_push(o_generatorNStepNew.objectStack, instCopy1.id);
					ds_map_add(global.minimapVar, instCopy1, miniValues1);
					ds_list_add(global.activemm, instCopy1); //add it to list of active minimap symbols
				
					if(clipType == 1){
						scr_clipping_primary(instCopy1, true);
						if(!instance_exists(instCopy1))
							instance_destroy(self);
			
					}if(clipType == 2)
						scr_clipping_secondary(instCopy1, true);
					if(clipType == 3)
						scr_clipping_special(instCopy1, true);
					if(clipType == 4)
						scr_clipping_special(instCopy1.instFloor, true);
			
					if(instance_exists(instCopy1)){
						if(object_index == o_lake){
							ds_queue_enqueue(global.bigLakeIDQ, instCopy1.id);
							with(o_generatorNStepNew){ds_queue_enqueue(activationQueue, instCopy1.id);}
						}
						else{
							with(o_generatorNStepNew){ds_queue_enqueue(floorQueue, instCopy1.id);}
						}
					}
				
				}
			#endregion
			
				newx = x;
				newy = y;
			#region leftdis < 0
				if(leftdis < 0){
					newx = 500;
					newx+=room_width+((sprite_width)+leftdis);
					var instCopy2
					instCopy2 = instance_create_depth(newx, newy, 2, object_index);
					instCopy2.image_angle = image_angle;
					//var arraymm = ds_map_find_value(global.minimapVar, instCopy);//find the minimap array values
					/* no longer need to do this
					var miniValues2;
					miniValues2[0] = sprite_index; //set sprite for minimap
					miniValues2[1] = image_angle; //set angle of rotation
					miniValues2[2] = newx; //x position
					miniValues2[3] = newy; //y position
					miniValues2[4] = 1;
					ds_map_replace(global.minimapVar, instCopy, miniValues2);
					*/
					//ds_list_add(global.extraInst, instCopy);
				
					var miniValues2;
					miniValues2[0] = sprite_index; //set sprite for minimap
					miniValues2[1] = image_angle; //set angle of rotation
					miniValues2[2] = newx-500; //x position
					miniValues2[3] = newy; //y position
					miniValues2[4] = 1; //general depth, some objects can set this to 0 or other small number if bottom layer

					ds_stack_push(o_generatorNStepNew.objectStack, instCopy2.id);
					ds_map_add(global.minimapVar, instCopy2, miniValues2);
					ds_list_add(global.activemm, instCopy2); //add it to list of active minimap symbols
				
					if(clipType == 1){
						scr_clipping_primary(instCopy2, true);
						if(!instance_exists(instCopy2))
							instance_destroy(self);
					}if(clipType == 2)
						scr_clipping_secondary(instCopy2, true);
					if(clipType == 3)
						scr_clipping_special(instCopy2, true);
					if(clipType == 4)
						scr_clipping_special(instCopy2.instFloor, true);
			
					if(instance_exists(instCopy2)){
						if(object_index == o_lake){
							ds_queue_enqueue(global.bigLakeIDQ, instCopy2.id);
							with(o_generatorNStepNew){ds_queue_enqueue(activationQueue, instCopy2.id);}
						}
						else{
							with(o_generatorNStepNew){ds_queue_enqueue(floorQueue, instCopy2.id);}
						}
					}
				}
			#endregion
			
				newx = x;
				newy = y;
			#region downdis > 0
				if(downdis > 0){
					newy = 0;
					newy-=((sprite_height)-downdis);
					var instCopy3
					instCopy3 = instance_create_depth(newx, newy, 2, object_index);
					instCopy3.image_angle = image_angle;
					//var arraymm = ds_map_find_value(global.minimapVar, instCopy);//find the minimap array values
					/* no longer need to do this
					var miniValues3;
					miniValues3[0] = sprite_index; //set sprite for minimap
					miniValues3[1] = image_angle; //set angle of rotation
					miniValues3[2] = newx; //x position
					miniValues3[3] = newy; //y position
					miniValues3[4] = 1;
					ds_map_replace(global.minimapVar, instCopy, miniValues3);
					*/
					//ds_list_add(global.extraInst, instCopy);
				
					var miniValues3;
					miniValues3[0] = sprite_index; //set sprite for minimap
					miniValues3[1] = image_angle; //set angle of rotation
					miniValues3[2] = newx-500; //x position
					miniValues3[3] = newy; //y position
					miniValues3[4] = 1; //general depth, some objects can set this to 0 or other small number if bottom layer

					ds_stack_push(o_generatorNStepNew.objectStack, instCopy3.id);
					ds_map_add(global.minimapVar, instCopy3, miniValues3);
					ds_list_add(global.activemm, instCopy3); //add it to list of active minimap symbols
				
					if(clipType == 1){
						scr_clipping_primary(instCopy3, true);
						if(!instance_exists(instCopy3))
							instance_destroy(self);
					}if(clipType == 2)
						scr_clipping_secondary(instCopy3, true);
					if(clipType == 3)
						scr_clipping_special(instCopy3, true);
					if(clipType == 4)
						scr_clipping_special(instCopy3.instFloor, true);
					
					if(instance_exists(instCopy3)){
						if(object_index == o_lake){
							ds_queue_enqueue(global.bigLakeIDQ, instCopy3.id);
							with(o_generatorNStepNew){ds_queue_enqueue(activationQueue, instCopy3.id);}
						}
						else{
							with(o_generatorNStepNew){ds_queue_enqueue(floorQueue, instCopy3.id);}
						}
					}
				}
			#endregion
			
				newx = x;
				newy = y;
			#region updis < 0
				if(updis < 0){
					newy = 0;
					newy+=room_height+((sprite_height)+updis);
					var instCopy4
					instCopy4 = instance_create_depth(newx, newy, 2, object_index);
					instCopy4.image_angle = image_angle;
					//var arraymm = ds_map_find_value(global.minimapVar, instCopy);//find the minimap array values
					/* no longer need to do this
					var miniValues4;
					miniValues4[0] = sprite_index; //set sprite for minimap
					miniValues4[1] = image_angle; //set angle of rotation
					miniValues4[2] = newx; //x position
					miniValues4[3] = newy; //y position
					miniValues4[4] = 1;
					ds_map_replace(global.minimapVar, instCopy, miniValues4);
					*/
					//ds_list_add(global.extraInst, instCopy);
				
					var miniValues4;
					miniValues4[0] = sprite_index; //set sprite for minimap
					miniValues4[1] = image_angle; //set angle of rotation
					miniValues4[2] = newx-500; //x position
					miniValues4[3] = newy; //y position
					miniValues4[4] = 1; //general depth, some objects can set this to 0 or other small number if bottom layer

					ds_stack_push(o_generatorNStepNew.objectStack, instCopy4.id);
					ds_map_add(global.minimapVar, instCopy4, miniValues4);
					ds_list_add(global.activemm, instCopy4); //add it to list of active minimap symbols
				
					if(clipType == 1){
						scr_clipping_primary(instCopy4, true);
						if(!instance_exists(instCopy4))
							instance_destroy(self);
					}if(clipType == 2)
						scr_clipping_secondary(instCopy4, true);
					if(clipType == 3)
						scr_clipping_special(instCopy4, true);	
					if(clipType == 4)
						scr_clipping_special(instCopy4.instFloor, true);
				
					if(instance_exists(instCopy4)){
						if(object_index == o_lake){
							ds_queue_enqueue(global.bigLakeIDQ, instCopy4.id);
							with(o_generatorNStepNew){ds_queue_enqueue(activationQueue, instCopy4.id);}
						}
						else{
							with(o_generatorNStepNew){ds_queue_enqueue(floorQueue, instCopy4.id);}
						}
					}
				}
			#endregion
		
				if( ((leftdis < 0)&&(updis < 0)) || ((leftdis < 0)&&(downdis > 0)) || ((rightdis>0)&&(updis<0))
				|| ((rightdis>0)&&(downdis > 0)) ){
			
					newx = x;
					newy = y;
					if(rightdis > 0){
						newx = 500;
						newx-=((sprite_width)-rightdis);	
					}
			
					if(leftdis < 0){
						newx = 500;
						newx+=room_width+((sprite_width)+leftdis);
					}
			
					if(downdis > 0){
						newy = 0;
						newy-=((sprite_height)-downdis);
					}
			
					if(updis < 0){
						newy = 0;
						newy+=room_height+((sprite_height)+updis);
					}
			
					var instCopy5
					instCopy5 = instance_create_depth(newx, newy, 2, object_index);
					instCopy5.image_angle = image_angle;
					//var arraymm = ds_map_find_value(global.minimapVar, instCopy);//find the minimap array values
					/* no longer need to do this
					var miniValues;
					miniValues[0] = sprite_index; //set sprite for minimap
					miniValues[1] = image_angle; //set angle of rotation
					miniValues[2] = newx; //x position
					miniValues[3] = newy; //y position
					miniValues[4] = 1;
					ds_map_replace(global.minimapVar, instCopy, miniValues);
					*/
					//ds_list_add(global.extraInst, instCopy);
				
					var miniValues5;
					miniValues5[0] = sprite_index; //set sprite for minimap
					miniValues5[1] = image_angle; //set angle of rotation
					miniValues5[2] = newx-500; //x position
					miniValues5[3] = newy; //y position
					miniValues5[4] = 1; //general depth, some objects can set this to 0 or other small number if bottom layer

					ds_stack_push(o_generatorNStepNew.objectStack, instCopy5.id);
					ds_map_add(global.minimapVar, instCopy5, miniValues5);
					ds_list_add(global.activemm, instCopy5); //add it to list of active minimap symbols
				
					if(clipType == 1){
						scr_clipping_primary(instCopy5, true);
						if(!instance_exists(instCopy5))
							instance_destroy(self);
					}if(clipType == 2)
						scr_clipping_secondary(instCopy5, true);
					if(clipType == 3)
						scr_clipping_special(instCopy5, true);
					if(clipType == 4)
						scr_clipping_special(instCopy5.instFloor, true);
					
					if(instance_exists(instCopy5)){
						if(object_index == o_lake){
							ds_queue_enqueue(global.bigLakeIDQ, instCopy5);
							with(o_generatorNStepNew){ds_queue_enqueue(activationQueue, instCopy5.id);}
						}
						else{
							with(o_generatorNStepNew){ds_queue_enqueue(floorQueue, instCopy5.id);}
						}
					}
				}
			}
		}
	
		//x-=500;
	}


}
