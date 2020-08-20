/*if(o_player.nearWarmth && global.temperature > 20) {
	if(o_player.slightlyWarm)
		global.temperature = 10;
	else
		global.temperature = 20;
}

if((o_player.nearWarmth || o_player.slightlyWarm) && global.temperature < 20) {
	var ran = irandom_range(0,4)
	switch(ran) {
		case 0: global.temperature += .25;
		case 1: global.temperature += .5;
		case 2: global.temperature += 1;
		case 3: global.temperature += 1.5;
		case 4: global.temperature += 2;
	}
} else if(!o_player.nearWarmth) {

	o_player.isWarm tempMax = 
*/
if(room != r_title) {
	if(o_player.isWarm)
		tempMax = 20;
	else if(o_player.slightlyWarm)
		tempMax = 10;
	else if(!o_weather.isSnowing)
		tempMax = 0;
	else if(o_weather.isSnowing)
		tempMax = -8;

	// Changing temperature
	if(global.hour >= 7 && global.hour <= 19 && global.temperature < tempMax || (o_player.isWarm || o_player.slightlyWarm)) {
		var ran = irandom_range(0,4)
		switch(ran) {
			case 0: global.temperature += .25;
			case 1: global.temperature += .5;
			case 2: global.temperature += 1;
			case 3: global.temperature += 1.5;
			case 4: global.temperature += 2;
		}
	}

	if((global.hour < 7 || global.hour > 19) && global.temperature > tempMin && !o_player.isWarm && !o_player.slightlyWarm) {
		var ran = irandom_range(0,4)
		switch(ran) {
			case 0: global.temperature -= .01;
			case 1: global.temperature -= .05;
			case 2: global.temperature -= .1;
			case 3: global.temperature -= .15;
			case 4: global.temperature -= .5;
		}
	}

	if(global.temperature < tempMin)
		global.temperature = tempMin
		
	if(global.temperature > tempMax)
		global.temperature = tempMax
}