var nextTip = -1;

while(nextTip == -1 || nextTip == tipNumber) {
	nextTip = irandom_range(0, array_length_1d(tips)-1);
}

if(nextTip != tipNumber) {
	tipNumber = nextTip;
}

alarm[9] = 60*5;