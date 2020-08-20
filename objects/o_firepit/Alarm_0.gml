///@description Burning logs
if(isLit && logCount > 0) {
	logCount--;
	
	if(logCount <= 0)
		hotCoals = true;
} else if(logCount <= 0) {
	alarm[0] = -1;
	logCount = 0;
	isLit = false;
	hotCoals = true;
}