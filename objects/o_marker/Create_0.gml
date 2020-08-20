if(!global.generatingEnvironment){
index = -1;
if(global.buildangle != -1) {
	image_angle = global.buildangle;
	global.buildangle = -1;
}

//setting marker variable
if(!global.loadingWorld && !global.generatingEnvironment){
for(var i = 0; i < 10; i++){
	if(o_hud.markerX[i] == -1){ //if a marker does not exist at that point of the array
			var xscale = o_hud.mapWidth/room_width;
			var yscale = o_hud.mapHeight/room_height;
			var xposp = (x)*xscale;
			var yposp = (y)*yscale;
			
			o_hud.markerX[i] = xposp; //set map x position
			o_hud.markerY[i] = yposp; //set map y position
			//var markerColorT = $8E8ECC; //red CC8E8E
			var markerColorT = 4;//red
			o_hud.markerCol[i] = markerColorT; //set color
			o_hud.selectedMarkerIndex = i; //make it the selected marker
			o_hud.markerLibrarySelectedIndex=i;
			index = i;
			break; //leave loop youve done all you need
	}
}
}

if(index = -1)
	instance_destroy(self);//if it doesnt fit the array anywhere, destroy it
}

color = 1;

frame = 0;
alarm[0] = 5;

z = 32;
markerColor = $AFCC9F; //green

editNameSelected = false;
deleteFull = false;

options = false;
optionsX = -1;
optionsY = -1;
mouseX = -1;
mouseY = -1;

buildZ = -image_number

health_ = 3;
canHit = true;