if(irandom_range(0,5) == 0) {
	var stick = instance_create_depth(x,y,depth, o_item);
	stick.item_ = item.stick;
	stick.direction = irandom_range(0,360);
	stick.bounce = true;
}

if(irandom_range(0,5) == 0) {
	var metal = instance_create_depth(x,y,depth, o_item);
	metal.item_ = item.metal;
	metal.direction = irandom_range(0,360);
	metal.bounce = true;
}


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