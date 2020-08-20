global.finishedLoading = false;//set it to false while in the menu

if(nameExistsAlready > 0 && alarm[6] == -1)
	alarm[6] = 120;

//KEEP THE FUCKING PLAYER STILL
global.canMove = true;

var wx = device_mouse_x_to_gui(0);
var wy = device_mouse_y_to_gui(0);

var dX = display_get_gui_width();
var dY = display_get_gui_height();

if(confirm) {
	draw_set_font(f_menu);
	
	var textH = string_height("NO");
	var yMax = (dY/2) + (textH/4) + 1;
	var yMin = (dY/2) - (textH/4);
	
	// NO
	if(!noHighlighted && wx > dX/2 - 19 && wx < dX/2 + string_width("NO") - 19 && wy > yMin && wy < yMax) {
		audio_play_sound(sn_menu_highlight,1,false);
		noHighlighted = true;
	}
	else if(!(wx > dX/2 - 19 && wx < dX/2 + string_width("NO") - 19 && wy > yMin && wy < yMax))
		noHighlighted = false;
		
	// YES
	if(!yesHighlighted && wx > dX/2 - 25 && wx < dX/2 + string_width("YES") - 25 && wy > yMin+36 && wy < yMax+36) {
		audio_play_sound(sn_menu_highlight,1,false);
		yesHighlighted = true;
	}
	else if(!(wx > dX/2 - 25 && wx < dX/2 + string_width("YES") - 25 && wy > yMin+36 && wy < yMax+36))
		yesHighlighted = false;
	
	if(mouse_check_button_pressed(global.M_LEFT)) {
		if(yesHighlighted && exitMessage) {
			game_end();
		} else if(yesHighlighted && !exitMessage) {	
			save_deleteFiles(fileSelected);
			editSelected = false;
			fileSelected = "";
			deleteHighlighted = false;
			exitMessage = true;
			confirm = false;
		} else if(noHighlighted) {
			exitMessage = true;
			confirm = false;
		}
	} else if(keyboard_check_pressed(global.K_PAUSE)) {
		exitMessage = true;
		confirm = false;
	}
} else {

#region Fading

// Fading out the intro if key pressed
if(!introFadeOut && keyboard_check_pressed(vk_space) || mouse_check_button_pressed(global.M_LEFT))
	introFadeOut = true;
else if(introFadeOut) {
	alarm[0] = -1;
	alarm[1] = -1;
	alarm[2] = -1;
	backgroundAlpha -= .02;
	logoAlpha -= .02;
}

// If intro is already faded out
if(backgroundAlpha < 0 && logoAlpha < 0)
	introFadeOut = false;
	
// Fade in play button
if(alarm[2] == -1 && !menuFadeIn) {
	menuFadeIn = true;
	alarm[3] = room_speed * 1;
}
	
#endregion

#region Play/Options highlighting

draw_set_font(f_menu);
var textH = string_height("Khio");
var yMax = (dY/2) + (textH/4) + 1;
var yMin = (dY/2) - (textH/4);

if(global.play) {
	var newW = string_width("New");	
	var createW = string_width("CREATE");
	var tutorialW = string_width("TUTORIAL");
	var loadW = string_width("Load");
	var modeW = string_width("NORMAL");
	
	// New game
	if(!newHighlighted && wx > 250 && wx < 247 + newW && wy > yMin && wy < yMax) {
		audio_play_sound(sn_menu_highlight,1,false);
		newHighlighted = true;
	}
	else if(!(wx > 250 && wx < 247 + newW && wy > yMin && wy < yMax))
		newHighlighted = false;
		
	// Load game
	if(!loadHighlighted && wx > 250 && wx < 247 + loadW && wy > yMin+36 && wy < yMax+36) {
		audio_play_sound(sn_menu_highlight,1,false);
		loadHighlighted = true;
	}
	else if(!(wx > 250 && wx < 247 + loadW && wy > yMin+36 && wy < yMax+36))
		loadHighlighted = false;
		
	// New/Load menus
	if(newOption) {
		/*if(!modeHighlighted && wx > 250+loadW+30 && wx < 247 + modeW+loadW+30 && wy > yMin-36 && wy < yMax-36) {
			audio_play_sound(sn_menu_highlight,1,false);
			modeHighlighted = true;
		}
		else if(!(wx > 250+loadW+30 && wx < 247 + modeW+loadW+30 && wy > yMin-36 && wy < yMax-36))
			modeHighlighted = false;*/
			
		if(!tutorialModeHighlighted && wx > 250+loadW+30 && wx < 247 + tutorialW+loadW+30 && wy > yMin+36 && wy < yMax+36) {
			audio_play_sound(sn_menu_highlight,1,false);
			tutorialModeHighlighted = true;
		}
		else if(!(wx > 250+loadW+30 && wx < 247 + tutorialW+loadW+30 && wy > yMin+36 && wy < yMax+36))
			tutorialModeHighlighted = false;
			
		if(!createHighlighted && wx > 250+loadW+30 && wx < 247 + createW+loadW+30 && wy > yMin+36*2 && wy < yMax+36*2) {
			audio_play_sound(sn_menu_highlight,1,false);
			createHighlighted = true;
		}
		else if(!(wx > 250+loadW+30 && wx < 247 + createW+loadW+30 && wy > yMin+36*2 && wy < yMax+36*2))
			createHighlighted = false;
		
	}	
		
} else if(global.options) {
	
	var settingsW = string_width("Settings");
	var controlsW = string_width("Controls");
	
	// Settings
	if(!settingsHighlighted && wx > 250 && wx < 247 + settingsW && wy > yMin && wy < yMax) {
		audio_play_sound(sn_menu_highlight,1,false);
		settingsHighlighted = true;
	}
	else if(!(wx > 250 && wx < 247 + settingsW && wy > yMin && wy < yMax))
		settingsHighlighted = false;
		
	if(settings) {
		if(!windowHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("WINDOW") && wy > yMin-(36*2) && wy < yMax-(36*2)) {
					audio_play_sound(sn_menu_highlight,1,false);
					windowHighlighted = true;
				}
				else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("WINDOW") && wy > yMin-(36*2) && wy < yMax-(36*2)))
					windowHighlighted = false;
			
				if(!resolutionHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("RESOLUTION") && wy > yMin-(36*1) && wy < yMax-(36*1)) {
					audio_play_sound(sn_menu_highlight,1,false);
					resolutionHighlighted = true;
				}
				else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("RESOLUTION") && wy > yMin-(36*1) && wy < yMax-(36*1)))
					resolutionHighlighted = false;
			
				if(!fxHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("FX VOLUME") && wy > yMin+(36*0) && wy < yMax+(36*0)) {
					audio_play_sound(sn_menu_highlight,1,false);
					fxHighlighted = true;
				}
				else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("FX VOLUME") && wy > yMin+(36*0) && wy < yMax+(36*0)))
					fxHighlighted = false;
			
				if(!musicHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("MUSIC VOLUME") && wy > yMin+(36*1) && wy < yMax+(36*1)) {
					audio_play_sound(sn_menu_highlight,1,false);
					musicHighlighted = true;
				}
				else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("MUSIC VOLUME") && wy > yMin+(36*1) && wy < yMax+(36*1)))
					musicHighlighted = false;
					
				if(!censorHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("CENSORING") && wy > yMin+(36*2) && wy < yMax+(36*2)) {
					audio_play_sound(sn_menu_highlight,1,false);
					censorHighlighted = true;
				}
				else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("CENSORING") && wy > yMin+(36*2) && wy < yMax+(36*2)))
					censorHighlighted = false;
					
				if(!hintsHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("INTERACTABLE HINTS") && wy > yMin+(36*3) && wy < yMax+(36*3)) {
					audio_play_sound(sn_menu_highlight,1,false);
					hintsHighlighted = true;
				}
				else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("INTERACTABLE HINTS") && wy > yMin+(36*3) && wy < yMax+(36*3)))
					hintsHighlighted = false;
	}
		
	// Controls
	if(!controlsHighlighted && wx > 250 && wx < 247 + controlsW && wy > yMin+36 && wy < yMax+36) {
		audio_play_sound(sn_menu_highlight,1,false);
		controlsHighlighted = true;
	}
	else if(!(wx > 250 && wx < 247 + controlsW && wy > yMin+36 && wy < yMax+36))
		controlsHighlighted = false;
		
	if(controls) {
		
		// PRIMARY
		/*if(!primaryHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("PRIMARY") && wy > yMin-(36*5) && wy < yMax-(36*5)) {
			audio_play_sound(sn_menu_highlight,1,false);
			primaryHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("PRIMARY") && wy > yMin-(36*5) && wy < yMax-(36*5)))
			primaryHighlighted = false;
			
		// SECONDARY
		if(!secondaryHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("SECONDARY") && wy > yMin-(36*4) && wy < yMax-(36*4)) {
			audio_play_sound(sn_menu_highlight,1,false);
			secondaryHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("SECONDARY") && wy > yMin-(36*4) && wy < yMax-(36*4)))
			secondaryHighlighted = false;*/
		
		// WALK
		if(!walkHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("WALK") && wy > yMin-(36*3) && wy < yMax-(36*3)) {
			audio_play_sound(sn_menu_highlight,1,false);
			walkHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("WALK") && wy > yMin-(36*3) && wy < yMax-(36*3)))
			walkHighlighted = false;
		
		// RUN
		if(!runHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("RUN") && wy > yMin-(36*2) && wy < yMax-(36*2)) {
			audio_play_sound(sn_menu_highlight,1,false);
			runHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("RUN") && wy > yMin-(36*2) && wy < yMax-(36*2)))
			runHighlighted = false;
			
		// SIT
		if(!sitHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("SIT") && wy > yMin-(36*1) && wy < yMax-(36*1)) {
			audio_play_sound(sn_menu_highlight,1,false);
			sitHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("SIT") && wy > yMin-(36*1) && wy < yMax-(36*1)))
			sitHighlighted = false;
			
		// Dodge
		if(!dodgeHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("DODGE") && wy > yMin+(36*0) && wy < yMax+(36*0)) {
			audio_play_sound(sn_menu_highlight,1,false);
			dodgeHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("DODGE") && wy > yMin+(36*0) && wy < yMax+(36*0)))
			dodgeHighlighted = false;
			
		// RELOAD
		if(!reloadHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("RELOAD") && wy > yMin+(36*1) && wy < yMax+(36*1)) {
			audio_play_sound(sn_menu_highlight,1,false);
			reloadHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("RELOAD") && wy > yMin+(36*1) && wy < yMax+(36*1)))
			reloadHighlighted = false;
		
		// INVENTORY
		if(!inventoryHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("INVENTORY") && wy > yMin+(36*2) && wy < yMax+(36*2)) {
			audio_play_sound(sn_menu_highlight,1,false);
			inventoryHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("INVENTORY") && wy > yMin+(36*2) && wy < yMax+(36*2)))
			inventoryHighlighted = false;
			
		// MAP
		if(!mapHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("MAP") && wy > yMin+(36*3) && wy < yMax+(36*3)) {
			audio_play_sound(sn_menu_highlight,1,false);
			mapHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("MAP") && wy > yMin+(36*3) && wy < yMax+(36*3)))
			mapHighlighted = false;
			
		// PAUSE
		/*if(!pauseHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("PAUSE") && wy > yMin+(36*3) && wy < yMax+(36*3)) {
			audio_play_sound(sn_menu_highlight,1,false);
			pauseHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("PAUSE") && wy > yMin+(36*3) && wy < yMax+(36*3)))
			pauseHighlighted = false;*/
			
		// CENTER
		if(!centerHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("CENTER CAMERA") && wy > yMin+(36*5) && wy < yMax+(36*5)) {
			audio_play_sound(sn_menu_highlight,1,false);
			centerHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("CENTER CAMERA") && wy > yMin+(36*5) && wy < yMax+(36*5)))
			centerHighlighted = false;
		
		// ROTATE RIGHT
		if(!rotateLeftHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("BUILD ROTATE LEFT") && wy > yMin+(36*6) && wy < yMax+(36*6)) {
			audio_play_sound(sn_menu_highlight,1,false);
			rotateLeftHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("BUILD ROTATE LEFT") && wy > yMin+(36*6) && wy < yMax+(36*6)))
			rotateLeftHighlighted = false;
		
		// ROTATE RIGHT
		if(!rotateRightHighlighted && wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("BUILD ROTATE RIGHT") && wy > yMin+(36*7) && wy < yMax+(36*7)) {
			audio_play_sound(sn_menu_highlight,1,false);
			rotateRightHighlighted = true;
		}
		else if(!(wx > 250+settingsW+34 && wx < 250+settingsW+33+string_width("BUILD ROTATE RIGHT") && wy > yMin+(36*7) && wy < yMax+(36*7)))
			rotateRightHighlighted = false;
	}
		
}

#endregion

#region Main Menu Highlighting
	//as a note: yMax = (dY/2) + (textH/4) + 1;
	//as a note: yMin = (dY/2) - (textH/4);
if(!global.options && !global.credits ) {
	var playW = string_width("Play");
	var exitW = string_width("Exit");
	
	// Play
	if(!global.play && !global.options && !playHighlighted && backgroundAlpha <= 0 && (wx > 250 && wx < 247 + playW) && (wy > yMin && wy < yMax)) {
		audio_play_sound(sn_menu_highlight,1,false);
		playHighlighted = true;
	}
	else if(!(wx > 250 && wx < 247 + playW && wy > yMin && wy < yMax))
		playHighlighted = false;
	
	// Exit
	if(!exitHighlighted && backgroundAlpha <= 0 && wx > (dX-17) - exitW && wx < (dX-20) && wy > (dY-3) - textH && wy < (dY-20)) {
		audio_play_sound(sn_menu_highlight,1,false);
		exitHighlighted = true;
	}
	else if(!(wx > (dX-17) - exitW && wx < (dX-20) && wy > (dY-3) - textH && wy < (dY-20)))
		exitHighlighted = false;
}

// Back
var backW = string_width("Back");

if((global.options || global.credits) && !backHighlighted && wx > (dX-17) - backW && wx < (dX-20) && wy > (dY-3) - textH && wy < (dY-20)) {
	audio_play_sound(sn_menu_highlight,1,false);
	backHighlighted = true;
}
else if(!(wx > (dX-17) - backW && wx < (dX-20) && wy > (dY-3) - textH && wy < (dY-20)))
	backHighlighted = false;
	
// Options/Exit
if(!global.options && !global.credits && global.play) {
	var optionsW = string_width("Options");
	var creditsW = string_width("Credits");
	var exitW = string_width("Exit");
	
	// Exit
	if(!exitHighlighted && wx > (dX-17) - exitW && wx < (dX-20) && wy > (dY-3) - textH && wy < (dY-20)) {
		audio_play_sound(sn_menu_highlight,1,false);
		exitHighlighted = true;
	}
	else if(!(wx > (dX-17) - exitW && wx < (dX-20) && wy > (dY-3) - textH && wy < (dY-20)))
		exitHighlighted = false;
	
	// Credits
	if(!creditsHighlighted && wx > (dX-38) - exitW - creditsW && wx < (dX-40) - exitW && wy > (dY-3) - textH && wy < (dY-20)) {
		audio_play_sound(sn_menu_highlight,1,false);
		creditsHighlighted = true;
	}
	else if(!(wx > (dX-38) - exitW - creditsW && wx < (dX-40) - exitW && wy > (dY-3) - textH && wy < (dY-20)))	
		creditsHighlighted = false;
	
	// Options
	if(!optionsHighlighted && wx > (dX-58) - exitW - creditsW - optionsW && wx < (dX-60) - exitW - creditsW && wy > (dY-3) - textH && wy < (dY-20)) {
		audio_play_sound(sn_menu_highlight,1,false);
		optionsHighlighted = true;
	}
	else if(!(wx > (dX-58) - exitW - creditsW - optionsW && wx < (dX-60) - exitW - creditsW && wy > (dY-3) - textH && wy < (dY-20)))
		optionsHighlighted = false;
}
	
#endregion

#region Clicking

if(mouse_check_button_pressed(global.M_LEFT) && !newGameFade && menuFadeIn) {	
	
	// Play button
	if(playHighlighted && !global.play) {
		o_camera_title.isMoving = true;
		o_camera_title.x = o_camera_title.target_x;
		audio_play_sound(sn_menu_transition,1,false);
		o_camera_title.camera_rotation = 0;
		o_camera_title.target_x = 832;
		o_camera_title.rot = true;
		global.play = true;
		
		keyboard_string = "";
		
		
	}
	// Options button
	if(optionsHighlighted && !global.options) {
		o_camera_title.isMoving = true;
		o_camera_title.x = o_camera_title.target_x;
		audio_play_sound(sn_menu_transition,1,false);
		o_camera_title.camera_rotation = 0;
		o_camera_title.target_x = 512;
		o_camera_title.rot = true;
		global.options = true;
		global.play = false;
		global.credits = false;
		
		controls = false;
		controlSelected = -1;
		settings = false;
	}
	
	// Credits button
	if(creditsHighlighted && !global.credits) {
		o_camera_title.isMoving = true;
		o_camera_title.x = o_camera_title.target_x;
		audio_play_sound(sn_menu_transition,1,false);
		o_camera_title.camera_rotation = 0;
		o_camera_title.target_x = 1184;
		o_camera_title.rot = true;
		global.credits = true;
		global.options = false;
		save_settingsHub();
		global.play = false;
	}
	
	// Back button
	if(backHighlighted && (global.options || global.credits)) {
		o_camera_title.isMoving = true;
		o_camera_title.x = o_camera_title.target_x;
		audio_play_sound(sn_menu_transition,1,false);
		o_camera_title.camera_rotation = 0;
		o_camera_title.target_x = 832;
		o_camera_title.rot = true;
		global.play = true;
		global.options = false;
		save_settingsHub();
		global.credits = false;
		newOption = false;
		load = false;
		controls = false;
		settings = false;
		
		keyboard_string = "";
	}
	
	// Exit button
	if(exitHighlighted && !global.options) {
		confirm = true;
	}
		
	// Play Menu
	if(global.play && newHighlighted) {
		newOption = !newOption;
		load = false;
		keyboard_string = "";
		
		nameExistsAlready = 0;
	} else if(global.play && loadHighlighted) {
		load = !load;
		newOption = false;
		keyboard_string = "";
		
		nameExistsAlready = 0;
	} else if(global.play && createHighlighted && !newGameFade){ 
		//check if name is unique
		newGameFade = true;
		o_player.isSitting = false;
		global.loadingWorld = false;
		for(var i = 0; i < ds_list_size(global.saveFileNames); i++ ){
			//show_debug_message("string 1: "+string(string_upper(keyboard_string)));
			//show_debug_message("string 2: "+string(ds_list_find_value(global.saveFileNames, i)));
			if(string(string_upper(keyboard_string)) == ds_list_find_value(global.saveFileNames, i)){
				nameExistsAlready = 1;
				newGameFade = false;
				o_player.isSitting = true;
			}
		}
	} else if(global.play && tutorialModeHighlighted && !newGameFade){ 
		global.isTutorial = !global.isTutorial;
	}
	
	//if a name is highlighted
	if(global.play && fileHighlighted!=""){
		if(fileSelected == fileHighlighted){
			fileSelected = "";
			editSelected = false;
		}
		else{
			fileSelected = fileHighlighted;
			editSelected = false;	
		}
	}
	
	
	//if edit is selected
	if(global.play && editHighlighted){
		if(editSelected){
			if(keyboard_string != "") {
				var nameExists = false;
				for(var i = 0; i < ds_list_size(global.saveFileNames); i++ ){
					if(string(string_upper(keyboard_string)) == ds_list_find_value(global.saveFileNames, i)){
						nameExistsAlready = 1;
						nameExists = true;
					}
				}
				if(!nameExists){
					save_editFiles(fileSelected, string_upper(keyboard_string));
					fileSelected = string_upper(keyboard_string);
				}
				
				editSelected = false;
			} else {
				editSelected = false;
			}
		} else {
			keyboard_string = "";
			editSelected = true;	
		}
	}
	//if load on play load is highlighted
	if(global.play && startHighlighted){
		newGameFade = true;
		global.loading = true;
		global.loadingWorld = true;
		global.currentFile = fileSelected;
		o_player.isSitting = false;
		//save_loadFile(fileSelected);
	}
	if(global.play && deleteHighlighted){
		confirm = true;
		exitMessage = false;
	}
	
	
	// Options Menu
	if(global.options) {
		if(settingsHighlighted) {
			settings = !settings;
			controls = false;
		} else if(controlsHighlighted) {
			controls = !controls;
			settings = false;
		} 
		
		if(settings) {
			// WINDOW
			if(windowHighlighted) {
				if(window_get_fullscreen()) {
					window_set_fullscreen(false);
				} else {			
					window_set_fullscreen(true);
					currentResolution = display_get_width();
				}
			} 
			// RESOLUTION
			if(resolutionHighlighted) {
				for(var i = 0; i < array_length_1d(resolution); i++) {
					
					if(resolution[i] == currentResolution && i != 0) {
						currentResolution = resolution[i-1];
						break;
					} else if(resolution[i] == currentResolution && i == 0)
						currentResolution = resolution[array_length_1d(resolution)-1];
				}
			}
			// FX
			if(fxHighlighted) {
				if(global.SN_FX < 1)
					global.SN_FX+=.2;
				else
					global.SN_FX = 0;
					
				if(audio_group_is_loaded(fx))
					audio_group_set_gain(fx, global.SN_FX, 1000);
			}
			// MUSIC
			if(musicHighlighted) {
				if(global.SN_MUSIC < 1)
					global.SN_MUSIC+=.2;
				else
					global.SN_MUSIC = 0;
				
				if(audio_group_is_loaded(back_music))
					audio_group_set_gain(back_music, global.SN_MUSIC, 1000)
				if(audio_group_is_loaded(main_music))
					audio_group_set_gain(main_music, global.SN_MUSIC, 1000);
				if(audio_group_is_loaded(camp_music))
					audio_group_set_gain(camp_music, global.SN_MUSIC, 1000);
			}
			if(censorHighlighted)
				global.censoring = !global.censoring;
				
			if(hintsHighlighted)
				global.hints = !global.hints;
		}
		
		// CONTROLS
		if(controls && controlSelected == -1) {
			if(walkHighlighted)
				controlSelected = 0;
			else if(runHighlighted)
				controlSelected = 4;
			else if(sitHighlighted)
				controlSelected = 5;
			else if(dodgeHighlighted)
				controlSelected = 6;
			else if(reloadHighlighted)
				controlSelected = 7;
			else if(inventoryHighlighted)
				controlSelected = 8;
			else if(mapHighlighted)
				controlSelected = 9;
			else if(centerHighlighted)
				controlSelected = 10;
			else if(rotateLeftHighlighted)
				controlSelected = 11;
			else if(rotateRightHighlighted)
				controlSelected = 12;
		}
		
	}
} else if(keyboard_check_pressed(global.K_PAUSE) && !newGameFade) {
	if(global.play) {
		if(!newOption && !load) {
			o_camera_title.isMoving = true;
			o_camera_title.x = o_camera_title.target_x;
			audio_play_sound(sn_menu_transition,1,false);
			o_camera_title.camera_rotation = 0;
			o_camera_title.target_x = 192;
			o_camera_title.rot = true;
			global.play = false;
			global.options = false;
			save_settingsHub();
			global.credits = false;
		} else {
			newOption = false;
			load = false;
		}
	} else if(global.options) {
		if(settings) {
			settings = false;
		} else if(controls && controlSelected == -1) {
			controls = false;	
			controlSelected = -1;
		} else if(controls && controlSelected != -1) {
			controlSelected = -1;
		} else {
			o_camera_title.isMoving = true;
			o_camera_title.x = o_camera_title.target_x;
			audio_play_sound(sn_menu_transition,1,false);
			o_camera_title.camera_rotation = 0;
			o_camera_title.target_x = 832;
			o_camera_title.rot = true;
			global.play = true;
			global.options = false;
			save_settingsHub();
			global.credits = false;
			newOption = false;
			load = false;
			controls = false;
			settings = false;
		
			keyboard_string = "";
		}
	} else if(global.credits) {
		o_camera_title.isMoving = true;
		o_camera_title.x = o_camera_title.target_x;
		audio_play_sound(sn_menu_transition,1,false);
		o_camera_title.camera_rotation = 0;
		o_camera_title.target_x = 832;
		o_camera_title.rot = true;
		global.play = true;
		global.options = false;
		global.credits = false;
		newOption = false;
		load = false;
		controls = false;
		settings = false;
		
		keyboard_string = "";
	}
	
	if(newOption) {
		newOption = false;
		keyboard_string = "";
	} else if(load && !editSelected) {
		load = false
		keyboard_string = "";
	} else {
		editSelected = false;
	}

}

if(keyboard_check_pressed(vk_delete) && load && fileSelected != "") {
	confirm = true;
	exitMessage = false;
}

if(keyboard_check_pressed(vk_enter) && menuFadeIn && !newGameFade) {
	if(!global.play) {
		o_camera_title.isMoving = true;
		o_camera_title.x = o_camera_title.target_x;
		audio_play_sound(sn_menu_transition,1,false);
		o_camera_title.camera_rotation = 0;
		o_camera_title.target_x = 832;
		o_camera_title.rot = true;
		global.play = true;
		
		keyboard_string = "";
	} else if(global.play && newOption && !newGameFade) { 
		//check if name is unique
		newGameFade = true;
		global.loadingWorld = false;
		o_player.isSitting = false;
		for(var i = 0; i < ds_list_size(global.saveFileNames); i++ ){
			if(string(string_upper(keyboard_string)) == ds_list_find_value(global.saveFileNames, i)){
				nameExistsAlready = 1;
				newGameFade = false;
				o_player.isSitting = true;
			}
		}
	} else if(!newOption && !editSelected) {
		newOption = !newOption;
		load = false;
		keyboard_string = "";
	}
	
	if(global.play && fileSelected != "" && load && !editSelected){
		newGameFade = true;
		global.loading = true;
		global.loadingWorld = true;
		global.currentFile = fileSelected;
	}
}

if((keyboard_check_released(vk_anykey) && controlSelected > -1 && keyboard_lastkey >= 32 && keyboard_lastkey <= 96) || keyboard_lastkey == 8 || keyboard_lastkey == 9 || keyboard_lastkey == 13 || keyboard_lastkey == 16 || keyboard_lastkey == 20 || keyboard_lastkey == 27 || keyboard_lastkey == 32 || keyboard_lastkey == 46 || keyboard_lastkey == 162 || keyboard_lastkey == 164) {
	// Checking if key is used
	var keyUsed = false;
	
	switch(keyboard_lastkey) {
		case global.K_UP: if(controlSelected != 0) keyUsed = true; break;
		case global.K_LEFT: if(controlSelected != 1) keyUsed = true; break;
		case global.K_DOWN: if(controlSelected != 2) keyUsed = true; break;
		case global.K_RIGHT: if(controlSelected != 3) keyUsed = true; break;
		case global.K_RUN: if(controlSelected != 4) keyUsed = true; break;
		case global.K_SIT: if(controlSelected != 5) keyUsed = true; break;
		case global.K_DODGE: if(controlSelected != 6) keyUsed = true; break;
		case global.K_RELOAD: if(controlSelected != 7) keyUsed = true; break;
		case global.K_INVENTORY: if(controlSelected != 8) keyUsed = true; break;
		case global.K_PAUSE: if(controlSelected != 9) keyUsed = true; break;
		case global.K_CENTER: if(controlSelected != 10) keyUsed = true; break;
		case global.K_ROTATELEFT: if(controlSelected != 11) keyUsed = true; break;
		case global.K_ROTATERIGHT: if(controlSelected != 12) keyUsed = true; break;
	}
	
	if(!keyUsed)
		switch(controlSelected) {
			case 0: if(keyboard_check_released(keyboard_lastkey)) { global.K_UP = keyboard_lastkey; controlSelected++; } break;
			case 1: if(keyboard_check_released(keyboard_lastkey)) { global.K_LEFT = keyboard_lastkey; controlSelected++; } break;
			case 2: if(keyboard_check_released(keyboard_lastkey)) { global.K_DOWN = keyboard_lastkey; controlSelected++; } break;
			case 3: if(keyboard_check_released(keyboard_lastkey)) { global.K_RIGHT = keyboard_lastkey; controlSelected = -1; } break;
			case 4: if(keyboard_check_released(keyboard_lastkey)) { global.K_RUN = keyboard_lastkey; controlSelected = -1; } break;
			case 5: if(keyboard_check_released(keyboard_lastkey)) { global.K_SIT = keyboard_lastkey; controlSelected = -1; } break;
			case 6: if(keyboard_check_released(keyboard_lastkey)) { global.K_DODGE = keyboard_lastkey; controlSelected = -1; } break;
			case 7: if(keyboard_check_released(keyboard_lastkey)) { global.K_RELOAD = keyboard_lastkey; controlSelected = -1; } break;
			case 8: if(keyboard_check_released(keyboard_lastkey)) { global.K_INVENTORY = keyboard_lastkey; controlSelected = -1; } break;
			case 9: if(keyboard_check_released(keyboard_lastkey)) { global.K_MAP = keyboard_lastkey; controlSelected = -1; } break;
			case 10: if(keyboard_check_released(keyboard_lastkey)) { global.K_CENTER = keyboard_lastkey; controlSelected = -1; } break;
			case 11: if(keyboard_check_released(keyboard_lastkey)) { global.K_ROTATELEFT = keyboard_lastkey; controlSelected = -1; } break;
			case 12: if(keyboard_check_released(keyboard_lastkey)) { global.K_ROTATERIGHT = keyboard_lastkey; controlSelected = -1; } break;
		}
}
	
if(!controls)
	controlSelected = -1;
		
if(keyboard_check_pressed(vk_enter)){
	//if edit is selected
	if(global.play){
		if(editSelected){
			if(keyboard_string != "") {
				var nameExists = false;
				for(var i = 0; i < ds_list_size(global.saveFileNames); i++ ){
					if(string(string_upper(keyboard_string)) == ds_list_find_value(global.saveFileNames, i)){
						nameExistsAlready = 1;
						nameExists = true;
					}
				}
				if(!nameExists){
					save_editFiles(fileSelected, string_upper(keyboard_string));
					fileSelected = string_upper(keyboard_string);
				}
				
				editSelected = false;
			} else {
				editSelected = false;
			}
		}
	}	
}
if(newGameFade) {
	if(global.menuAlpha > 0)
		global.menuAlpha-=.02;
		
	global.mainMenu = false;
	//instance_destroy(self);
	
	if(!global.loadingWorld && !o_shaders.fadeOutWorld){
		o_shaders.fadeOutWorld = true;
		//-------------------------------------
		//add the name to the current file name
		//-------------------------------------
		if(keyboard_string == "" || keyboard_string == "|"){
			//if name is empty make one
			
			//keyboard_string = "saveFile_"+string(global.saveFileMax);
			keyboard_string = "SAVEFILE_"+string(global.saveFileMax);
			global.saveFileMax++;
			//keyboard_string = "saveFile_"+string(ds_list_size(global.saveFileNames));
		}
		
		//make sure its original
		/*
		var saveFileSize = ds_list_size(global.saveFileNames);
		var originalName = false;
		var originalityCheck = false;
		var originalityNum = 1;
		while(!originalName){
			for(var i =0; i <saveFileSize; i++){
				if(keyboard_string == ds_list_find_value(global.saveFileNames, i))
					originalityCheck = true;
			}
			if(originalityCheck){
				keyboard_string = keyboard_string+string(originalityNum);
				originalityNum++;
				originalName = false;
			}else
				originalName = true;
		}*/
		show_debug_message("SAVE FILE! ::::: "+string(string_upper(keyboard_string)));
		ds_list_add(global.saveFileNames, string(string_upper(keyboard_string)));
		global.currentFile = keyboard_string;
		save_nameHub(); // save this change
	}
	else if(!o_shaders.fadeOutWorld)
	{
		o_shaders.fadeOutWorld = true;
		global.currentFile = fileSelected;
	}
	
	//instance_create_depth(x,y,1,o_titleFadeControl);
	
	if(global.alpha <= 0) {
		room_goto_next();
		instance_destroy(self);
		global.menuAlpha = 1;
	}
}
	
#endregion


}

// Loading Screen stuff
if(global.loading) {
	global.loadingMove = true;
	
	if(global.menuAlpha > 0)
		global.menuAlpha-=.02;
}

// Updating resolution
if(global.display_width != currentResolution && currentResolution <= display_get_width()) {
	global.display_width = currentResolution;
	global.display_height = (currentResolution/16)*9;
}