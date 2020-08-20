//damage tick
if(damageTickStatus == 1)//poison
	rabbit_health -= 0.5;
else if(damageTickStatus == 2)//fire
	rabbit_health -= 0.2;
damageTick = true;
alarm[11] = 25;