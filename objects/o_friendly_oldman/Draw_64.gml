// Drawing text for old man
var xx = x+lengthdir_x(24, -global.camera_angle+90);
var yy = y+lengthdir_y(24, -global.camera_angle+90);

// Player first encountering
if(collision_circle(x,y, 50, o_player, true, true) && !playerHello) {
	stringCat = 4;
	
	switchStatement = true;
	noString = false;
	alarm[5] = -1;
	alarm[8] = -1;
	
	if(alarm[7] == -1)
		alarm[7] = 60;
	
} else if(collision_circle(x,y, 50, o_player, true, true) && playerHello) {
	stringCat = 5;
} else {
	playerHello = false;
}
	


draw_set_font(f_hud);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
if(global.hour > 8 && global.hour < 19)
	draw_set_color($333128);
else
	draw_set_color(c_white);

// Setting random final string
if(switchStatement && !noString) {
	var duplicate = false;
	
	if(stringCat == 0) {
		switch(irandom_range(0,2)) {
			case 0: if(last_string != string1_1) final_string = string1_1; else duplicate = true; break;
			case 1: if(last_string != string1_2) final_string = string1_2; else duplicate = true; break;
			case 2: if(last_string != string1_3) final_string = string1_3; else duplicate = true; break;
		}
	} else if(stringCat == 1) {
		switch(irandom_range(0,2)) {
			case 0: if(last_string != string2_1) final_string = string2_1; else duplicate = true; break;
			case 1: if(last_string != string2_2) final_string = string2_2; else duplicate = true; break;
			case 2: if(last_string != string2_3) final_string = string2_3; else duplicate = true; break;
		}
	} else if(stringCat == 2) {
		switch(irandom_range(0,2)) {
			case 0: if(last_string != string3_1) final_string = string3_1; else duplicate = true; break;
			case 1: if(last_string != string3_2) final_string = string3_2; else duplicate = true; break;
			case 2: if(last_string != string3_3) final_string = string3_3; else duplicate = true; break;
		}
	} else if(stringCat == 3) {
		switch(irandom_range(0,2)) {
			case 0: if(last_string != string4_1) final_string = string4_1; else duplicate = true; break;
			case 1: if(last_string != string4_2) final_string = string4_2; else duplicate = true; break;
			case 2: if(last_string != string4_3) final_string = string4_3; else duplicate = true; break;
		}
	} else if(stringCat == 4) {
		final_string = string5_1;
	} else if(stringCat == 5) {
		switch(irandom_range(0,2)) {
			case 0: if(last_string != string6_1) final_string = string6_1; else duplicate = true; break;
			case 1: if(last_string != string6_2) final_string = string6_2; else duplicate = true; break;
			case 2: if(last_string != string6_3) final_string = string6_3; else duplicate = true; break;
		}
	} else if(stringCat == -1)
		final_string = "";
		
	if(final_string != "")
		last_string = final_string;
	
	if(!duplicate) {
		switchStatement = false;
		if(alarm[5] == -1)
			alarm[5] = 180;
	}
}

if(noString)
	final_string = "";

draw_text(x_to_gui(xx,yy), y_to_gui(xx, yy), final_string);