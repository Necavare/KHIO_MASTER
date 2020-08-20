// oner ride
if(!global.generatingEnvironment) {
	instance_create_depth(x,y,depth,o_blood_spot);
	
// Creates meat item
var meat = instance_create_depth(x,y,depth, o_item);
	meat.image_index = item.human;
	meat.direction = irandom_range(0,360);
	meat.bounce = true;
	meat.item_count = irandom_range(3,6);
	meat.durability = 11;
			
// Create bone item
var bone = instance_create_depth(x,y,depth, o_item);
	bone.image_index = item.bones;
	bone.direction = irandom_range(0,360);
	bone.bounce = true;
	bone.item_count = irandom_range(4, 8);
	
// Dropping inventory
for(var ix = 0; ix < width; ix++)
	for(var iy = 0; iy < height; iy++)
		if(items[# ix, iy] > 0) {
			var item_ = instance_create_depth(x,y,depth, o_item);
			item_.image_index = items[# ix, iy];
			item_.direction = irandom_range(0,360);
			item_.bounce = true;
			item_.durability = durability[# ix, iy];
			item_.item_count = count[# ix, iy];
		}
}