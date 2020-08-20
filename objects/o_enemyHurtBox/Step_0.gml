if(img_index == 0){
	sprite_index = s_hurtBox_down;
	mask_index = s_hurtBox_down;
}else if(img_index == 1){
	sprite_index = s_hurtBox_down_right;
	mask_index = s_hurtBox_down_right;	
}
else if(img_index == 2){
	sprite_index = s_hurtBox_right;
	mask_index = s_hurtBox_right;
}
else if(img_index == 3){
	sprite_index = s_hurtBox_up_right;
	mask_index = s_hurtBox_up_right;	
}
else if(img_index == 4){
	sprite_index = s_hurtBox_up;
	mask_index = s_hurtBox_up;	
}
else if(img_index == 5){
	sprite_index = s_hurtBox_up_left;
	mask_index = s_hurtBox_up_left;	
}
else if(img_index == 6){
	sprite_index = s_hurtBox_left;
	mask_index = s_hurtBox_left;	
}
else if(img_index == 7){
	sprite_index = s_hurtBox_down_left;
	mask_index = s_hurtBox_down_left;	
}
image_alpha = 0.5;

if(place_meeting(x,y,o_player) && !o_player.isRolling &&!global.watchTower){
	var xHurt = x;
	var yHurt = y;
	var trueHit = true;
	with(o_player_hitBox){
		var angleToHurt = point_direction(x,y,xHurt, yHurt)+global.camera_angle;
		if(angleToHurt < 0)
			angleToHurt = 360+angleToHurt;
		else if(angleToHurt > 360)
			angleToHurt = angleToHurt-360;
		if((angleToHurt > 45) && (angleToHurt < 135) && (instance_exists(o_tool) && o_tool.isBlocking))
			trueHit = false;
	}
	if(trueHit){
			//audio_play_sound(sn_goodhit,0,0);
			//audio_play_sound(sn_goodhit,0,0);
			//audio_play_sound(sn_goodhit,0,0);
			o_player.isBleeding = true;
			o_player.health_-=15*o_player.armor;
			instance_destroy(self);
			o_player.isHit = true;
			o_player.objectHitting = self;
	}
	else if(damageType == 1){//if its a heavy attack ignore block
		o_player.isHit = true;	
		o_player.objectHitting = self;
		//audio_play_sound(sn_goodhit,0,0);
		o_player.isBleeding = true;
		//var injureChance = irandom(99);
		//reduced chance of injury
		
		if(trueHit){//if not blocking
			o_player.health_-=25*o_player.armor;
			
			// Only injure if not blocking and no armor
			if(o_player.armor == 1)
				o_player.isInjured = true;
		}else{
			o_player.health_-=5*o_player.armor;//do some small chip damage
			audio_play_sound(sn_block_hit, 1, 0);
		}
		
		//set something here for "shield breaking"
		//o_tool.isBlocking = false;
		
		instance_destroy(self);
	}
}
