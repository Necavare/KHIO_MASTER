//********************************************
//find the top and bottom of the chunk to load
//********************************************
//find the chunk and set it to refresh
var chunkV = scr_refresh_update(x,y);
var topY = 0;
var topX = 0;
var bS = 16;
//var gridXSize = ds_grid_width(global.smallChunkGrid);
//var gridYSize = ds_grid_height(global.smallChunkGrid);
var chunkSize = room_width/global.blockXNum;

//var objStack = ds_stack_create();

//************************
//      normal loop
//************************

var iv = 0;
//find the bx and by values from the i value
for(var bx2 = 0; bx2 < global.blockXNum; bx2++){
	for(var by2 = 0; by2 < global.blockYNum; by2++){
		if(chunkV == iv){
			topX = bx2*chunkSize;
			topY = by2*chunkSize;
		}
		iv++;
	}
}

/*
if(chunkV < 5){//bx = 0
	topX = 0;
	topY = chunkV*chunkSize;
}
else if(chunkV < 10){//bx = 1
	topX = chunkSize;
	topY = (chunkV-5)*chunkSize;
}
else if(chunkV < 15){//bx = 2
	topX = chunkSize*2;
	topY = (chunkV-10)*chunkSize;
}
else if(chunkV < 20){//bx = 3
	topX = chunkSize*3;
	topY = (chunkV-15)*chunkSize;
}
else if(chunkV < 25){//bx = 4
	topX = chunkSize*4;
	topY = (chunkV-20)*chunkSize;
}*/


var fakeX = topX; //fake (original) position
var fakeY = topY;

//real position
x = topX-global.xoffset;//set x and y to the top positions
y = topY-global.yoffset; //(the actual position shouldnt be offset)

//find their old positions by going backwards with offset
if (y < 0) { y += room_height; }
if (y >= room_height) { y -= room_height; }
if (x < 0) { x += room_width; }
if (x >= room_width) { x -= room_width; }

/*ow_debug_message("----------------------------------------");
show_debug_message("	playerX: "+string(o_player.x));
show_debug_message("	playerY: "+string(o_player.y));
show_debug_message("	xOffset: "+string(global.xoffset));
show_debug_message("	yOffset: "+string(global.yoffset));
show_debug_message("     x: "+string(x));
show_debug_message("     y: "+string(y));
show_debug_message("	 fakeX: "+string(fakeX));
show_debug_message("	 fakeY: "+string(fakeY));
show_debug_message("	 generating chunk: "+string(chunkV));
show_debug_message("	blockXNum = "+string(global.blockXNum));
show_debug_message("	blockYNum = "+string(global.blockYNum));
show_debug_message("----------------------------------------");*/

birch = false;//initialize biome values
spruce = false;

while(fakeY<(topY+chunkSize))
{
		
		//make sure it wraps around
		if (y < 0) { y += room_height; }
		if (y >= room_height) { y -= room_height; }
		if (x < 0) { x += room_width; }
		if (x >= room_width) { x -= room_width; }
		
		//find the biome value of the block
		var biomeArrayC = global.biomeArray[(fakeX)/16, fakeY/16];
		if(biomeArrayC==0){
			birch = false;
			spruce = false;
		}
		if(biomeArrayC==1){
			birch = false;
			spruce = true;
		}
		if(biomeArrayC==2){
			birch = true;
			spruce = false;
		}
		if(biomeArrayC==3){
			birch = true;
			spruce = true;
		}
		//check for making sure not to draw left of the mountains
		//currently mountains dont exist so just start generating
		//if(position_meeting(x,y,o_cliff))
	
		
			#region foundational elements
		
			//***********************************************
			// foundation elements(only grass and lakes atm)
			//***********************************************
			var groundOdds = irandom(99);
		
			var grassPatch = false;
			//creating grass (20% with additional odds (30%) added with extra grass around)
			if(groundOdds>93){
			
				//check if theirs no grass or cattail in 1  block radius
				/*
				if(!scr_checkR( bS, 1, o_grass)||!scr_checkR(bS, 1, o_cattail)){
					grassPatch = true;//if no grass in a one block radius	
				}*/
				
				if(!collision_circle(x,y, bS, o_grass, true, true)||!collision_circle(x,y, bS, o_cattail,true, true)){
					grassPatch = true;//if no grass in a one block radius
				}
				if(irandom(99) > 70)
					grassPatch = false;
				var grassO = o_grass;
			
				//create the grass
				if(grassPatch){
					var g1 = instance_create_depth(x, y, 2, grassO);	
					var g2 = instance_create_depth(x+bS, y, 2, grassO);
					var g3 = instance_create_depth(x-bS, y, 2, grassO);
					var g4 = instance_create_depth(x, y-bS, 2, grassO);
					var g5 = instance_create_depth(x, y+bS, 2, grassO);
					//ds_stack_push(objStack, g1);
					//ds_stack_push(objStack, g2);
					//ds_stack_push(objStack, g3);
					//ds_stack_push(objStack, g4);
					//ds_stack_push(objStack, g5);
					
					scr_clipping_special(g1, false);
					scr_clipping_special(g2, false);
					scr_clipping_special(g3, false);
					scr_clipping_special(g4, false);
					scr_clipping_special(g5, false);
				}
			
			
				//if creating lone grass choose wether its a bush and then create it
				else{
					grassO = choose(o_grass,o_bush, o_bush);
					var g6 = instance_create_depth(x,y,2, grassO);
					//ds_stack_push(objStack, g6);
					scr_clipping_special(g6, false);
				}
			}
	
		
			#endregion
			
			#region misc elements
		
			//********************************
			//misc elements (rocks, flowers, etc.)
			//********************************
			//check if a large misc element has already taken up this slot
			//ensure you dont create something on the player (foundation are under player so doesnt matter)
				var miscOdds = irandom(99); // odds to create different objects
				
				//odds of making a rock
				var rockOdds=1;
				//if their are rocks nearby increase likelyhood of making a rock
				//if(scr_checkR(bS, 4, o_rocks)||scr_checkR(bS, 4, o_rock))
				if(collision_circle(x,y,bS*4, o_rocks, true, true)||collision_circle(x,y,bS*4, o_rock, true, true))
					rockOdds+=2;
				if(collision_circle(x,y,bS*3, o_bigrock, true, true))
					rockOdds+=50;
				if(collision_circle(x,y,bS, o_bigrock, true, true))
					rockOdds+=40;
				else if(miscOdds<rockOdds){
					var rockSizeOdds=irandom(99);
					//if their are rocks nearby increase chances of making large/medium rock
					//if(scr_checkR(bS, 4, o_rocks)||scr_checkR(bS, 4, o_rock))
					if(collision_circle(x,y,bS*4,o_rocks, true,true)||collision_circle(x,y,bS*4, o_rock, true, true))
						rockSizeOdds+=20;
					if(rockSizeOdds<60){//60% odds to create small rock
						var moreRocks = choose(2,2,1,1,1,0,0,0); //choose wether to make 3,2 or 1 rocks per square
						while(moreRocks >= 0){
							ranX = irandom(bS-5); //size of small rock is 5
							ranY = irandom(bS-5);
							var objr1=instance_create_depth(x+ranX,y+ranY,1,o_rocks);
							//ds_stack_push(objStack, objr1);
							
							//was secondary
							scr_clipping_special(objr1, false);
							moreRocks--;
						}
					
					}
					if(rockSizeOdds>85){//10% or higher depending on proximity to other rocks 
						//decide what rock to spawn
						//var rockO = choose(o_rock_small, o_rock_small, o_rock_medium, o_rock_large);
						var rockO = o_rock;
					
						//move forward (relative to direction) 1 cell
				
						//randomize spawn location but limited due to arbitrary decision
						var ranX = irandom(bS-10);
						var ranY = irandom(bS-10);
						var objr2 = instance_create_depth(ranX+x, ranY+y, 1, rockO);
						//ds_stack_push(objStack, objr2);
						
						//was primary
						scr_clipping_special(objr2, false);
						
					}
				}
			
				//flowers
				//10% chance put between the max chance the rock can have so it doesnt messs with it
				if((miscOdds>=30)&&(miscOdds<31)&&birch){
					var moreFlowers = choose(2,2,1,1,1,0,0,0); //choose wether to make 3,2 or 1 flowers per square
					while(moreFlowers >= 0){
							var ranFX = irandom(bS); //size of lily of the vally 8x9
							var ranFY = irandom(bS);
							var objflower=instance_create_depth(x+ranFX,y+ranFY,1,o_lillyofthevalley);
							//ds_stack_push(objStack, objflower);
							
							//was primary
							scr_clipping_special(objflower, false);
							moreFlowers--;
						}
				}
				
				#endregion

			#region npc's
		
			//spawning animals
			var animalOdds = irandom(99);
			//if(scr_checkR(bS,1, o_rabbit) || scr_checkR(bS, 1, o_squirrel)){
			if(collision_circle(x,y,bS, o_rabbit, true,true) || collision_circle(x,y,bS, o_squirrel, true, true)){
				miscOdds+=15;//if rabbits are in a 1 block distance increase odds to spawn by 15%	
			}
			if((animalOdds > 98)&&(spruce)){//spawn a single or couple squirrels
				ranX = irandom(bS-5);
				ranY = irandom(bS-5);
			
				var moreSquirrel = choose(2,2,1,1,1,1,1,1)
				while(moreSquirrel > 0){
					var objSquirrel = instance_create_depth(x+ranX, y+ranY, 1, o_squirrel); //spawn squirrel
					scr_clipping_secondary(objSquirrel, true);
					moreSquirrel--;
				}
			
			}
		
			if((animalOdds > 99) && (birch)){//spawn a rabbit HORDE
			
				//random x and y positions for the rabbit to spawn at in the square
				ranX=irandom(bS-5); //depends on size of rabbit in this case well say 6
				ranY=irandom(bS-5); 
			
				var moreRabbits = choose(3,3,3,2,2,2,2,2,2,1,1,1,1);
				while(moreRabbits > 0){
					var objRabbit=instance_create_depth(x+ranX,y+ranY,1, o_rabbit); //spawn that rabbit
					scr_clipping_secondary(objRabbit, true);
					moreRabbits--;
				}
			}
		
			#endregion
	
	
	x+=bS; // move on to next square
	fakeX+=bS;
	//if x reaches its max (offset of 500)
	if(fakeX>=(topX+chunkSize)){	
		y+=bS;
		fakeY+=bS;
		x=topX-global.xoffset;
		fakeX=topX;
	}
}

with(o_grass){
	//if(scr_checkR(bS,3,o_lake) || scr_checkR(bS,3,o_pond)){
	if(collision_circle(x,y,bS*3, o_lake, true, true)||collision_circle(x,y,bS*3, o_pond, true, true) 
	|| collision_circle(x,y,bS*3, o_pond2, true, true)){
		var objCatTail = instance_create_depth(x,y,depth,o_cattail);
		//ds_stack_push(objStack, objCatTail);
		instance_destroy(self);
	}
}

//clean out obj stack

/*
while(!ds_stack_empty(objStack)){
	var instId = ds_stack_pop(objStack);
	instance_activate_object(instId);
	
	with(instId){
		//add its id to the list within the proper small (16x16) chunk block
		var floorX = floor(x/16);
		var floorY = floor(y/16);
		if(floorX >= gridXSize){floorX = floorX-gridXSize;}
		else if(floorX < 0){floorX = gridXSize+floorX;}
		if(floorY >= gridYSize){floorY = floorY-gridYSize;}
		else if(floorY < 0){floorY = gridYSize+floorY;}
		ds_list_add(ds_grid_get(global.smallChunkGrid, floorX, floorY) , id);
	}
}*/

global.chunkLoaded[chunkV] = true;
instance_destroy(self);