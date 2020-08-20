///@description Smelting ore
if(items[# 0, 0] == item.compound && count[# 0, 0] > 0) {
	count[# 0, 0]--;
	
	if(irandom_range(0,5) == 1)
		isSulfur++;
	else 
		isMetal++;
		
	alarm[3] = -1;
} 