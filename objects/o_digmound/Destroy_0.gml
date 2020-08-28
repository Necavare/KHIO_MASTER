var idn = -1;
for(i = 0; i < ds_list_size(global.moundPointerList); i++){
	if(ds_list_find_value(global.moundPointerList, i) == id){
		idn = i;
		i = ds_list_size(global.moundPointerList);
	}
}
ds_list_delete(global.moundPointerList, idn);
ds_list_delete(global.moundTypeList, idn);
ds_list_delete(global.moundXList, idn);
ds_list_delete(global.moundYList, idn);

if(!global.generatingEnvironment){
	var snow = instance_create_depth(x,y,depth, o_item);
	snow.item_ = item.snowball;
	snow.item_count = irandom_range(0,3);
	snow.direction = irandom_range(0,360);
	snow.bounce = true;

	var stick = instance_create_depth(x,y,depth, o_item);
	stick.item_ = item.stick;
	stick.item_count = choose(0,1,1,2,3,4,5);
	stick.direction = irandom_range(0,360);
	stick.bounce = true;

	var metal = instance_create_depth(x,y,depth, o_item);
	metal.item_ = item.metal;
	metal.item_count = choose(0,1,1,2,3,4,5);
	metal.direction = irandom_range(0,360);
	metal.bounce = true;

	if(isTreasure) {
		var weapon = instance_create_depth(x,y,depth, o_item);
		var chance = choose(0,0,0,1,1,1,1,1,2,2,2,2);
	
		if(chance == 0)
			weapon.item_ = item.rifle;
		else if(chance == 1)
			weapon.item_ = item.sword;
		else if(chance == 2)
			weapon.item_ = item.shotgun;
	
		weapon.direction = irandom_range(0,360);
		weapon.bounce = true;
	
		if(chance == 0) {
			var ammo = instance_create_depth(x,y,depth, o_item);
			ammo.item_ = item.rifleammo;
			ammo.item_count = irandom_range(2,6);
			ammo.direction = irandom_range(0,360);
			ammo.bounce = true;
		}
	
		if(chance == 2) {
			var ammo = instance_create_depth(x,y,depth, o_item);
			ammo.item_ = item.buckshot;
			ammo.item_count = irandom_range(2,6);
			ammo.direction = irandom_range(0,360);
			ammo.bounce = true;
		}
	}
	
}