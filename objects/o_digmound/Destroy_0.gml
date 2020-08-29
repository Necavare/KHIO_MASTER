var bone = instance_create_depth(x,y,depth, o_item);
bone.item_ = item.bones;
bone.item_count = choose(0,0,0,1,1);
bone.direction = irandom_range(0,360);
bone.bounce = true;

var bullet = instance_create_depth(x,y,depth, o_item);
bullet.item_ = item.rifleammo;
bullet.item_count = choose(0,0,0,0,0,0,0,1,1);
bullet.direction = irandom_range(0,360);
bullet.bounce = true;

var metal = instance_create_depth(x,y,depth, o_item);
metal.item_ = item.metal;
metal.item_count = choose(0,0,0,0,0,0,0,1,1);
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
		ammo.item_count = irandom_range(1,4);
		ammo.direction = irandom_range(0,360);
		ammo.bounce = true;
	}
	
	if(chance == 2) {
		var ammo = instance_create_depth(x,y,depth, o_item);
		ammo.item_ = item.buckshot;
		ammo.item_count = irandom_range(1,4);
		ammo.direction = irandom_range(0,360);
		ammo.bounce = true;
	}
}