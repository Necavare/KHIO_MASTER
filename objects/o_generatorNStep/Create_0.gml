//it is currently generating the envornment


global.generatingEnvironment=true;
global.extraInst = ds_list_create();
global.canMove = false;

//set offset so that i can create intiial place correct (note from the future of this, ????????)
global.xoffset = 500;

bS=16; //block size

#region create biome layout

#region initialize biome array

//starting at the top left
x = 0;
y = 0;

//set biome array variables
global.biomeArray[0,0] = 0;
while(y <= room_height){
	arrayY = y/bS;
	arrayX = x/bS;
	global.biomeArray[arrayX, arrayY] = 0;
	x+=16;
	if(x > room_width){
		x = 0;
		y+=16;
	}
}
#endregion

//starting at top left AGAIN
x = 0;
y = 0;
//0 = none, 1 = spruce, 2 = birch, 3 = both

biomeCreationOdds = 0;
var checkNum = random_range(0,120);

var previousBiome = 0;
var currentBiome = 0;

while(y <= room_height){
	arrayY = y/bS;
	arrayX = x/bS;
	
	if(biomeCreationOdds>=checkNum){
		//show_debug_message("CURRENT BIOME : " + string(currentBiome));
		
		var biomeType = scr_checkRBiome(global.biomeArray, arrayX, arrayY, 3, currentBiome);
		
		if(biomeType = 0){//if 1 or 2 is not nearby then choose one
		    //show_debug_message("found 0");
			if(previousBiome == 1){
				biomeType = choose(2,2,2,1);
			}
			if(previousBiome == 2){
				biomeType = choose(1,1,1,2);	
			}
			else
				biomeType = choose(1,2);
		}
		if(biomeType == 1){
			//show_debug_message("found 1");
			global.biomeArray[arrayX,arrayY] = 1;
		}
		else{ 
			//show_debug_message("found 2");
			global.biomeArray[arrayX,arrayY] = 2;
		}
		//show_debug_message("-----------------------");
		//show_debug_message(" { ...");
		scr_generateBiome2(global.biomeArray, arrayX, arrayY, biomeType, 150);
		//show_debug_message(" ... }");
		//biomeArray = scr_generateBiome(biomeArray, arrayX, arrayY, biomeType);
		checkNum = random_range(0,120);
		biomeCreationOdds = 0;
		previousBiome = currentBiome;
		
		currentBiome = biomeType;
		//show_debug_message("CURRENT BIOME : " + string(currentBiome));
	}
	else{
		global.biomeArray[arrayX,arrayY] = 0;
	}
	
	
	biomeCreationOdds += 0.8;
	
	x+=16;

	if(x >room_width){
		x = 0;
		y+=16;
	}

}
#endregion

//reset x and y AGAIN AGAIN
x = 500;
y = 0;


//while the instance is within the room
//loops moving to the right then when it reaches the end goes down

//biomes (cant be variables because other objects reference it)
birch = false;
spruce = false;

//used for finding the angle of the wall generated
generatorWallAngle = 0;

show_debug_message("generating elements");

//step event for everything else





dynamicDeactivationTick = 0;

//step offset for instance_activate_all
instanceActivateOffset = 0;

//initial activation
instance_activate_region(-1,-1, 525,525, true);//activate loading section
instance_activate_region(x, y-250, 500, 500, true);//activate generator section
