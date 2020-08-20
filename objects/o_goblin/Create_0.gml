alarm[0] = 30;

image_angle = irandom_range(0,360);

if(irandom_range(0,1) == 0)
	sprite_index = s_goblin_idle_1;
	
mode = 0; // 0 = idle, 1 = circle player, 2 = chase player, 3 = bounce player, 4 = circle other way, 5 dead

anim = 0;

canHit = true;
enemy_health = 7;
healthMax = 7;
deathAngle = 0;