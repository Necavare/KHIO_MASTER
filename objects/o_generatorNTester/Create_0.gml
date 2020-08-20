//it is currently generating the envornment
global.generatingEnvironment=true;
global.extraInst = ds_list_create();

var bS=16; //block size

//starting at the top left again
x = 0;
y = 0;

var startGenerating = false;
//while the instance is within the room
//loops moving to the right then when it reaches the end goes down
	//check for making sure not to draw left of the mountains
	//currently mountains dont exist so just start generating
	//if(position_meeting(x,y,o_cliff))
		startGenerating = true;
	
		
		#region foundational elements
		
		//********************************
		//foundation elements(only grass and lakes atm)
		//********************************
	
		var lakeO = instance_create_depth(100,100,8000, o_lake);
		scr_clipping_primary(lakeO, false);
	
		#endregion
		
			
//it is no longer generating environment
global.generatingEnvironment=false;

//once it has served its purpose the generator commits ritual suicide
instance_destroy(self);

