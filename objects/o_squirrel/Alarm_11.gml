//damage tick
if(damageTickStatus == 1)//poison
	squirrel_health -= 0.5;
else if(damageTickStatus == 2)//fire
	squirrel_health -= 0.2;
damageTick = true;
alarm[11] = 25;