if(!playerHello){
	//walking alarm
	startedMoving = true;
	isRunning = false;
	isWalking = true;
	isIdle = false;
	p_speed = 0.2;
	xdir = 1; //cus their is some direction (treat it like true false)
	ydir = 1;
	move_dis = 10000;
	move_dir = set_move_dir*move_var;
	move_var = move_var * -1;
}
/*
if(freakOut){
	startedMoving = true;
	isRunning = true;
	isWalking = false;
	isIdle = false;
	p_speed = 0.8;
	xdir = 1;
	ydir = 1;
	move_dis = 10000;
	move_dir = irandom(359);
	alarm[1] = irandom_range(15, 30);
}
else{*/
	//when he starts walking again
	alarm[1] = irandom_range(400, 600);

	//when he starts standing still
	alarm[2] = irandom_range(140,300);
//}