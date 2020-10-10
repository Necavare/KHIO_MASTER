// Inherit the parent event
event_inherited();

if(irandom_range(0,2) == 0 && !global.generatingEnvironment) {
	// Creates item
	var metal = instance_create_depth(x,y,depth, o_item);
	metal.item_ = item.bones;
	metal.direction = irandom_range(0,360);
	metal.bounce = true;
}