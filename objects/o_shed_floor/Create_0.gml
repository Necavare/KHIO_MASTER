instRoof = instance_create_depth(x,y,depth,o_shed_roof);
shedPointer = pointer_null;

//show_debug_message("generatingEnvironment : "+string(global.generatingEnvironment));
if(global.generatingEnvironment && !global.loading && room != r_testing)
	ds_queue_enqueue(o_generatorNStepNew.floorHouseQueue, id);
	
// Flammable stuff
health_ = 6;
healthMax = health_;
birchFlame = true;
z = 0;

event_inherited();