//randomize the seed
randomize();

/*
//starting at the top left
x=500;
y=0;

//var groundV = layer_get_id("Ground");
while(y<room_height){
	
	//instance_create_layer(x,y, groundV, o_snow_texture);
	instance_create_depth(x,y, 1, o_snow_texture);
	x+=250; // move on to next square
	//if x reaches its max
	if(x>=(room_width+500)){
		y+=250;
		x=0;
	}
}*/


//********************************************************************************************
//ALL OCEAN AND MOUNTAIN CREATION IS CURRENTLY SCRAPPED BUT CODE WILL BE SAVED HERE IN COMMENT
//********************************************************************************************
/*
var oycl = 0;
var xbot = 0;
var angx = 0;

var oxcl = 0;
var yright = 0;
var angy = 270;

//create left mountains (resetting variables)
var loopI = 0;
var prevX = 0;
var cliffPeak = false;
while(loopI < room_height){
		
	//creating the mountains
	var xcl = irandom(150);
	if(irandom(3)==0&&prevX<200)
		cliffPeak = true;
	if(prevX > 350)
		cliffPeak = false;
	if(cliffPeak){
		xcl=prevX+(xcl/2);
		if(irandom(4)==0)
			cliffPeak = false;	
	}
	if(!cliffPeak&&(prevX>180)){
		xcl=prevX-(xcl/3);
	}
	
	
	prevX = xcl;
	var cliff = instance_create_depth(xcl,y, 100, o_cliff);
	//scr_random_angle(cliff);
	scr_clipping_primary(cliff);
	
	//setting variables
	y+=150;
	loopI+=150;
}

//create top mountains (resetting variables)
x = 0;
loopI = 0;
var prevY = 0;
cliffPeak = false;
while(loopI < room_width){
	//creating the mountains
	var ycl = irandom(150);
	if(irandom(3)==0&&prevY<200)
		cliffPeak = true;
	if(prevY > 350)
		cliffPeak = false;
	if(cliffPeak){
		ycl=prevY+(ycl/2);
		if(irandom(4)==0)
			cliffPeak = false;	
	}
	if(!cliffPeak&&(prevY>180)){
		ycl=prevY-(ycl/3);
	}
	
	prevY = ycl;
	var cliff = instance_create_depth(x, ycl, 100, o_cliff);
	//scr_random_angle(cliff);
	scr_clipping_primary(cliff);

	//setting variables
	x+=150;
	loopI+=150;
}

//create right side ocean (resetting variables)
var rightOceanNum = 0;
while(rightOceanNum < 50){
	//create ocean
	var ocean = instance_create_depth(room_width+oxcl-300, yright, 8000, o_ocean);
	if(oxcl < 0){
		angx = choose(angx+2, angx+1);
	}
	if(oxcl > 100){
		angx = choose(angx-2, angx-3, angx-1);	
	}
	else{
		angx = choose(angx, angx-1, angx+2);
	}
	oxcl += lengthdir_x(100, angx-90);
	yright += lengthdir_y(100, angx-90);
				
	ocean.image_angle = angx;
	scr_clipping_primary(ocean);
	
	//setting variables
	rightOceanNum++;
}

//create bottom side ocean (resetting variables
var botOceanNum = 0;
while(botOceanNum < 50){
	//create ocean
	var ocean = instance_create_depth(xbot, room_height+oycl-300, 8000, o_ocean);
	if(oycl < 0){
		angy = choose(angy-2, angy-1);
	}
	if(oycl > 100){
		angy = choose(angy+2, angy+3, angy+1);	
	}
	else{
		angy = choose(angy, angy+1, angy-2);
	}
	
	xbot += lengthdir_x(100, angy+90);
	oycl += lengthdir_y(100, angy+90);
				
	ocean.image_angle = angy;
	scr_clipping_primary(ocean);
	
	//setting variables
	botOceanNum++;
}
*/

show_debug_message("here");
//global.loading = true;
//instance_create_layer(0,0,layer_get_id("Player"), o_generatorN);
//instance_create_layer(0,0,layer_get_id("Player"), o_generatorNStep);
instance_create_layer(0,0,layer_get_id("Player"), o_generatorNStepNew);


//room_goto(r_title);
//room_goto(r_loading);

//instance_create_layer(0,0,layer_get_id("Player"),o_generatorNStep);
//instance_create_layer(0,0,layer_get_id("player"), o_generatorNTester);

instance_destroy(self);