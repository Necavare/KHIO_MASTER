//currently needs something here but since theirs not even a way to destroy them yet so,
// IM NOT DOING IT YET AND NOONE CAN STOP ME MUAHAHAHAHAHAHAHAHAHAHA
o_hud.markerX[index] = -1; //set map x position
o_hud.markerY[index] = -1; //set map y position
o_hud.markerCol[index] = -1; //set color
if(o_hud.selectedMarkerIndex == index)
	o_hud.selectedMarkerIndex = 0; //make it the selected marker
if(o_hud.markerLibrarySelectedIndex == index)
	o_hud.markerLibrarySelectedIndex = 0;

// Creates item
var stick = instance_create_depth(x,y,depth, o_item);
stick.image_index = item.stick;
stick.direction = irandom_range(0,360);
stick.bounce = true;
stick.item_count = irandom_range(0,2);

// Creates item
var grass = instance_create_depth(x,y,depth, o_item);
grass.image_index = item.grass;
grass.direction = irandom_range(0,360);
grass.bounce = true;
grass.item_count = irandom_range(0,2);