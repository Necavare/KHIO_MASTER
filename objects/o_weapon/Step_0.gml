//rmeove cursor if holding weapon period


audio_emitter_position(weapon, x, y, 0);

if(window_mouse_get_y() > window_get_height()/2 && !global.isInventoryOpen)
	window_mouse_set(window_mouse_get_x(), window_get_height()/2);

if(o_player.isDead || o_player.isDying || o_player.isSitting || o_player.isSleeping)
	instance_destroy(self);

// Moving object towards player
x += (o_player.x-x)*.6;	
y += (o_player.y-y)*.6;  

depth= o_player.depth+1;

if(!global.isInventoryOpen) {
// save the ammo total
if(weaponMode == 0)
	ds_map_replace(global.weaponAmmo, item.rifle, ammo);
else if(weaponMode == 1)
	ds_map_replace(global.weaponAmmo, item.shotgun, ammo);
else if(weaponMode == 2)
	ds_map_replace(global.weaponAmmo, item.crossbow, ammo);



// Bobbing
if(o_player.bob)
	z = 18;
else
	z = 17;


// Destroying if tool is not in hand slot
// need to find something else to tell if in hand slot or not

//reset pdis offset when paused
if(global.isPaused){
	pdisOffset = 0;
}

if((global.itemEquipped != item.rifle && (weaponMode == 0)) || 
	(global.itemEquipped != item.shotgun && (weaponMode == 1))|| 
	(global.itemEquipped != item.crossbow && (weaponMode == 2)) || global.isInventoryOpen) {
	o_player.isHoldingWeapon = false;
	global.no_angle = false;
	global.isHolding = false;
	global.rifleHolding = false;
	global.isAiming = false;
	instance_destroy(self);
}
if(mouse_check_button(global.M_RIGHT) && !global.isInventoryOpen && !isloading && !keyboard_check(global.K_RELOAD))
{
	target = true;
	global.isAiming = true;
	o_player.isAimingWeapon = true;
}
else{
	o_player.isAimingWeapon = false;
	midOffsetX = 0;
	midOffsetY = 0;
	pdisOffset = 0;
	if(target){
		//window_mouse_set(device_mouse_x_to_gui(0), (display_get_gui_height()/2)-100);
		
		//window_mouse_set(   display_get_gui_width()/2+15, display_get_gui_height()/2-300);
		
		//display_mouse_set(, device_mouse_y_to_gui(0))	
	}
	target = false;
	global.isAiming = false;
}
var imageAng = point_direction(x,y, mouse_x, mouse_y)-90;

var runCode = true;

// if its in windowed mode add a limitation to where the mouse can go

/*
if(!window_get_fullscreen()){
	//if its within 5 pixels of screen do this stuff otherwise dont
	if(display_mouse_get_x()>display_get_width()-10)
		runCode = false;
	if(display_mouse_get_x()<10)
		runCode = false;
	if(display_mouse_get_y()>display_get_height()-5)
		runCode = false;
	if(display_mouse_get_y()<5)
		runCode = false;
}else{
*/
	if(window_has_focus())
		display_mouse_lock(window_get_x(), window_get_y(), window_get_width(), window_get_height());
	//window_mouse_set(clamp(window_mouse_get_x(),0,window_get_width()),clamp(window_mouse_get_y(),0,window_get_height()));
	//window_mouse_set(clamp(window_mouse_get_x(),5,window_get_width()-5),clamp(window_mouse_get_y(),5,window_get_height()-5));	
//}

var degreeshiftp = false; //degree shift plus
var degreeshiftm = false; //degree shift minus

//in case the draw cursor was set false reset it here and check if its still false
global.draw_cursor = true;

#region pointing the gun in the right directions

// Changing camera angle
if(!target && !global.isPaused && !global.isInventoryOpen && !o_player.isRunning && runCode && !options) {
	global.draw_cursor = false;
	
	#region gun angle when not aiming
	
	//if the global.camera_angle is within the glitch range then shift everything and then unshift it
	if(global.camera_angle > 340){
		global.camera_angle -= 180;
		imageAng -= 180;
		degreeshiftm = true;
	}
	if(global.camera_angle < 20){
		global.camera_angle += 180;
		imageAng += 180;
		degreeshiftp = true;
	}
	if(imageAng < 0)
		imageAng = 360+imageAng;
	if(imageAng > 360)
		imageAng = imageAng-360;
	
	//works if offset is positive
	var displacement = 0;
	var angleOffsetRev = global.camera_angle-360;
	if( (imageAng < (350-global.camera_angle))){
		displacement = (window_mouse_get_x() - (window_get_width()/2)) * .0025;
		global.camera_angle += displacement;
		if(displacement > 0){//moving right
			imageAng = 350-global.camera_angle;
		}
		else if(displacement < 0){//moving left
			imageAng = 18-global.camera_angle;
		}
	}
	else if((imageAng > (18-angleOffsetRev))  ){
		displacement = (window_mouse_get_x() - (window_get_width()/2)) * .0025;
		global.camera_angle += displacement;
		if(displacement > 0){//moving right
			imageAng = 350-global.camera_angle;
		}
		else if(displacement < 0){//moving left
			imageAng = 18-global.camera_angle;
		}
	}
	
	if(degreeshiftp){
		global.camera_angle -= 180;
		imageAng -= 180;
	}
	if(degreeshiftm){
		global.camera_angle+= 180;
		imageAng += 180;
	}
	
	#endregion

} else if(!global.isPaused && !global.isInventoryOpen && !o_player.isRunning && target && !options){
	global.draw_cursor = false;
	
	#region keep mouse in screen
	if(window_mouse_get_x()>window_get_width())
		window_mouse_set(window_get_width(), window_mouse_get_y());
	if(window_mouse_get_x()<0)
		window_mouse_set(0, window_mouse_get_y());
	if(window_mouse_get_y()>window_get_height())
		window_mouse_set(window_mouse_get_x(), window_get_height());
	if(window_mouse_get_y()<0)
		window_mouse_set(window_mouse_get_x(), 0);
	#endregion
	
	// known bug: sometimes when holding it to the left or similarly it can go up slowly
	//decide angle
	
	//gui x and y positions of player
	//var playergui_x = x_to_gui(o_player.x, o_player.y);
	var playergui_x = window_get_width()/2;
	
	var playergui_y = y_to_gui(o_player.x, o_player.y);
	
	//set the distance to max right away
	window_mouse_set(window_mouse_get_x(), 0);
	var angleShift = (window_mouse_get_x() - playergui_x) * 0.01;
	var pdis = point_distance(playergui_x,playergui_y, 
			   window_mouse_get_x(), window_mouse_get_y());		   		   
	show_debug_message("pdis: "+string(pdis));
	show_debug_message("pdisoffset: "+string(pdisOffset));
	var pang = point_direction(playergui_x,playergui_y,
				window_mouse_get_x(), window_mouse_get_y());
	show_debug_message("pang: "+string(pang));
	
	playergui_x = x_to_gui(o_player.x, o_player.y);
	
	
	if(pdis < 500)
		pdis = 800;
	
	/*
	if(pdis < 500 && target){
		pdis = 900;
		window_mouse_set(playergui_x+lengthdir_x(pdis, pang+angleShift), playergui_y+lengthdir_y(pdis, pang+angleShift));
	}*/
	
	if(pdis > 500+pdisOffset && weaponMode != 1){
		var aimDis = (window_mouse_get_y() - y_to_gui(o_player.x, o_player.y))*0.005;
		/*
		if(pdis >= 1500){
			pdis = 1500;
			o_camera.x -= (o_player.x-o_camera.x)*.025;
			o_camera.y -= (o_player.x-o_camera.y)*.025;  
			aimDis = 0;
		}*/
		pdisOffset += aimDis;
		//o_camera.x+=lengthdir_x(-aimDis, -global.camera_angle+90);
		//o_camera.y+=lengthdir_y(-aimDis, -global.camera_angle+90);
		midOffsetX+=lengthdir_x(aimDis, -global.camera_angle+90);
		midOffsetY+=lengthdir_y(aimDis, -global.camera_angle+90);
	}
	if((angleShift*100 > 10) || (angleShift*100 <-10)){
		show_debug_message("shifting");
		
		if(angleShift*100 > 10)
			show_debug_message(" > 10");
		
		if(angleShift*100 < -10)
			show_debug_message(" < -10");
		
		global.camera_angle+=angleShift;
		//move mouse back to position
		
		/*
		window_mouse_set((x_to_gui(o_player.x, o_player.y))+lengthdir_x(pdis, (pang+angleShift)), 
						 (y_to_gui(o_player.x, o_player.y))+lengthdir_y(pdis, (pang+angleShift)));*/
		window_mouse_set((window_get_width()/2)+lengthdir_x(pdis, (pang+angleShift)), 
						 (y_to_gui(o_player.x, o_player.y))+lengthdir_y(pdis, (pang+angleShift)));
		//window_get_width()/2;	 
	}
	
	//make the image corect
	#region gun angle correction	
		//if the global.camera_angle is within the glitch range then shift everything and then unshift it
		
		if(global.camera_angle > 340){
			global.camera_angle -= 180;
			imageAng -= 180;
			degreeshiftm = true;
		}
		if(global.camera_angle < 20){
			global.camera_angle += 180;
			imageAng += 180;
			degreeshiftp = true;
		}
		if(imageAng < 0)
			imageAng = 360+imageAng;
		if(imageAng > 360)
			imageAng = imageAng-360;
	
		var angleOffsetRev = global.camera_angle-360;
		//works if offset is positive
		var displacement = 0;
		if( (imageAng < (350-global.camera_angle))){
			displacement = (window_mouse_get_x() - (window_get_width()/2)) * .005;
			if(displacement > 0){//moving right
				imageAng = 350-global.camera_angle;
			}
			else if(displacement < 0){//moving left
				imageAng = 15-global.camera_angle;
			}
		}
		else if((imageAng > (15-angleOffsetRev))  ){
			displacement = (window_mouse_get_x() - (window_get_width()/2)) * .005;
			if(displacement > 0){//moving right
				imageAng = 350-global.camera_angle;
			}
			else if(displacement < 0){//moving left
				imageAng = 15-global.camera_angle;
			}
		}
		
		if(degreeshiftp){
			global.camera_angle -= 180;
			imageAng -= 180;
		}
		if(degreeshiftm){
			global.camera_angle+= 180;
			imageAng += 180;
		}
		#endregion
	
}
else if(o_player.isRunning && !options){
	if(bobbing = false)
		imageAng = 35-global.camera_angle;
	if(bobbing)
		imageAng = 45-global.camera_angle;
	global.camera_angle += (window_mouse_get_x() - (window_get_width()/2)) * .025;
	window_mouse_set(window_get_width()/2, window_get_height()/2);
	runningPrev = true;
	//************************************************
	//add other image angles for all running positions
	//************************************************
}
else 
	imageAng = prev_imageAngle; // if its not any of these set it to what it was before

if(runningPrev && !options){//if it was running
	window_mouse_set(window_get_width()/2, window_get_height()/4);
	runningPrev = false;	
}
image_angle = imageAng;
if(global.isInventoryOpen)
	image_angle = prev_imageAngle;
prev_imageAngle = image_angle;
//need to do this cus idk reasons? but like actually it wont work without it


#endregion

#region shooting stuff

if(mouse_check_button_pressed(global.M_LEFT) && !options && !isloading && canshoot && !global.isPaused && !global.isInventoryOpen  
	&& (ammo>0) && !o_player.isRolling){
	//variables
	fireangle = image_angle+90;
	global.fireAngle = fireangle;
	var startx = x+lengthdir_x(barrellength, fireangle); //keep the right distance from weapon
	var starty = y+lengthdir_y(barrellength, fireangle);
	startx+= lengthdir_x(4, -camera_get_view_angle(view_camera[0]));
	starty+= lengthdir_y(4, -camera_get_view_angle(view_camera[0]));
	
	firex = startx+lengthdir_x(160, fireangle); //find where its shooting towards
	firey = starty+lengthdir_y(160, fireangle);
	//making bullets
	if(weaponMode == 0){
		instance_create_depth(startx, starty, depth, o_bullet);
		var casing = instance_create_depth(startx-lengthdir_x(ejectlength, fireangle), starty-lengthdir_x(ejectlength,fireangle), depth, o_casing);
		casing.sprite_index = s_casing;
	}	
	else if(weaponMode == 1){
		instance_create_depth(startx, starty, depth, o_buckshot);//always one pellet goes straight
		var shell = instance_create_depth(startx-lengthdir_x(ejectlength, fireangle), starty-lengthdir_x(ejectlength,fireangle), depth, o_casing);
		shell.sprite_index = s_shell;
		var bulletN = irandom_range(8,14);
		repeat(bulletN){
			var buckshotAngle = irandom_range(-15, 15);
			var newfirex = startx+lengthdir_x(160, fireangle+buckshotAngle);
			var newfirey = starty+lengthdir_y(160, fireangle+buckshotAngle);
			var buckshotI = instance_create_depth(startx, starty, depth, o_buckshot);
			buckshotI.bulletfirex = newfirex;
			buckshotI.bulletfirey = newfirey;
			buckshotI.image_angle = fireangle+buckshotAngle;
		}
	}
	else if(weaponMode == 2){
		startx-= lengthdir_x(1, -camera_get_view_angle(view_camera[0]));
		starty-= lengthdir_y(1, -camera_get_view_angle(view_camera[0]));
		var bolt = instance_create_depth(startx, starty, depth, o_bolt);
		bolt.boltType = boltLoad; //make it the correct bolt type
		
	}
	
	o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] -= .6;

	if(o_hud.hotbarDurability[# 0, o_hud.hotbarSlot] <= 0) {
		instance_destroy(self);
		audio_play_sound(sn_tool_break, 1, 0);
	}
		
	o_hud.showHotbar = true;
	
	//audio and smoke etc..
	ammo--;
	canshoot = false;
	canload = true;
	
	if(weaponMode != 2)
		smokedelay = 90;
		
	o_camera.shake = 2;
	if(global.itemEquipped == item.shotgun)
		audio_play_sound(sn_shotgun_shoot,0,0);
	
	if(global.itemEquipped == item.rifle)
		audio_play_sound(sn_rifle_shoot,0,0);
		
	if(global.itemEquipped == item.crossbow) {
		audio_play_sound_on(weapon, sn_crossbow_shoot, 0, 1);
		audio_play_sound_on(weapon, sn_crossbow_arrow, 0, 1);
	}
	//move player back a bit
	var newplayerx = o_player.x+lengthdir_x(1.5, fireangle-180);
	var newplayery = o_player.y+lengthdir_y(1.5, fireangle-180);
	with(o_player){
		if(place_free(newplayerx, newplayery)){
			x = newplayerx;
			y = newplayery;
		}
	}
	
	//play bolt action sound and create shoot delay
	if(weaponMode == 0){
		alarm[1] = 75; //set alarm to set shooting possible
		
		alarm[3] = 15;// Slight delay for gun reload sound
	}
	else if(weaponMode == 1){
		alarm[1] = 75; //set alarm to set shooting possible
		
		alarm[5] = 30;//more delay for the second sound
		alarm[3] = 15;// Slight delay for gun reload sound
	}
	else if(weaponMode == 2){
		alarm[1] = 75; //set alarm to set shooting possible
		
		alarm[3] = 15;// Slight delay for gun reload sound
	}
} 

//if want to shoot but currently loading
else if((mouse_check_button_pressed(global.M_LEFT) || mouse_check_button_pressed(global.M_RIGHT) || o_player.isRunning) && isloading)
	loadingcancel = true;
	
if(smokedelay > 0){
	var startx = x+lengthdir_x(barrellength, fireangle); //keep the right distance from weapon
	var starty = y+lengthdir_y(barrellength, fireangle);
	startx+= lengthdir_x(3, -camera_get_view_angle(view_camera[0]));
	starty+= lengthdir_y(3, -camera_get_view_angle(view_camera[0]));
	var repeatnum = irandom_range(0,3);
	repeat(repeatnum){
		if(smokedelay >	75)
			instance_create_depth(startx, starty, depth-1, o_effect_gunsmoke);
		if(smokedelay>80)
			instance_create_depth(startx, starty, depth-2, o_effect_gunflash);
		instance_create_depth(startx, starty, depth-1, o_effect_gunsmokethin);	
	}
	smokedelay--;
}

#endregion

#region reloading
//check if the R key pressed for now, obviously in the future this will be a timer based on "bolt action"
if (keyboard_check_pressed(global.K_RELOAD) && !global.isPaused && !global.isInventoryOpen && !o_player.isRunning && !target)
{	
	if(ammo < totalammo){
		firstLoad = true;
		isloading = true;
		showtext = true;	
		//check if their are more bolt options (this could be simplified by adding some more complexity,
		// to when these bolt types are added to the inventory)
		if(weaponMode == 2){
			var width = o_hud.width;
			var height = o_hud.height;
			boltNum = 0;
			for(var yy = 0; yy < height; yy++){
				for(var xx = 0; xx < width; xx++){
					if(o_hud.items[# xx, yy] == item.bolt && o_hud.count[# xx, yy] >= 1){
						wBoltP = true;
						boltNum++;
					}if(o_hud.items[# xx, yy] == item.poisonbolt && o_hud.count[# xx, yy] >= 1){
						wPoisBoltP = true;
						boltNum++;	
					}if(o_hud.items[# xx, yy] == item.flamebolt && o_hud.count[# xx, yy] >= 1){
						fBoltP = true;
						boltNum++;
					}if(o_hud.items[# xx, yy] == item.bonebolt && o_hud.count[# xx, yy] >= 1){
						bBoltP = true;
						boltNum++;
					}if(o_hud.items[# xx, yy] == item.poisonbonebolt && o_hud.count[# xx, yy] >= 1){
						bPoisBoltP = true;
						boltNum++;
					}if(o_hud.items[# xx, yy] == item.flintbolt && o_hud.count[# xx, yy] >= 1){
						flBoltP = true;
						boltNum++;
					}if(o_hud.items[# xx, yy] == item.poisonflintbolt && o_hud.count[# xx, yy] >= 1){
						flPoisBoltP = true;
						boltNum++;
					}if(o_hud.items[# xx, yy] == item.metalbolt && o_hud.count[# xx, yy] >= 1){
						mBoltP = true;
						boltNum++;
					}if(o_hud.items[# xx, yy] == item.poisonmetalbolt && o_hud.count[# xx, yy] >= 1){
						mPoisBoltP = true;
						boltNum++;	
					}
				}
			}
			//height is three
			for (var i = 0; i < 3; i++){
				if(o_hud.hotbarItems[# 0, i] == item.bolt && o_hud.hotbarCount[# 0, i] >= 1){
					wBoltP = true;
					boltNum++;
				}
				if(o_hud.hotbarItems[# 0, i] == item.poisonbolt && o_hud.hotbarCount[# 0, i] >= 1){
					wPoisBoltP = true;
					boltNum++;	
				}
				if(o_hud.hotbarItems[# 0, i] == item.flamebolt && o_hud.hotbarCount[# 0, i] >= 1){
					fBoltP = true;
					boltNum++;
				}
				if(o_hud.hotbarItems[# 0, i] == item.bonebolt && o_hud.hotbarCount[# 0, i] >= 1){
					bBoltP = true;
					boltNum++;
				}
				if(o_hud.hotbarItems[# 0, i] == item.poisonbonebolt && o_hud.hotbarCount[# 0, i] >= 1){
					bPoisBoltP = true;
					boltNum++;
				}
				if(o_hud.hotbarItems[# 0, i] == item.flintbolt && o_hud.hotbarCount[# 0, i] >= 1){
					flBoltP = true;
					boltNum++;
				}
				if(o_hud.hotbarItems[# 0, i] == item.poisonflintbolt && o_hud.hotbarCount[# 0, i] >= 1){
					flPoisBoltP = true;
					boltNum++;
				}
				if(o_hud.hotbarItems[# 0, i] == item.metalbolt && o_hud.hotbarCount[# 0, i] >= 1){
					mBoltP = true;
					boltNum++;
				}
				if(o_hud.hotbarItems[# 0, i] == item.poisonmetalbolt && o_hud.hotbarCount[# 0, i] >= 1){
					mPoisBoltP = true;
					boltNum++;	
				}
			}
			
			
			
			if(boltNum > 1){
				options = true;
				isloading = false;
				//window_mouse_set(window_get_width()/2 , window_get_height()/2-100);
				window_mouse_set(window_get_width()/2, window_get_height()/4);
				optionsX = display_get_gui_width()/2;
				optionsY = display_get_gui_height()/4;
				mouseX = window_get_width()/2;
				mouseY = window_get_height()/4;
				
				//optionsX = device_mouse_x_to_gui(0);
				//optionsY = device_mouse_y_to_gui(0);
				
				//optionsX = display_get_width()/2;
				//optionsY = display_get_height()/2-100;
				//optionsX = display_get_gui_width()/2;
				//optionsY = display_get_gui_height()/2-(100*(window_get_height()/display_get_gui_height()));
				
				//mouseX = window_get_width()/2;
				//mouseY = window_get_height()/2-100;
				
				//mouseX = window_mouse_get_x();
				//mouseY = window_mouse_get_y();
			}
			else{
				if(wBoltP)//wooden present
					boltLoad = 0;
				if(wPoisBoltP)//wooden poison present
					boltLoad = 1;
				else if(fBoltP)// flame bolt present
					boltLoad = 2;
				else if(bBoltP)//bone bolt present
					boltLoad = 3;
				else if(bPoisBoltP)//bone poison bolt present
					boltLoad = 4;
				else if(flBoltP)//flint bolt present
					boltLoad = 5;
				else if(flPoisBoltP)//flint poison bolt present
					boltLoad = 6;
				else if(mBoltP)//metal bolt present
					boltLoad = 7;
				else if(mPoisBoltP)//metal poison bolt present
					boltLoad = 8;
			}
		}
	}
	else{
		//if ammo is at max
		
		if(weaponMode == 2){
			//readd the original bolt to the inventory and set ammo down
			ammo--;
			
			#region readding the arrow to the inventory
			
					if(boltLoad == 0){
						pickup_item(o_hud, item.bolt, 1, 11);
					}else if(boltLoad == 1){
						pickup_item(o_hud, item.poisonbolt, 1, 11);
					}else if(boltLoad == 2){
						pickup_item(o_hud, item.flamebolt, 1, 11);	
					}else if(boltLoad == 3){
						pickup_item(o_hud, item.bonebolt, 1, 11);	
					}else if(boltLoad == 4){
						pickup_item(o_hud, item.poisonbonebolt, 1, 11);	
					}else if(boltLoad == 5){
						pickup_item(o_hud, item.flintbolt, 1, 11);	
					}else if(boltLoad == 6){
						pickup_item(o_hud, item.poisonflintbolt, 1, 11);	
					}else if(boltLoad == 7){
						pickup_item(o_hud, item.metalbolt, 1, 11);	
					}else if(boltLoad == 8){
						pickup_item(o_hud, item.poisonmetalbolt, 1, 11);	
					}
			
			#endregion
			
			
			isloading = true;
			showtext = true;	
			//check if their are more bolt options (this could be simplified by adding some more complexity,
			// to when these bolt types are added to the inventory)
			if(weaponMode == 2){
				var width = o_hud.width;
				var height = o_hud.height;
				boltNum = 0;
				for(var yy = 0; yy < height; yy++){
					for(var xx = 0; xx < width; xx++){
						if(o_hud.items[# xx, yy] == item.bolt && o_hud.count[# xx, yy] >= 1){
							wBoltP = true;
							boltNum++;
						}if(o_hud.items[# xx, yy] == item.poisonbolt && o_hud.count[# xx, yy] >= 1){
							wPoisBoltP = true;
							boltNum++;	
						}if(o_hud.items[# xx, yy] == item.flamebolt && o_hud.count[# xx, yy] >= 1){
							fBoltP = true;
							boltNum++;
						}if(o_hud.items[# xx, yy] == item.bonebolt && o_hud.count[# xx, yy] >= 1){
							bBoltP = true;
							boltNum++;
						}if(o_hud.items[# xx, yy] == item.poisonbonebolt && o_hud.count[# xx, yy] >= 1){
							bPoisBoltP = true;
							boltNum++;
						}if(o_hud.items[# xx, yy] == item.flintbolt && o_hud.count[# xx, yy] >= 1){
							flBoltP = true;
							boltNum++;
						}if(o_hud.items[# xx, yy] == item.poisonflintbolt && o_hud.count[# xx, yy] >= 1){
							flPoisBoltP = true;
							boltNum++;
						}if(o_hud.items[# xx, yy] == item.metalbolt && o_hud.count[# xx, yy] >= 1){
							mBoltP = true;
							boltNum++;
						}if(o_hud.items[# xx, yy] == item.poisonmetalbolt && o_hud.count[# xx, yy] >= 1){
							mPoisBoltP = true;
							boltNum++;	
						}
					}
				}
				if(boltNum > 1){
					options = true;
					isloading = false;
					//window_mouse_set(window_get_width()/2 , window_get_height()/2-100);
					window_mouse_set(window_get_width()/2, window_get_height()/4);
					optionsX = display_get_gui_width()/2;
					optionsY = display_get_gui_height()/4;
					mouseX = window_get_width()/2;
					mouseY = window_get_height()/4;
					
					//optionsX = device_mouse_x_to_gui(0);
					//optionsY = device_mouse_y_to_gui(0);
					//optionsX = x_to_gui(window_get_width()/2, window_get_height()/2-100);
					//optionsY = y_to_gui(window_get_width()/2, window_get_height()/2-100);
					//mouseX = window_mouse_get_x();
					//mouseY = window_mouse_get_y();
					
					//optionsX = display_get_width()/2;
					//optionsY = display_get_height()/2-100;
					
					//optionsX = display_get_gui_width()/2;
					//optionsY = display_get_gui_height()/2-(100*(window_get_height()/display_get_gui_height()));
					
					//mouseX = window_get_width()/2;
					//mouseY = window_get_height()/2-100;
					
				}
				else{
					if(wBoltP)//wooden present
						boltLoad = 0;
					if(wPoisBoltP)//wooden poison present
						boltLoad = 1;
					else if(fBoltP)// flame bolt present
						boltLoad = 2;
					else if(bBoltP)//bone bolt present
						boltLoad = 3;
					else if(bPoisBoltP)//bone poison bolt present
						boltLoad = 4;
					else if(flBoltP)//flint bolt present
						boltLoad = 5;
					else if(flPoisBoltP)//flint poison bolt present
						boltLoad = 6;
					else if(mBoltP)//metal bolt present
						boltLoad = 7;
					else if(mPoisBoltP)//metal poison bolt present
						boltLoad = 8;
				}
			}
		}
		else{
			isloading = false; //maybe not
			showtext = 	true;
			alarm[4] = 100; //set text delay
		}
	}
	//if full mag display 1/1 or such 
	//if nonfull mag, load bullet by bullet and slowly increase ammo count from x/total to x+1/total and so on
	//after some delay the display will dissapear
}
if(isloading){
	if(!isloading){
		o_player.img_frame = 0;
		o_player.alarm[0] = 1;
	}
	o_player.isReloadingWeapon = true;
	
	if(ammo == totalammo){
	 
		isloading = false;
		alarm[1] = 75; //set alarm to set shooting possible
		alarm[3] = 15;
		alarm[4] = 100; //set text delay

	}
	else if(alarm[2] <= 0){
		if(loadingcancel){
			isloading = false;
			alarm[1] = 75; //set alarm to set shooting possible
			alarm[3] = 15;	
			alarm[4] = 100; //set text delay
			loadingcancel = false;
		}
		else
			alarm[2] = 20;
	}
} else
	o_player.isReloadingWeapon = false;
#endregion

//set global variables
global.wepX = x;
global.wepY = y;
global.wepAngle = image_angle;
global.barrelLen = barrellength;

if(global.itemEquipped == item.crossbow){
	if(ammo == 0)
		sprite_index = s_crossbow_shot;
	else
		sprite_index = s_crossbow;
}
}