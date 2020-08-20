draw_self_3d(1, buildZ);

if(!editNameSelected && !global.isInventoryOpen && !global.isPaused && !o_hud.mapOpen && (global.interactingObject == -1 || global.interactingObject == self) && position_meeting(mouse_x, mouse_y, self) && collision_circle(o_player.x, o_player.y, 50, self, true, false)) {
	
	// Clicking to load interact
	if(mouse_check_button(global.M_LEFT) && global.interactingLoad < 16 && !options) {
		global.interactingLoad+=1.5;
		global.interactingObject = self;
	}
		
	// Clicking to interact
	if(mouse_check_button(global.M_LEFT) && global.interactingLoad >= 16) {
		// Opening crate
		options = true;
		optionsX = device_mouse_x_to_gui(0);
		optionsY = device_mouse_y_to_gui(0);
		mouseX = window_mouse_get_x();
		mouseY = window_mouse_get_y();
		
		// Reseting interact stuff
		global.interactingLoad = -1;
	}

}

// Editing/Changing colors
if(options && (!mouse_check_button(global.M_LEFT) || !collision_circle(o_player.x, o_player.y, 50, self, true, false))) {
	options = false;
	global.interactingObject = -1;
	if(window_mouse_get_x() > mouseX + 10) {
		// Change color
		if(window_mouse_get_x() > mouseX + 9 && window_mouse_get_x() < mouseX + 43) { // Green
			color = 0;
			//markerColor = $AFCC9F;
			markerColor = 8;
			o_hud.markerCol[index] = markerColor;
	
			//create a minimap changes
		    /*
			var miniValues;
		    miniValues[0] = s_marker_green_1; //set sprite for minimap
		    miniValues[1] = image_angle; //set angle of rotation
		    miniValues[2] = x; //x position
		    miniValues[3] = y; //y position
			miniValues[4] = y;
		    ds_map_replace(global.minimapVar, id, miniValues);*/
		} else if(window_mouse_get_x() > mouseX + 46 && window_mouse_get_x() < mouseX + 79) { // Red
			color = 1;
			//markerColor = $8E8ECC;
			markerColor = 4;
			o_hud.markerCol[index] = markerColor;
	
			//create minimap changes
			/*
			var miniValues;
		    miniValues[0] = s_marker_red_1; //set sprite for minimap
		    miniValues[1] = image_angle; //set angle of rotation
		    miniValues[2] = x; //x position
		    miniValues[3] = y; //y position
			miniValues[4] = y;
		    ds_map_replace(global.minimapVar, id, miniValues);*/
		} else if(window_mouse_get_x() > mouseX + 80) { // Blue
			color = 2;
			//markerColor = $CCC18E;
			markerColor = 6;
			o_hud.markerCol[index] = markerColor;
	
			//create minimap changes
			/*
			var miniValues;
		    miniValues[0] = s_marker_blue_1; //set sprite for minimap
		    miniValues[1] = image_angle; //set angle of rotation
		    miniValues[2] = x; //x position
		    miniValues[3] = y; //y position
			miniValues[4] = y;
		    ds_map_replace(global.minimapVar, id, miniValues);*/
		}
	} else if(window_mouse_get_x() < mouseX - 10) {
		// Edit name
		editNameSelected = true;
		
		keyboard_string = "";

	}
}

