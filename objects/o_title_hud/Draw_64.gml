// Drawing vignette
draw_sprite(s_vignette,1,0,0);

draw_set_font(f_hud);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
if(global.hour > 8 && global.hour < 19)
	draw_set_color($333128);
else
	draw_set_color(c_white);
	
if(global.play)
	draw_set_color(c_white);
	
draw_text(30,1050, "V " + string(GM_version));	

#region Intro/Logo
if(backgroundAlpha != 0 && room == r_title) {
	// Background
	draw_set_color($333128);
	draw_set_alpha(backgroundAlpha);
	draw_rectangle(0,0,1920,1080,false);
	draw_set_alpha(1);
	
	// Logo
	draw_sprite_ext(s_logo, 0, 960, 540, 3, 3, image_angle, image_blend, logoAlpha);
}
#endregion

var wx = device_mouse_x_to_gui(0);
var wy = device_mouse_y_to_gui(0);

var dX = display_get_gui_width();
var dY = display_get_gui_height();

// Used for the outter box delay around the cursor
mx += (wx-mx)*1; 
my += (wy-my)*1;

if(confirm) {
	draw_set_color($333128);
	draw_set_alpha(.5);
	draw_rectangle(0, 0, dX, dY, false);
	
	draw_set_font(f_menu);
	draw_set_halign(fa_center); 
	draw_set_valign(fa_middle);
	
	// Message
	if(exitMessage)
		draw_menu_button(dX/2, dY/2-36, "Do you want to exit?", false, true);
	else
		draw_menu_button(dX/2, dY/2-36, "Do you want to delete " + string_upper(fileSelected) + "?", false, true);
	
	// No
	draw_set_color($333128);
	draw_set_alpha(.1);
	draw_rectangle(dX/2 - 10 - 19, dY/2 - 15, dX/2 + string_width("NO") + 8 - 19, dY/2 + 15, false);
	draw_set_alpha(1);
	draw_menu_button(dX/2, dY/2, "NO", false, !noHighlighted);
	
	
	// Yes
	draw_set_color($333128);
	draw_set_alpha(.1);
	draw_rectangle(dX/2 - 10 - 25, dY/2+36 - 15, dX/2 + string_width("YES") + 8 - 25, dY/2+36 + 15, false);
	draw_set_alpha(1);
	draw_menu_button(dX/2, dY/2+36, "YES", false, !yesHighlighted);
	
} else {



#region Play/Options Menus

draw_set_font(f_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if(global.play) {
	
	// New
	draw_menu_button(250, dY/2, "New", false, newHighlighted);
	
	// Load
	draw_menu_button(250, dY/2+35, "Load", false, loadHighlighted);
	
	draw_set_color($333128);
	
	var loadW = string_width("Load");
	
	if(newOption) {
		
		// Keeping the name under 12 characters
		if(string_length(keyboard_string) > 12)
			keyboard_string = string_copy(keyboard_string, 0, 12);
			
		if(keyboard_string == "" && typer)
			draw_menu_button(250+loadW+30, dY/2, "|", true, true);
		else if(keyboard_string == "")
			draw_menu_button(250+loadW+30, dY/2, "|", true, false);
		else
			draw_menu_button(250+loadW+30, dY/2, string_upper(keyboard_string), true, true);	
			
		draw_menu_button(250+loadW+30, dY/2+(36*1), "TUTORIAL", true, !tutorialModeHighlighted)
		draw_set_color($333128);
		if(global.isTutorial)
			draw_text(250+loadW+50+string_width("TUTORIAL"), dY/2+(36*1), "on");
		else
			draw_text(250+loadW+50+string_width("TUTORIAL"), dY/2+(36*1), "off");
		
		// Create Button	
		draw_menu_button(250+loadW+30, dY/2+(36*2), "CREATE", true, !createHighlighted);
		
		draw_set_color($5938FF);
		draw_set_alpha(nameExistsAlready);
		draw_text(250+loadW+30, dY/2+(36*3), "A save with that name already exists");
		
	} 
	// if loading a save
	else if(load) {
		
		var maxWidth = string_width("WWWWWWWWWWWW");
		var maxHeight = string_height("WWWWWWWWWWWW");
		var loadX = 250+loadW+54;
		var loadY = -1;
		
		//size of ds list (array)
		var nameListSize = ds_list_size(global.saveFileNames);
		
		if(nameListSize == 0){
			draw_menu_button(250+loadW+30, dY/2+36, "No saves", false, false);
			nameListSize = 1; // just for drawing edit and load
		} else {
			
			// Drawing save names
			for(var i = 0; i < nameListSize; i++){
				var saveName = ds_list_find_value(global.saveFileNames,i);
				var nameX = 250+loadW+30;
				var nameY = dY/2+((36)+36*i) - (36*round(nameListSize/2));
				
				if(nameListSize > 1)	
					nameY = dY/2+((36)+36*i) - (36*round(nameListSize/2)) + 36;
				
				//show_debug_message(string(nameListSize/2)); 
				
				// Highlighting
				nameHighlighted = false;
				if(!nameHighlighted && wx > nameX && wx < nameX + string_width(saveName) && wy > nameY - string_height(saveName)/2 +8 && wy < nameY + string_height(saveName)/2 -8) { //&& wy < nameY + string_height(saveName)/2 - 2
					//audio_play_sound(sn_menu_highlight,1,false);
					nameHighlighted = true;
				}
				
				// Editing name
				if(editSelected && fileSelected == saveName) {
					// Keeping the name under 12 characters
					if(string_length(keyboard_string) > 12)
						keyboard_string = string_copy(keyboard_string, 0, 12);
			
					if(keyboard_string == "" && typer)
						draw_menu_button(nameX, nameY, "|", true, true);
					else if(keyboard_string == "")
						draw_menu_button(nameX, nameY, "|", true, false);
					else
						draw_menu_button(nameX, nameY, string_upper(keyboard_string), true, true);
						
				} else {
					if(fileSelected != saveName)
						draw_menu_button(nameX, nameY, string_upper(saveName), true, !nameHighlighted);
					else
						draw_menu_button(nameX, nameY, string_upper(saveName), true, nameHighlighted);
				}
				
				if(fileSelected == saveName) {
					draw_set_color($5938FF);
					draw_set_alpha(nameExistsAlready);
					draw_text(loadX+maxWidth+125, nameY, "A save with that name already exists")
				}
					
				// Drawing save name
				//if(editSelected && fileSelected != saveName) {
					
				//}
				
				// Selecting a save
				if(mouse_check_button_pressed(global.M_LEFT) && nameHighlighted && !editSelected)
					if(fileSelected != saveName)
						fileSelected = saveName;
					else
						fileSelected = "";
						
				if(fileSelected == saveName)
					loadY = nameY;
					
			}
		}
		
		// Drawing load edit delete
		if(fileSelected != ""){
				
			// Edit button
			if(!editHighlighted && wx > loadX+maxWidth && wx < loadX+maxWidth+string_width("EDIT") && wy > loadY-36-maxHeight/2+8 && wy < loadY-36+maxHeight/2-8){
				audio_play_sound(sn_menu_highlight,1,false);
				editHighlighted = true;
			}
			else if(!(wx > loadX+maxWidth && wx < loadX+maxWidth+string_width("EDIT") && wy > loadY-36-maxHeight/2+8 && wy < loadY-36+maxHeight/2-8))
				editHighlighted = false;
				
			// Load button
			if(!startHighlighted && wx > loadX+maxWidth && wx < loadX+maxWidth+string_width("LOAD") && wy > loadY-maxHeight/2+8 && wy < loadY+maxHeight/2-8){
				audio_play_sound(sn_menu_highlight,1,false);
				startHighlighted = true;
			}
			else if(!(wx > loadX+maxWidth && wx < loadX+maxWidth+string_width("LOAD") && wy > loadY-maxHeight/2+8 && wy < loadY+maxHeight/2-8))
				startHighlighted = false;
			
			// Delete button
			if(!deleteHighlighted && wx > loadX+maxWidth && wx < loadX+maxWidth+string_width("DELETE") && wy > loadY+36-maxHeight/2+8 && wy < loadY+36+maxHeight/2-8) {
				audio_play_sound(sn_menu_highlight,1,false);
				deleteHighlighted = true;
			}
			else if(!(wx > loadX+maxWidth && wx < loadX+maxWidth+string_width("DELETE") && wy > loadY+36-maxHeight/2+8 && wy < loadY+36+maxHeight/2-8))
				deleteHighlighted = false;
			
			// Edit button
			draw_menu_button(loadX+maxWidth, loadY-36, "EDIT", true, !editHighlighted);
			
			// Load button
			draw_menu_button(loadX+maxWidth, loadY, "LOAD", true, !startHighlighted);
		
			// Delete button
			draw_menu_button(loadX+maxWidth, loadY+36, "DELETE", true, !deleteHighlighted);
			
		}
		
	}
	
} else if(global.options) {
	
	// Settings button
	draw_menu_button(250, dY/2, "Settings", false, settingsHighlighted);
	
	// Controls button
	draw_menu_button(250, dY/2+36, "Controls", false, controlsHighlighted);
	
	var controlsW = string_width("Controls");
	
	#region Settings/Controls
	if(settings) {
		
		// Fullscreen button
		draw_menu_button(250+controlsW+30, dY/2-(36*2), "WINDOW", true, !windowHighlighted);
		
		draw_set_color($333128);
		if(window_get_fullscreen())
			draw_text(250+controlsW+50+string_width("WINDOW"), dY/2-(36*2), "fullscreen");
		else
			draw_text(250+controlsW+50+string_width("WINDOW"), dY/2-(36*2), "windowed");
		
		// Fullscreen button
		draw_menu_button(250+controlsW+30, dY/2-(36*1), "RESOLUTION", true, !resolutionHighlighted);
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("RESOLUTION"), dY/2-(36*1), string(currentResolution) + "x" + string(round((currentResolution/16)*9)));
		
		// FX button
		draw_menu_button(250+controlsW+30, dY/2+(36*0), "FX VOLUME", true, !fxHighlighted);
		
		draw_set_color($333128);
		for(var i = 0; i < global.SN_FX*5; i++) {
			draw_rectangle(250+controlsW+string_width("FX VOLUME")+50+(i*10), dY/2-(14*1), 250+controlsW+string_width("FX VOLUME")+50+(i*10)+5, dY/2+13, false);
		}
		
		// Music button
		draw_menu_button(250+controlsW+30, dY/2+(36*1), "MUSIC VOLUME", true, !musicHighlighted);
		
		draw_set_color($333128);
		for(var i = 0; i < global.SN_MUSIC*5; i++) {
			draw_rectangle(250+controlsW+string_width("MUSIC VOLUME")+50+(i*10), dY/2+(22*1), 250+controlsW+string_width("MUSIC VOLUME")+50+(i*10)+5, dY/2+(25*2), false);
		}
		
		// Censoring button
		draw_menu_button(250+controlsW+30, dY/2+(36*2), "CENSORING", true, !censorHighlighted);
			
		draw_set_color($333128);
		if(global.censoring)
			draw_text(250+controlsW+50+string_width("CENSORING"), dY/2+(36*2), "on");
		else if(!global.censoring)
			draw_text(250+controlsW+50+string_width("CENSORING"), dY/2+(36*2), "off");
			
		// Hints button
		draw_menu_button(250+controlsW+30, dY/2+(36*3), "INTERACTABLE HINTS", true, !hintsHighlighted);
			
		draw_set_color($333128);
		if(global.hints)
			draw_text(250+controlsW+50+string_width("INTERACTABLE HINTS"), dY/2+(36*3), "on");
		else if(!global.hints)
			draw_text(250+controlsW+50+string_width("INTERACTABLE HINTS"), dY/2+(36*3), "off");
		
	}
	else if(controls) {
		
		// Interact button
		draw_menu_button(250+controlsW+30, dY/2-(36*5), "PRIMARY", true, !primaryHighlighted);
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("PRIMARY"), dY/2-(36*5), "Left Mouse");
		
		// Rotate Camera button
		draw_menu_button(250+controlsW+30, dY/2-(36*4), "SECONDARY", true, !secondaryHighlighted);
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("SECONDARY"), dY/2-(36*4), "Right Mouse");
		
		// Walk button
		draw_menu_button(250+controlsW+30, dY/2-(36*3), "WALK", true, !walkHighlighted);
		
		var walkName = ""
		
		switch(global.K_UP) {
			case 8: walkName = "Backspace"; break;
			case 9: walkName = "Tab"; break;
			case 13: walkName = "Enter"; break;
			case 16: walkName = "Shift"; break;
			case 20: walkName = "Caps Lock"; break;
			case 27: walkName = ansi_char(global.K_UP); break;
			case 32: walkName = "Spacebar"; break;
			case 46: walkName = "Delete"; break;
			case 162: walkName = "Ctrl"; break;
			case 164: walkName = "Alt"; break;
			default: walkName = ansi_char(global.K_UP); break;
		}
		
		if(controlSelected == 0 && typer)
			walkName = "_";
		else if(controlSelected == 0 && !typer)
			walkName = " ";
		
		if(controlSelected != 1) {
			switch(global.K_LEFT) {
				case 8: walkName += " Backspace"; break;
				case 9: walkName += " Tab"; break;
				case 13: walkName += " Enter"; break;
				case 16: walkName += " Shift"; break;
				case 20: walkName += " Caps Lock"; break;
				case 27: walkName += " " + ansi_char(global.K_LEFT); break;
				case 32: walkName += " Spacebar"; break;
				case 46: walkName += " Delete"; break;
				case 162: walkName += " Ctrl"; break;
				case 164: walkName += " Alt"; break;
				default: walkName += " " + ansi_char(global.K_LEFT); break;
			}
		}
		
		if(controlSelected == 1 && typer)
			walkName += " _";
		else if(controlSelected == 1 && !typer)
			walkName += "  ";
		
		if(controlSelected != 2) {
			switch(global.K_DOWN) {
				case 8: walkName += " Backspace"; break;
				case 9: walkName += " Tab"; break;
				case 13: walkName += " Enter"; break;
				case 16: walkName += " Shift"; break;
				case 20: walkName += " Caps Lock"; break;
				case 27: walkName += " " + ansi_char(global.K_DOWN); break;
				case 32: walkName += " Spacebar"; break;
				case 46: walkName += " Delete"; break;
				case 162: walkName += " Ctrl"; break;
				case 164: walkName += " Alt"; break;
				default: walkName += " " + ansi_char(global.K_DOWN); break;
			}
		}
		
		if(controlSelected == 2 && typer)
			walkName += " _";
		else if(controlSelected == 2 && !typer)
			walkName += "  ";
			
		if(controlSelected != 3) {
			switch(global.K_RIGHT) {
				case 8: walkName += " Backspace"; break;
				case 9: walkName += " Tab"; break;
				case 13: walkName += " Enter"; break;
				case 16: walkName += " Shift"; break;
				case 20: walkName += " Caps Lock"; break;
				case 27: walkName += " " + ansi_char(global.K_RIGHT); break;
				case 32: walkName += " Spacebar"; break;
				case 46: walkName += " Delete"; break;
				case 162: walkName += " Ctrl"; break;
				case 164: walkName += " Alt"; break;
				default: walkName += " " + ansi_char(global.K_RIGHT); break;
			}
		}
		
		if(controlSelected == 3 && typer)
			walkName += " _";
		else if(controlSelected == 3 && !typer)
			walkName += "  ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("WALK"), dY/2-(36*3), walkName);
		
		// Run button
		draw_menu_button(250+controlsW+30, dY/2-(36*2), "RUN", true, !runHighlighted);
		
		var runName = "Shift";
		
		switch(global.K_RUN) {
			case 8: runName = "Backspace"; break;
			case 9: runName = "Tab"; break;
			case 13: runName = "Enter"; break;
			case 16: runName = "Shift"; break;
			case 20: runName = "Caps Lock"; break;
			case 27: runName = ansi_char(global.K_RUN); break;
			case 32: runName = "Spacebar"; break;
			case 46: runName = "Delete"; break;
			case 162: runName = "Ctrl"; break;
			case 164: runName = "Alt"; break;
			default: runName = ansi_char(global.K_RUN); break;
		}
		
		if(controlSelected == 4 && typer)
			runName = "_";
		else if(controlSelected == 4 && !typer)
			runName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("RUN"), dY/2-(36*2), runName);
		
		// Sit button
		draw_menu_button(250+controlsW+30, dY/2-(36*1), "SIT", true, !sitHighlighted);
		
		var sitName = "";
		
		switch(global.K_SIT) {
			case 8: sitName = "Backspace"; break;
			case 9: sitName = "Tab"; break;
			case 13: sitName = "Enter"; break;
			case 16: sitName = "Shift"; break;
			case 20: sitName = "Caps Lock"; break;
			case 27: sitName = ansi_char(global.K_SIT); break;
			case 32: sitName = "Spacebar"; break;
			case 46: sitName = "Delete"; break;
			case 162: sitName = "Ctrl"; break;
			case 164: sitName = "Alt"; break;
			default: sitName = ansi_char(global.K_SIT); break;
		}
		
		if(controlSelected == 5 && typer)
			sitName = "_";
		else if(controlSelected == 5 && !typer)
			sitName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("SIT"), dY/2-(36*1), sitName);
		
		// Dodge button
		draw_menu_button(250+controlsW+30, dY/2+(36*0), "DODGE", true, !dodgeHighlighted);
		
		var targetName = "";
		
		switch(global.K_DODGE) {
			case 8: targetName = "Backspace"; break;
			case 9: targetName = "Tab"; break;
			case 13: targetName = "Enter"; break;
			case 16: targetName = "Shift"; break;
			case 20: targetName = "Caps Lock"; break;
			case 27: targetName = "Esc"; break;
			case 32: targetName = "Spacebar"; break;
			case 46: targetName = "Delete"; break;
			case 162: targetName = "Ctrl"; break;
			case 164: targetName = "Alt"; break;
			default: targetName = ansi_char(global.K_DODGE); break;
		}
		
		if(controlSelected == 6 && typer)
			targetName = "_";
		else if(controlSelected == 6 && !typer)
			targetName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("DODGE"), dY/2+(36*0), targetName);
		
		// Reload button
		draw_menu_button(250+controlsW+30, dY/2+(36*1), "RELOAD", true, !reloadHighlighted);
		
		var reloadName = "";
		
		switch(global.K_RELOAD) {
			case 8: reloadName = "Backspace"; break;
			case 9: reloadName = "Tab"; break;
			case 13: reloadName = "Enter"; break;
			case 16: reloadName = "Shift"; break;
			case 20: reloadName = "Caps Lock"; break;
			case 27: reloadName = "Esc"; break;
			case 32: reloadName = "Spacebar"; break;
			case 46: reloadName = "Delete"; break;
			case 162: reloadName = "Ctrl"; break;
			case 164: reloadName = "Alt"; break;
			default: reloadName = ansi_char(global.K_RELOAD); break;
		}
		
		if(controlSelected == 7 && typer)
			reloadName = "_";
		else if(controlSelected == 7 && !typer)
			reloadName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("RELOAD"), dY/2+(36*1), reloadName);
		
		// Inventory button
		draw_menu_button(250+controlsW+30, dY/2+(36*2), "INVENTORY", true, !inventoryHighlighted);
		
		var inventoryName = "";
		
		switch(global.K_INVENTORY) {
			case 8: inventoryName = "Backspace"; break;
			case 9: inventoryName = "Tab"; break;
			case 13: inventoryName = "Enter"; break;
			case 16: inventoryName = "Shift"; break;
			case 20: inventoryName = "Caps Lock"; break;
			case 27: inventoryName = "Esc"; break;
			case 32: inventoryName = "Spacebar"; break;
			case 46: inventoryName = "Delete"; break;
			case 162: inventoryName = "Ctrl"; break;
			case 164: inventoryName = "Alt"; break;
			default: inventoryName = ansi_char(global.K_INVENTORY); break;
		}
		
		if(controlSelected == 8 && typer)
			inventoryName = "_";
		else if(controlSelected == 8 && !typer)
			inventoryName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("INVENTORY"), dY/2+(36*2), inventoryName);
		
		// Map button
		draw_menu_button(250+controlsW+30, dY/2+(36*3), "MAP", true, !mapHighlighted);
		
		var mapName = "";
		
		switch(global.K_MAP) {
			case 8: mapName = "Backspace"; break;
			case 9: mapName = "Tab"; break;
			case 13: mapName = "Enter"; break;
			case 16: mapName = "Shift"; break;
			case 20: mapName = "Caps Lock"; break;
			case 27: mapName = "Esc"; break;
			case 32: mapName = "Spacebar"; break;
			case 46: mapName = "Delete"; break;
			case 162: mapName = "Ctrl"; break;
			case 164: mapName = "Alt"; break;
			default: mapName = ansi_char(global.K_MAP); break;
		}
		
		if(controlSelected == 9 && typer)
			mapName = "_";
		else if(controlSelected == 9 && !typer)
			mapName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("MAP"), dY/2+(36*3), mapName);
		
		// Pause button
		draw_menu_button(250+controlsW+30, dY/2+(36*4), "PAUSE", true, !pauseHighlighted);
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("PAUSE"), dY/2+(36*4), "Esc");
		
		// Center Camera button
		draw_menu_button(250+controlsW+30, dY/2+(36*5), "CENTER CAMERA", true, !centerHighlighted);
		
		var centerName = "";
		
		switch(global.K_CENTER) {
			case 8: centerName = "Backspace"; break;
			case 9: centerName = "Tab"; break;
			case 13: centerName = "Enter"; break;
			case 16: centerName = "Shift"; break;
			case 20: centerName = "Caps Lock"; break;
			case 27: centerName = "Esc"; break;
			case 32: centerName = "Spacebar"; break;
			case 46: centerName = "Delete"; break;
			case 162: centerName = "Ctrl"; break;
			case 164: centerName = "Alt"; break;
			default: centerName = ansi_char(global.K_CENTER); break;
		}
		
		if(controlSelected == 10 && typer)
			centerName = "_";
		else if(controlSelected == 10 && !typer)
			centerName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("CENTER CAMERA"), dY/2+(36*5), centerName);
		
		// Rotate Left button
		draw_menu_button(250+controlsW+30, dY/2+(36*6), "BUILD ROTATE LEFT", true, !rotateLeftHighlighted)
		
		var rotateLeftName = "";
		
		switch(global.K_ROTATELEFT) {
			case 8: rotateLeftName = "Backspace"; break;
			case 9: rotateLeftName = "Tab"; break;
			case 13: rotateLeftName = "Enter"; break;
			case 16: rotateLeftName = "Shift"; break;
			case 20: rotateLeftName = "Caps Lock"; break;
			case 27: rotateLeftName = "Esc"; break;
			case 32: rotateLeftName = "Spacebar"; break;
			case 46: rotateLeftName = "Delete"; break;
			case 162: rotateLeftName = "Ctrl"; break;
			case 164: rotateLeftName = "Alt"; break;
			default: rotateLeftName = ansi_char(global.K_ROTATELEFT); break;
		}
		
		if(controlSelected == 11 && typer)
			rotateLeftName = "_";
		else if(controlSelected == 11 && !typer)
			rotateLeftName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("BUILD ROTATE LEFT"), dY/2+(36*6), rotateLeftName);
		
		// Rotate Right button
		draw_menu_button(250+controlsW+30, dY/2+(36*7), "BUILD ROTATE RIGHT", true, !rotateRightHighlighted);
		
		var rotateRightName = "";
		
		switch(global.K_ROTATERIGHT) {
			case 8: rotateRightName = "Backspace"; break;
			case 9: rotateRightName = "Tab"; break;
			case 13: rotateRightName = "Enter"; break;
			case 16: rotateRightName = "Shift"; break;
			case 20: rotateRightName = "Caps Lock"; break;
			case 27: rotateRightName = "Esc"; break;
			case 32: rotateRightName = "Spacebar"; break;
			case 46: rotateRightName = "Delete"; break;
			case 162: rotateRightName = "Ctrl"; break;
			case 164: rotateRightName = "Alt"; break;
			default: rotateRightName = ansi_char(global.K_ROTATERIGHT); break;
		}
		
		if(controlSelected == 12 && typer)
			rotateRightName = "_";
		else if(controlSelected == 12 && !typer)
			rotateRightName = " ";
		
		draw_set_color($333128);
		draw_text(250+controlsW+50+string_width("BUILD ROTATE RIGHT"), dY/2+(36*7), rotateRightName);
		
		
	}
	#endregion
}
#endregion

if(!window_get_fullscreen()) {
	window_center();
	window_set_size(global.display_width, global.display_height);
}

#region Main Menu Buttons

draw_set_font(f_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_alpha(menuAlpha);

// Play
if(!global.play && !global.options && !global.credits) {
	
	draw_menu_button(250, dY/2, "Play", false, playHighlighted);
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);

	draw_menu_button(dX-17, dY-11, "Exit", false, exitHighlighted);
}

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

// Back
if(global.options || global.credits)
	draw_menu_button(dX-17, dY-11, "Back", false, backHighlighted);

// Exit/Options
if(!global.options && !global.credits  && global.play) {
	draw_menu_button(dX-17, dY-11, "Exit", false, exitHighlighted);

	// Credits
	draw_menu_button(dX-37-string_width("Exit"), dY-11, "Credits", false, creditsHighlighted);
	
	// Options
	draw_menu_button(dX-57-string_width("Exit")-string_width("Credits"), dY-11, "Options", false, optionsHighlighted);
}

draw_set_alpha(1);

#endregion

}

draw_set_alpha(1);

// Drawing outer cursor
draw_sprite(s_mouse_cursor_out,0,mx,my);

if(!o_player.isSitting)
	draw_sprite(s_loading, global.loadingIndex, x_to_gui(o_player.x,o_player.y-28), y_to_gui(o_player.x,o_player.y-28));
	
if(global.loadingIndex < 16)
	global.loadingIndex+=.5;
else
	global.loadingIndex = 0;