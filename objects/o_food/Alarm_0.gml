if(!down && isEating && z < startingZ + 2)
	z++;
else
	down = true;
	
if(down && isEating && z > startingZ - 2)
	z--;
else
	down = false;

if(isEating)
	alarm[0] = 3;