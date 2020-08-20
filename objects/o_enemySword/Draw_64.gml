if(playerNear) {
	// Drawing speech text
	var xx = x+lengthdir_x(26, -global.camera_angle+90);
	var yy = y+lengthdir_y(26, -global.camera_angle+90);

	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	if(global.hour > 8 && global.hour < 19)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
	
	// Switching category
	if(playerFlee && !freakOut && bleedingTimer <= 0) { // Cowardly
		stringCat = 0;
	} else if(playerDetected && !playerInRange && !freakOut && bleedingTimer <= 0) { // Chasing player
		stringCat = 1;
	} else if(freakOut && bleedingTimer <= 0) { // On fire
		stringCat = 2;
	} else if(bleedingTimer > 0) { // Bleeding
		if(stringCat != 3)
			switchStatement = true;
		stringCat = 3;
	} else
		stringCat = -1;
	
	// Setting random final string
	if(switchStatement && !noString) {
		var duplicate = false;
	
		if(stringCat == 0) { // Cowardly
			switch(irandom_range(0,5)) {
				case 0: if(last_string != string1_1) final_string = string1_1; else duplicate = true; break;
				case 1: if(last_string != string1_2) final_string = string1_2; else duplicate = true; break;
				case 2: if(last_string != string1_3) final_string = string1_3; else duplicate = true; break;
				case 3: if(last_string != string1_4) final_string = string1_4; else duplicate = true; break;
				case 4: if(last_string != string1_5) final_string = string1_5; else duplicate = true; break;
				case 5: if(last_string != string1_6) final_string = string1_6; else duplicate = true; break;
			}
		} else if(stringCat == 1) { // Chasing player
			switch(irandom_range(0,4)) {
				case 0: if(last_string != string2_1) final_string = string2_1; else duplicate = true; break;
				case 1: if(last_string != string2_2) final_string = string2_2; else duplicate = true; break;
				case 2: if(last_string != string2_3) final_string = string2_3; else duplicate = true; break;
				case 3: if(last_string != string2_4) final_string = string2_4; else duplicate = true; break;
				case 4: if(last_string != string2_5) final_string = string2_5; else duplicate = true; break;
			}
		} else if(stringCat == 2) { // Freak out (on fire)
			switch(irandom_range(0,3)) {
				case 0: if(last_string != string3_1) final_string = string3_1; else duplicate = true; break;
				case 1: if(last_string != string3_2) final_string = string3_2; else duplicate = true; break;
				case 2: if(last_string != string3_3) final_string = string3_3; else duplicate = true; break;
				case 3: if(last_string != string3_4) final_string = string3_4; else duplicate = true; break;
			}
		} else if(stringCat == 3) { // Gets hit
			switch(irandom_range(0,4)) {
				case 0: if(last_string != string4_1) final_string = string4_1; else duplicate = true; break;
				case 1: if(last_string != string4_2) final_string = string4_2; else duplicate = true; break;
				case 2: if(last_string != string4_3) final_string = string4_3; else duplicate = true; break;
				case 3: if(last_string != string4_4) final_string = string4_4; else duplicate = true; break;
				case 4: if(last_string != string4_5) final_string = string4_5; else duplicate = true; break;
			}
		}  else if(stringCat == -1)
			final_string = "";
		
		if(final_string != "")
			last_string = final_string;
		
		if(!duplicate) {
			switchStatement = false;
			if(alarm[7] == -1)
				alarm[7] = 60;
		}
	}

	if(noString)
		final_string = "";

	if(!isDead && !isDying)
		draw_text(x_to_gui(xx,yy), y_to_gui(xx, yy), final_string);
}