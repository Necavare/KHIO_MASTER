function item_notification() {
	var item_ = argument[0];
	
	global.notifications++;
	
	global.pickedup = item_;

	var current = instance_create_depth(x,y,0,o_pickup_not);
	
	//global.previous_not = current;


}
