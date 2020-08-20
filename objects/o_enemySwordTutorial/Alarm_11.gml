//also update the x position lists just so its not that often
var idVar = ds_list_find_index(global.enemyInstList, id);
ds_list_replace(global.enemyXList, idVar, x);
ds_list_replace(global.enemyYList, idVar, y);




var near = instance_nearest(x,y,o_effect_fire);
if(damageTickStatus!=2 && ((near != noone && point_distance(x,y,near.x,near.y) < 20) && irandom_range(0,5) == 0 && near.z < 6)) 
	damageTickStatus = 2;
	
var nearFlare = instance_nearest(x,y,o_effect_flare);
if(damageTickStatus != 2 && ((nearFlare != noone && point_distance(x,y,nearFlare.x,nearFlare.y) < 20) && nearFlare.z < 6)) 
	damageTickStatus = 2;

///@description damage tick
if(damageTickStatus != 0) {
	if(damageTickStatus == 1)//poison
		enemy_health -= 0.5;
	else if(damageTickStatus == 2){//fire
		enemy_health -= 0.75;
		if(!freakOut){
			freakOut = true;
			playerDetected = false;
			alarm[1] = 1;
		}
	}else if(damageTickStatus == 3){//bleed
		enemy_health -=0.20;
	}
	
	if(damageTickStatus == 2){//fire
		var flame1 = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
		var flame2 = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
		var flame3 = instance_create_depth(x+irandom_range(-6,6),y+irandom_range(-6,4),depth-1, o_effect_fire);
		flame1.z = 14;
		flame2.z = 14;
		flame3.z = 14;
		
		if(irandom(99) <5){
			freakOut = false;
			damageTickStatus = 0;
		}
	}
	else if(damageTickStatus == 1){
		repeat(10) {
			var tick = instance_create_depth(x+irandom_range(-4, 4),y+irandom_range(-4, 4),depth-1,o_blood);
			tick.isPoison = true;
			tick.z = irandom_range(0, 15);
			tick.image_angle = point_direction(0,0, xdir, ydir);
			tick.depth = depth - 1;
		}
	}else if(damageTickStatus == 3){
		repeat(10) {
			var tick = instance_create_depth(x+irandom_range(-4, 4),y+irandom_range(-4, 4),depth-1,o_blood);
			tick.z = irandom_range(0, 15);
			tick.image_angle = point_direction(0,0, xdir, ydir);
			tick.depth = depth - 1;
		}
		
		bleedingTimer++;
		if(bleedingTimer >= choose(9,10,11,12,13,14)){
			damageTickStatus = 0;
			bleedingTimer = 0;	
		}
		//show_debug_message("bleeding");
		/*
		if(irandom(99) < 10){
			damageTickStatus = 0;
		}*/
	}
	alarm[11] = 60;
}
/*
if(damageTickStatus == 1)//poison
	enemy_health -= 0.5;
else if(damageTickStatus == 2)//fire
	enemy_health -= 0.2;
damageTick = true;
alarm[11] = 25;
*/