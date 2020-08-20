/// @description Running/Stamina

// If the player is running then lose stamina otherwise gain stamina.
if(isRunning && stamina > 0){
	stamina -= 5;
	if(global.headEquipped != -1){
		//58 is wood facemask
		if(global.headEquipped == 58){
			stamina -= 1;
		}
		//61 is metal facemask
		if(global.headEquipped == 61){
			stamina -= 2;
		}
	}
	if(global.bodyEquipped != -1){
		//59 is wood chest
		if(global.bodyEquipped == 59){
			stamina -= 1;
		}
		//60 is metal chest
		if(global.bodyEquipped == 60){
			stamina -= 2;
		}
	}
}
else if(stamina < 100 && !isRunning && hunger_ >= 0)
	stamina += 10;
else if(stamina < 100 && !isRunning && isSitting && hunger_ >= 0)
	stamina += 20;
	
if(stamina > 100)
	stamina = 100;
if(stamina < 0)
	stamina = 0;

alarm[1] = 60;