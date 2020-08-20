instRoof = instance_create_depth(x,y,depth,o_house_roof);
roofPointer = instRoof.id;
housePointer = pointer_null;

doorPointer = pointer_null;
backPointer = pointer_null;
sideLPointer = pointer_null;
sideRPointer = pointer_null;

doOnce = true;

if(global.generatingEnvironment && !global.loading && room != r_testing)
	ds_queue_enqueue(o_generatorNStepNew.floorHouseQueue, id);
/*
instance_destroy(doorPointer);
instance_destroy(backPointer);
instance_destroy(floorPointer);
instance_destroy(sideLPointer);
instance_destroy(sideRPointer);
*/


//this is actually more complicated then it looks
// it needs to be created here so it can read what it is and change it as such but it
// also needs to creat e minimap version in time which means one step event essentialy