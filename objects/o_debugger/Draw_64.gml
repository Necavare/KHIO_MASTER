if(!consoleOpen) {
	var m = 5;
	var xx1 = 200;
	var yy1 = 60;
	var str1 = ("FPS: " + string(fps_real) + " Camera Rotation: " + string(global.camera_angle));

	var xx2 = 200;
	var yy2 = 90;
	var str2 = ("HOUR: " + string(global.hour) + " MINUTE: " + string(o_shaders.minute_of_day));

	var xx3 = 200;
	var yy3 = 120;
	var str3 = ("Instance Number: " + string(instance_number(all)));

	var xx4 = 200;
	var yy4 = 150;
	var str4 = ("Player X: " + string(o_player.x) + " Player Y: " + string(o_player.y));

	var xx5 = 200;
	var yy5 = 180;
	var str5 = ("W Mouse X: " + string(window_mouse_get_x()) + " W Mouse Y: " + string(window_mouse_get_y()));

	var xx6 = 200;
	var yy6 = 210;
	var str6 = ("F2 to enable drawing collision boxes.");

	var xx7 = 200;
	var yy7 = 240;
	var str7 = ("F3 to pause time");

	var xx8 = 200;
	var yy8 = 270;
	var str8 = ("F4 to toggle snow");

	var xx9 = 200;
	var yy9 = 300;
	var str9 = ("F9 to print all instances");

	var xx10 = 200;
	var yy10 = 330;
	var str10 = ("F5 for god mode");

	var xx11 = 200;
	var yy11 = 360;
	var str11 = ("F6 to die");

	var xx12 = 200;
	var yy12 = 390;
	var str12 = ("F7 for developer console");

	if(debuggerOpen) {
	
		// Drawing debugging background
		draw_set_color($333128);
		draw_set_alpha(.5);
	
		// Drawing debugging text/rectangles
		draw_set_font(f_hud);
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
	
		draw_rectangle(xx1 - string_width(str1)/2 - m, yy1 - string_height("F")/2 + 6 - m, xx1 + string_width(str1)/2 - 4 + m, yy1 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx2 - string_width(str2)/2 - m, yy2 - string_height("F")/2 + 6 - m, xx2 + string_width(str2)/2 - 4 + m, yy2 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx3 - string_width(str3)/2 - m, yy3 - string_height("F")/2 + 6 - m, xx3 + string_width(str3)/2 - 4 + m, yy3 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx4 - string_width(str4)/2 - m, yy4 - string_height("F")/2 + 6 - m, xx4 + string_width(str4)/2 - 4 + m, yy4 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx5 - string_width(str5)/2 - m, yy5 - string_height("F")/2 + 6 - m, xx5 + string_width(str5)/2 - 4 + m, yy5 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx6 - string_width(str6)/2 - m, yy6 - string_height("F")/2 + 6 - m, xx6 + string_width(str6)/2 - 4 + m, yy6 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx7 - string_width(str7)/2 - m, yy7 - string_height("F")/2 + 6 - m, xx7 + string_width(str7)/2 - 4 + m, yy7 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx8 - string_width(str8)/2 - m, yy8 - string_height("F")/2 + 6 - m, xx8 + string_width(str8)/2 - 4 + m, yy8 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx9 - string_width(str9)/2 - m, yy9 - string_height("F")/2 + 6 - m, xx9 + string_width(str9)/2 - 4 + m, yy9 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx10 - string_width(str10)/2 - m, yy10 - string_height("F")/2 + 6 - m, xx10 + string_width(str10)/2 - 4 + m, yy10 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx11 - string_width(str11)/2 - m, yy11 - string_height("F")/2 + 6 - m, xx11 + string_width(str11)/2 - 4 + m, yy11 + string_height("F")/2 - 7 + m, false);
		draw_rectangle(xx12 - string_width(str12)/2 - m, yy12 - string_height("F")/2 + 6 - m, xx12 + string_width(str12)/2 - 4 + m, yy12 + string_height("F")/2 - 7 + m, false);
	
		draw_set_color(c_white);
		draw_set_alpha(1);
	
		draw_text(xx1,yy1, str1);
		draw_text(xx2,yy2, str2);
		draw_text(xx3,yy3, str3);
		draw_text(xx4,yy4, str4);
		draw_text(xx5,yy5, str5);
		draw_text(xx6,yy6, str6);
		draw_text(xx7,yy7, str7);
		draw_text(xx8,yy8, str8);
		draw_text(xx9,yy9, str9);
		draw_text(xx10,yy10, str10);
		draw_text(xx11,yy11, str11);
		draw_text(xx12,yy12, str12);
	}
}

if(instancePrint){
	show_debug_message("----------------------------------");
	show_debug_message("PRINTING ALL ACTIVE INSTANCE NAMES");
	show_debug_message("----------------------------------");
	
	var numInst = 0;
	with(all){
		show_debug_message("inst: "+string(numInst)+" "+string(object_get_name(object_index)));
		numInst++;
	}
	show_debug_message("----------------------------------");
	instancePrint = false;
}