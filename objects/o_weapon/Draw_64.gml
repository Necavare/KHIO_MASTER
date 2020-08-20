if(showtext)
	draw_title(string(ammo), 0, display_get_gui_width()/2+50, display_get_gui_height()/2-80);
	
if(options) {
	show_debug_message("options true");
	
	//window_mouse_set(device_mouse_x_to_gui(0), optionsY);
	var xx = optionsX;
	var yy = optionsY;
	// 0 = normal, 1 = poison, 2= fire, 3=bone normal, 4=bone poison, 5=flint normal, 6= flint poison,
	// 7 = metal normal, 8 = metal poison
	
	//draw the left collumn
	var leftMaxStringS = 0;
	var rightMaxStringS = 0;
	var leftColY = yy-14;
	var leftColY2 = mouseY-14;
	draw_set_font(f_hud);
	highlightLoad = -1;
	if(wBoltP){ 
		if((window_mouse_get_x() < mouseX - 18) && (window_mouse_get_y() < leftColY2 +28) && (window_mouse_get_y() > leftColY2)){
			draw_titleRightAlligned("Wooden Bolt",-1, xx-18, leftColY);
			highlightLoad = 0;
		}else
			draw_titleRightAlligned("Wooden Bolt",0, xx-18, leftColY);
		if(string_width("Wooden Bolt") > leftMaxStringS)
			leftMaxStringS = string_width("Wooden Bolt");
		leftColY+=32
		leftColY2+=32
	}
	if(bBoltP){
		if((window_mouse_get_x() < mouseX - 18) && (window_mouse_get_y() <leftColY2 +28) && (window_mouse_get_y() > leftColY2)){
			draw_titleRightAlligned("Bone Bolt",-1, xx-18, leftColY);
			highlightLoad = 3;
		}else
			draw_titleRightAlligned("Bone Bolt",0, xx-18, leftColY);
		if(string_width("Bone Bolt") > leftMaxStringS)
			leftMaxStringS = string_width("Bone Bolt");
		leftColY+=32
		leftColY2+=32
	}
	if(flBoltP){
		if((window_mouse_get_x() < mouseX - 18) && (window_mouse_get_y() < leftColY2 +28) && (window_mouse_get_y() > leftColY2)){
			draw_titleRightAlligned("Stone Bolt",-1, xx-18, leftColY2);
			highlightLoad = 5;
		}else
			draw_titleRightAlligned("Stone Bolt",0, xx-18, leftColY2);
		if(string_width("Stone Bolt") > leftMaxStringS)
			leftMaxStringS = string_width("Stone Bolt");
		leftColY+=32
		leftColY2+=32
	}
	if(mBoltP){
		if((window_mouse_get_x() < mouseX - 18) && (window_mouse_get_y() < leftColY2 +28) && (window_mouse_get_y() > leftColY2)){
			draw_titleRightAlligned("Metal Bolt",-1, xx-18, leftColY);
			highlightLoad = 7;
		}else
			draw_titleRightAlligned("Metal Bolt",0, xx-18, leftColY);
		if(string_width("Metal Bolt") > leftMaxStringS)
			leftMaxStringS = string_width("Metal Bolt");
		leftColY+=32
		leftColY2+=32
	}
	
	
	//draw the right collumn
	var rightColY = yy-16;
	var rightColY2 = mouseY-16;
	if(wPoisBoltP){
		if((window_mouse_get_x() > mouseX + 18) && (window_mouse_get_y() < rightColY2 +28) && (window_mouse_get_y() > rightColY2)){
			draw_title("Poison Wooden Bolt", -1, xx +18, rightColY);
			highlightLoad = 1;
		}else
			draw_title("Poison Wooden Bolt", 0, xx +18, rightColY);
		if(string_width("Poison Wooden Bolt") > rightMaxStringS)
			rightMaxStringS = string_width("Poison Wooden Bolt");
		rightColY+=32
		rightColY2+=32
	}
	if(bPoisBoltP){
		if((window_mouse_get_x() > mouseX + 18) && (window_mouse_get_y() < rightColY2 +28) && (window_mouse_get_y() > rightColY2)){
			draw_title("Poison Bone Bolt", -1, xx +18, rightColY);
			highlightLoad = 4;
		}else
			draw_title("Poison Bone Bolt", 0, xx +18, rightColY);
		if(string_width("Poison Bone Bolt") > rightMaxStringS)
			rightMaxStringS = string_width("Poison Bone Bolt");
		rightColY+=32
		rightColY2+=32
	}
	if(flPoisBoltP){
		if((window_mouse_get_x() > mouseX + 18) && (window_mouse_get_y() < rightColY2 +28) && (window_mouse_get_y() > rightColY2)){
			draw_title("Poison Stone Bolt", -1, xx +18, rightColY);
			highlightLoad = 6;
		}else
			draw_title("Poison Stone Bolt", 0, xx +18, rightColY);
		if(string_width("Poison Stone Bolt") > rightMaxStringS)
			rightMaxStringS = string_width("Poison Stone Bolt");
		rightColY+=32
		rightColY2+=32
	}
	if(mPoisBoltP){
		if((window_mouse_get_x() > mouseX + 18) && (window_mouse_get_y() < rightColY2 +28) && (window_mouse_get_y() > rightColY2)){
			draw_title("Poison Metal Bolt", -1, xx +18, rightColY);
			highlightLoad = 8;
		}else
			draw_title("Poison Metal Bolt", 0, xx +18, rightColY);
		if(string_width("Poison Metal Bolt") > rightMaxStringS)
			rightMaxStringS = string_width("Poison Metal Bolt");
		rightColY+=32
		rightColY2+=32
	}
	if(fBoltP){
		if((window_mouse_get_x() > mouseX + 18) && (window_mouse_get_y() < rightColY2 +28) && (window_mouse_get_y() > rightColY2)){
			draw_title("Flame Bolt", -1, xx +18, rightColY);
			highlightLoad = 2;
		}else
			draw_title("Flame Bolt", 0, xx +18, rightColY);
		if(string_width("Flame Bolt") > rightMaxStringS)
			rightMaxStringS = string_width("Flame Bolt");
		rightColY+=32
		rightColY2+=32
	}
	
	
	show_debug_message("leftMaxStringS: "+string(leftMaxStringS));
	show_debug_message("rightMaxStringS: "+string(rightMaxStringS));
	//keep it in the range of options x
	if(window_mouse_get_x() < mouseX - leftMaxStringS -18 - 8)
		window_mouse_set(mouseX - leftMaxStringS -18 - 8, window_mouse_get_y());
	if(window_mouse_get_x() > mouseX + rightMaxStringS +18 +6 )
		window_mouse_set(mouseX + rightMaxStringS +18 +6, window_mouse_get_y());
	
	//keep it in range of options y
	var colYMax = max(rightColY2, leftColY2);
	if(window_mouse_get_y() < mouseY - 14)
		window_mouse_set(window_mouse_get_x(), mouseY - 14);
	if(window_mouse_get_y() > colYMax)
		window_mouse_set(window_mouse_get_x(), colYMax);
	
	
	// First option
		//decide wether first option is bolt or poison bolt
		/*
		if(device_mouse_x_to_gui(0) < xx - 120)
			window_mouse_set(xx - 120, yy);
		if(device_mouse_x_to_gui(0) < xx - 69)
			draw_title("Bolt", -1, xx -120, yy-14);
		else
			draw_title("Bolt", 0, xx -120, yy-14);
			
		//if(device_mouse_x_to_gui(0) < xx - 64)
		//	window_mouse_set(xx - 64, yy);
		if((device_mouse_x_to_gui(0) > xx - 64) && (device_mouse_x_to_gui(0) < xx+59))
			draw_title("Poison Bolt", -1,  xx-64, yy-14);
		else
			draw_title("Poison Bolt", 0,  xx-64, yy-14);
		
		// Second option
		if(device_mouse_x_to_gui(0) > xx + 173)
			window_mouse_set(xx + 173, yy);
		if(device_mouse_x_to_gui(0) > xx + 56)
			draw_title("Flame Bolt", -1, xx+56, yy-14);
		else
			draw_title("Flame Bolt", 0, xx+56, yy-14);
	if(optionNum = 2){
		// First option
		//decide wether first option is bolt or poison bolt
		var name1 = "";
		var xoff1 = 79;
		if(boltP){
			name1 = "Bolt";
			xoff1 = 55;
		}
		else if(pboltP){
			name1 = "Poison Bolt";
			xoff1 = 124;	
		}
		if(device_mouse_x_to_gui(0) < xx - xoff1)
			window_mouse_set(xx - xoff1, yy);
		if(device_mouse_x_to_gui(0) < xx - 10)
			draw_title(name1, -1,  xx-xoff1, yy-14);
		else
			draw_title(name1, 0,  xx-xoff1, yy-14);
		
		// Second option
		var name2 = "";
		if(boltP && pboltP)
			name2 = "Poison Bolt"
		else
			name2 = "Flame Bolt"
		if(device_mouse_x_to_gui(0) > xx + 66)
			window_mouse_set(xx + 66, yy);
	
		if(device_mouse_x_to_gui(0) > xx + 10)
			draw_title(name2, -1, xx+14, yy-14);
		else
			draw_title(name2, 0, xx+14, yy-14);
	}
	else if(optionNum == 3){
		// First option
		//decide wether first option is bolt or poison bolt
		if(device_mouse_x_to_gui(0) < xx - 120)
			window_mouse_set(xx - 120, yy);
		if(device_mouse_x_to_gui(0) < xx - 69)
			draw_title("Bolt", -1, xx -120, yy-14);
		else
			draw_title("Bolt", 0, xx -120, yy-14);
			
		//if(device_mouse_x_to_gui(0) < xx - 64)
		//	window_mouse_set(xx - 64, yy);
		if((device_mouse_x_to_gui(0) > xx - 64) && (device_mouse_x_to_gui(0) < xx+59))
			draw_title("Poison Bolt", -1,  xx-64, yy-14);
		else
			draw_title("Poison Bolt", 0,  xx-64, yy-14);
		
		// Second option
		if(device_mouse_x_to_gui(0) > xx + 173)
			window_mouse_set(xx + 173, yy);
		if(device_mouse_x_to_gui(0) > xx + 56)
			draw_title("Flame Bolt", -1, xx+56, yy-14);
		else
			draw_title("Flame Bolt", 0, xx+56, yy-14);
	}*/
	
}

if(global.isInventoryOpen)
	options = false;