// Drawing vignette
draw_sprite(s_vignette,1,0,0);

if(drawSave) {
	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(typer)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
		
	draw_text(960,540, "AUTO SAVING");
} else if(global.drawLoad) {
	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(typer)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
		
	draw_text(960,540, "LOADING");
}

if(global.tutorialDodge) {
	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(typer)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
		
	draw_text(960,400, "SPACE BAR TO DODGE");
}

if(global.tutorialParry) {
	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(typer)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
		
	draw_text(960,400, "RIGHT-CLICK TO PARRY/BLOCK");
}

if(global.tutorialAttack) {
	draw_set_font(f_hud);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if(typer)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
		
	draw_text(960,400, "LEFT-CLICK TO SWING");
}
	

if(showHud) {
if((keyboard_check_pressed(global.K_INVENTORY)||global.isInventoryOpening)&& !global.isPaused){
	//show_debug_message("set up stuff");
	
	#region all map/minimap variables that are reset on tab
	
	//centered position for making the minimap
	centerX = (o_player.x+global.xoffset)*(mapWidth/room_width); //map center x position
	centerY = (o_player.y+global.yoffset)*(mapHeight/room_height); //map center y position
	
	selectedCampIndex = -1;
	campSelected = false;
	selectedMarkerIndex = -1; //index of currently selected marker (-1 = false)
	editNameSelected = false; //wether or not text editor is active
	markerLibrarySelected = false; //wether or not marker library is active
	
	if(!mapOpen){
		//position of minimap (where the minimap is being drawn)
		xp = 1394; //x position of top left of map
		//yp = 20;  //y position of top left of map
		yp = 20;
	
		//set size of minimap
		mmHeight=480; //minimap height
		mmWidth=480; //minimap width
		
		fullscreenSelected = false; //wether or not fullscreen is active
	}
	else{
		mapOpen = false;	
	}
	//marker editor buttons
	markerSelected = false; //wether or not the marker EDITOR is currently selected
	markerColor = $8E8ECC; //color of marker default of red
	
	//map moving variables
	mmXoffset = 0; //current x offset from original position
	mmYoffset = 0; //current y offset from original position
	mmYoldoffset = 0; //x offset from original position 1 frame ago
	mmXoldoffset = 0; //y offset from original position 1 frame ago
	xPrevious = 0; //x position when moving began
	yPrevious = 0; //y position when moving began
	
	
	if(fullscreenSelected){
		zoom = fullscreenZoom;
		mmXoffset = fullscreen_mmXoffset;
		mmYoffset = fullscreen_mmYoffset;
	}else{
		if(!global.minimapActive)
			zoom = 1;
	}
	//zoom = 1; //current zoom % 
	
	#endregion	

}

if(global.isPaused) {
	global.draw_cursor = true;
	
	draw_sprite(global.pausedBackground,0,0,0);
	draw_set_color(c_black);
	draw_set_alpha(.5);
	draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(), 0);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	
}

if(global.isInventoryOpen) {
	
	// Drawing item names for the inventory and picked up items
	if(!global.isItemPicked) {
		// Inventory titles
		for(var ix = 0; ix < width; ix++)
			for(var iy = 0; iy < height; iy++) {
				if(slots[# ix, iy].highlighted && items[# ix, iy] > 1 && count[# ix, iy] > 0)
					item_title(items[# ix, iy], count[# ix, iy], false);
			}
		
		// Hotbar titles
		for(var iy = 0; iy < 3; iy++) {
			if(hotbarSlots[# 0, iy].highlighted && hotbarItems[# 0, iy] > 1 && hotbarCount[# 0, iy] > 0)
				item_title(hotbarItems[# 0, iy], hotbarCount[# 0, iy], false);
		}
		
		// Recipe titles
		for(var ix = 0; ix < 10; ix++)
			for(var iy = 0; iy < 3; iy++) {
				if(recipe[# ix, iy].highlighted && recipeItems[# ix, iy] > 1) {
					showDescription = false;
					item_title(recipeItems[# ix, iy], 1, true);
					recipe_title(recipeItems[# ix, iy]);
				}
			}
	} else
		item_title(global.last_item, global.picked_quantity);
		
	// Drawing names for the equipment
	if(!global.isItemPicked) {
		if(equip[# 0, 0].highlighted) {
			showDescription = false;
			item_title(-1, -1);
			if(equipItems[# 0, 0] > 1)
				item_title(equipItems[# 0, 0], -1);
		}
		if(equip[# 0, 1].highlighted) {
			showDescription = false;
			item_title(-2, -1);
			if(equipItems[# 0, 1] > 1)
				item_title(equipItems[# 0, 1], -1);
		}
	} else
		item_title(global.last_item, global.picked_quantity);
	
	if(crafting[# 0, 0].highlighted && !global.isItemPicked && craftingItems[# 0, 0] > 1)
		item_title(craftingItems[# 0, 0], craftingCount[# 0, 0]);
	else if(crafting[# 0, 0].highlighted && !global.isItemPicked)
		item_title(-8, 0);
		
	if(journal[# 0, 0].highlighted) {
		showDescription = false;
		if(journalItems[# 0, 0] > 1)
			item_title(journalItems[# 0, 0], -1);
	}
}

if(global.isInventoryOpen && !global.isPaused){
	
	#region Map
	
	if(global.isInventoryOpening)
	{
		//update then merge blocks
		var tim1 = get_timer();
		scr_update_mm(global.blockArr, global.blockUpdateArr, mapWidth, mapHeight);
		var tim2 = get_timer();
		//show_debug_message("scr_update_mm time: " +string(tim2-tim1));
		
		//var tim3 = get_timer();
		scr_merge_map(global.blockArr, mapWidth, mapHeight);
		//var tim4 = get_timer();
		//show_debug_message("scr_merge_map time: "+string(tim4-tim3));
		
		//var tim5 = get_timer();
		//overhead_update_mm1(mapWidth/5, mapHeight/5);
		//var tim6 = get_timer();
		//show_debug_message("overhead_update_mm1: " + string(tim6-tim5));
		//scr_create_map(mapWidth, mapHeight, 1);// create an image of the minimap at that instance
		global.isInventoryOpening = false;
	}
	
	#region Drawing Fullscreen Background DONE
	
	if(fullscreenSelected)
	{
		draw_set_alpha(.5);
		draw_set_color(c_black);
		draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(), 0);
		draw_set_alpha(1);
		draw_set_color(c_white);		
	}
	
	#endregion
	
	#region Local Varibales/Drawing and Highlighting buttons (Except Markers)
	
		#region Local variables
		
		//markers
		var drawMarkerReference = false;
	
		//highlight checks for buttons
		var fullscreenHighlighted = false;
		var zoominHighlighted= false;
		var zoomoutHighlighted = false;
		var minimapHighlighted = false;
	
		//marker variable checks
		var markerHighlighted = false;
		//var redHighlighted = false;
		//var greenHighlighted = false;
		//var blueHighlighted = false;
		var markerHighlightedIndex = -1;
		var campHighlighted = false;
		var campHighlightedIndex = -1;
	
		//marker library checks
		var markerLibraryHighlightedIndex = -1;
		var markerLibraryHighlighted = false;
		markerLibrarySelectedIndex = -1;
		campLibrarySelectedIndex = -1;
		
		#endregion
		
		#region JUST! Highlighting buttons
		var fullscreenOffset = 0;
		if(global.minimapFullscreen)
			fullscreenOffset = 15;
	
			#region Fullscreen button
			
				if(gx > 1878-fullscreenOffset && gx < 1878 + 22 -fullscreenOffset && gy > 20 && gy < 20 + 22)
				{
					fullscreenHighlighted = true;
					/*
					if(fullscreenSelected)
						draw_sprite(s_minimap_fullscreen, 3, 1878, 20);
					else
						draw_sprite(s_minimap_fullscreen, 1, 1878, 20);*/
				}
				/*
				else
				{
					if(fullscreenSelected)
						draw_sprite(s_minimap_fullscreen, 2, 1878, 20);
					else
						draw_sprite(s_minimap_fullscreen, 0, 1878, 20);
				}*/
			
				#endregion
			
			#region Scroll buttons
	
				// Zoom in
				if(gx > 1878-fullscreenOffset && gx < 1878 + 10-fullscreenOffset && gy > 47 && gy < 47 + 40)
				{
					zoominHighlighted = true;
					//draw_sprite(s_scroll, 1, 1878, 47);		
				}/*
				else
					draw_sprite(s_scroll, 0, 1878, 47);*/
				// Zoom out
				if(gx > 1878-fullscreenOffset && gx < 1878 + 10-fullscreenOffset && gy > 92 && gy < 92 + 40)
				{
					zoomoutHighlighted = true;
					//draw_sprite(s_scroll, 1, 1878, 92);
				}/*
				else
					draw_sprite(s_scroll, 0, 1878, 92);
				*/
				#endregion
	
			
			#region Marker Editor buttons (commented out)
			/*
				//draw minimap marker button
				if(gx > 1878 && gx < 1878 + 22 && gy > 137 && gy < 137 +22)
				{	
					markerHighlighted = true;
					
					draw_sprite(s_minimap_marker, 1, 1878, 137);
				}
				else
				{
					if(markerSelected)
						draw_sprite(s_minimap_marker, 1, 1878, 137);
					else
						draw_sprite(s_minimap_marker, 0, 1878, 137);
				}
	
				//if the marker has been selected draw the marker options below it
				if(markerSelected){
		
					//draw red
					if(gx > 1878 && gx < 1878 + 22 && gy > 164 && gy < 164 + 22){
						redHighlighted = true;
						draw_sprite(s_minimap_marker, 3, 1878, 164);
					}
					else{
						if(redSelected)
							draw_sprite(s_minimap_marker, 3, 1878, 164);
						else
							draw_sprite(s_minimap_marker, 2, 1878, 164);
					}
					//draw blue
					if(gx > 1878 && gx < 1878 + 22 && gy > 191 && gy < 191 + 22){
						blueHighlighted = true;
						draw_sprite(s_minimap_marker, 6, 1878, 191);
					}
					else{
						if(blueSelected)
							draw_sprite(s_minimap_marker, 6, 1878, 191);
						else
							draw_sprite(s_minimap_marker, 5, 1878, 191);
					}
			
					//draw green
					if(gx > 1878 && gx < 1878 + 22 && gy > 218 && gy < 218 +22){
						greenHighlighted = true;
						draw_sprite(s_minimap_marker, 9, 1878, 218);
					}
					else{
						if(greenSelected)
							draw_sprite(s_minimap_marker, 9, 1878, 218);
						else
							draw_sprite(s_minimap_marker, 8, 1878, 218);
					}
		
				}
		*/
		#endregion
			
			
			#region draw markerLibrary
				var libraryOffset = 108;
				//all of this will only ever happen if it is currently in fullscreen
				
				//fullscreen if is commented out so that we can have it during both
				//if(fullscreenSelected){
	
					//draw marker library controller button
					if(gx > 1878 -fullscreenOffset && gx < 1878 + 22 -fullscreenOffset && gy > 245-libraryOffset && gy < 245 + 22 -libraryOffset){
						markerLibraryHighlighted = true;
						/*
						if(markerLibrarySelected)
							draw_sprite(s_minimap_marker, 1, 1878, 245);
						else
							draw_sprite(s_minimap_marker, 1, 1878, 245);*/
					}
					/*
					else{
						if(markerLibrarySelected)
							draw_sprite(s_minimap_marker, 1, 1878, 245);
						else
							draw_sprite(s_minimap_marker, 0, 1878, 245);
					}*/
		
		
					if(markerLibrarySelected){//if the library is currently open
			
						//draw player reference
						if(gx > 1878 -fullscreenOffset && gx < 1878 +22 -fullscreenOffset && gy > 272-libraryOffset && gy < 272 +22-libraryOffset){
							markerLibraryHighlightedIndex = 11; //11 is player index
							//draw_sprite(s_minimap_marker, 3, 1878, 272);
						}
						/*
						else{
							draw_sprite(s_minimap_marker, 2, 1878, 272);
						}*/
			
						var posYLibrary = 299-libraryOffset;
						//draw all available markers underneath this
						for(var i =0; i <10; i++){
							if(markerX[i] != -1){//if a marker exists at that index
								if(	gx > 1878 -fullscreenOffset && gx < 1878 + 22 -fullscreenOffset && gy > posYLibrary && gy < posYLibrary + 22){
									markerHighlighted = true;
									markerLibraryHighlightedIndex = i;
									
									//(even older comment then the removal of draws!)
									//markerSelected = true;
									//electedMarkerIndex = i;
									//misc_markNameRev(i, 1878, posYLibrary);
									//draw_title(markerName[i],0, 1870, posYLibrary);
									
									//draw_sprite_ext(s_minimap_marker, markerCol[i]+1, 1878, posYLibrary,1,1,0,c_white, 1);
								}
								/*
								else{
									draw_sprite_ext(s_minimap_marker, markerCol[i], 1878, posYLibrary,1,1,0,c_white, 1);
								}*/
							posYLibrary += 27;//set posYlibrary down so the next instance is drawn below
							}
						}
						
						//draw all visible enemy camps underneath this
						for(var h = 0; h < ds_list_size(global.campIdList); h++){
							if(ds_list_find_value(global.campCol, h) != 0){//if its visible
								if(	gx > 1878 -fullscreenOffset && gx < 1878 + 22 -fullscreenOffset && gy > posYLibrary && gy < posYLibrary + 22){
									campHighlighted = true;
									campHighlightedIndex = h;
								
								}
							posYLibrary += 27;//set posYlibrary down so the next instance is drawn below
							}
						}
						
					}
		
				//}	
				#endregion
	
			#region If map is hovered 
	
				//highlight checks for buttons
				/*
		var fullscreenHighlighted = false;
		var zoominHighlighted= false;
		var zoomoutHighlighted = false;
		var minimapHighlighted = false;
	
		//marker variable checks
		var markerHighlighted = false;
		//var redHighlighted = false;
		//var greenHighlighted = false;
		//var blueHighlighted = false;
		var markerHighlightedIndex = -1;
	
		//marker library checks
		var markerLibraryHighlightedIndex = -1;
		var markerLibraryHighlighted = false;
		markerLibrarySelectedIndex = -1;*/
				if((gx > xp && gx < xp + mmWidth && gy > yp && gy < yp + mmHeight)
				&&!markerLibraryHighlighted &&markerLibraryHighlightedIndex==-1&&
				markerHighlightedIndex == -1&& !markerHighlighted&&!zoomoutHighlighted&&!zoominHighlighted
				&&!fullscreenHighlighted){
					minimapHighlighted = true;
					global.minimapHighlighted = true;
				}
				else{
					minimapHighlighted = false;
					global.minimapHighlighted = false;
				}
			#endregion
	
	#endregion
		
	#endregion
	
	#region input handlers (and variables)
	
		#region zoom in, fullscreen, markereditor and markerlibrary (mouse left events)
	
			#region scroll input
	
			//scroll wheel inputs
			if(mouse_wheel_up()&&(zoom > 1))//if scroll wheel up zoom in (min 0.2)
				zoom -= 0.3;
			if(mouse_wheel_down()&&(zoom < 14))//if scroll wheel down zoom out (max 8)
				zoom += 0.3;
	
			#endregion
			
			#region mouse (left) pressed event
			
	//check if mouse was pressed
	//if(global.M_LEFT){
	if(mouse_check_button_pressed(mb_left)){
		//find initial position to use for offset when the mouse is anywhere in the minimap range
		if(minimapHighlighted){
			xPrevious = gx;
			yPrevious = gy;
		}
		
		//if the marker library drop down button is pressed then select it
		if(markerLibraryHighlighted){
			markerLibrarySelected = !markerLibrarySelected;
		}
		
		//if the marker drop down button is pressed then select it
		
		if(markerHighlighted){
			markerSelected = !markerSelected;
			selectedMarkerIndex =  markerHighlightedIndex;
			//if no marker is selected use whatever was last used or default set in create
			//selected marker and color is whatever the current marker is if one is selected
		}
		else{
			if(campHighlighted){
				selectedCampIndex = campHighlightedIndex;
				//campSelected = true;
				markerSelected = true;
			}
			else{
				markerSelected = false;
				selectedCampIndex = -1;
			}
			
			selectedMarkerIndex = -1;
			markerLibrarySelectedIndex = -1;
			campLibrarySelectedIndex = -1;
			//markerSelected = false;
		}
		
		//set to full screen or minimize to minimap setting required variables
		if(fullscreenHighlighted)
		{
			if(fullscreenSelected == false)
			{
				mmXoffset = 0;
				mmYoffset = 0;
				//mmXoffset = fullscreen_mmXoffset;
				//mmYoffset = fullscreen_mmYoffset;
				zoom = fullscreenZoom;
				markerLibrarySelected = false;
				fullscreenSelected = true;
				//mmWidth = 1853;
				mmWidth = 1880;
				mmHeight = 1040;
				xp = 20;
				yp = 20;
				
			}
			else
			{
				mmXoffset = 0;
				mmYoffset = 0;
				markerLibrarySelected = false;
				zoom = minimizedZoom;
				fullscreenSelected = false;
				mmHeight = 480;
				mmWidth = 480;
				xp = 1394;
				//yp = 20;
				yp = 20;
			}
			mmXoldoffset = 0;
			mmYoldoffset = 0;
		}
		
		//set last updated offset
		mmXoldoffset = mmXoffset;
		mmYoldoffset = mmYoffset;
		
	}
	
	show_debug_message("centerX: "+string(centerX));
	show_debug_message("centerY: "+string(centerY));
	
	show_debug_message("mmXoffset: "+string(mmXoffset));
	show_debug_message("mmYoffset: "+string(mmYoffset));
	
	show_debug_message("mmXoldoffset: "+string(mmXoldoffset));
	show_debug_message("mmYoldoffset: "+string(mmYoldoffset));
				#endregion
	
			#region mouse (left) check event
			
	//check if mouse is currently being held down
	//if(global.M_LEFT){
	if(mouse_check_button(mb_left)){
		if(zoominHighlighted&&(zoom>1))//if zoom in pressed zoom in (min 0.2)
			zoom -= 0.05;
		if(zoomoutHighlighted&&(zoom < 14))//if zoom out pressed zoom out (max 8)
			zoom += 0.05;
		
		//if mouse is inside of minimap set offset
		if(minimapHighlighted){
			//set offset to the current offset with reference to last updated offset
			mmXoffset = gx - xPrevious + mmXoldoffset;
			mmYoffset = gy - yPrevious + mmYoldoffset;
		}
		
		//set colors and variables for creating markers
		//if red color is being pressed
		/*
		if(redHighlighted){
			markerColor = make_color_rgb(202, 116, 119);
			redSelected = true;
			blueSelected = false;
			greenSelected = false;
		}

		//if blue color is being pressed
		if(blueHighlighted){
			markerColor = make_color_rgb(104, 104, 209);
			blueSelected = true;	
			redSelected = false;
			greenSelected = false;
		}
		
		//if green color is being pressed
		if(greenHighlighted){
			markerColor = make_color_rgb(115, 155, 124);
			greenSelected = true;
			redSelected = false;
			blueSelected = false;
		}*/
		
		//check if any of the library buttons have been pressed
		if(markerLibraryHighlightedIndex != -1){//check if any button is being highlighted
			//if it has change the selected index to match
			markerLibrarySelectedIndex=markerLibraryHighlightedIndex;
		}
		else if(campHighlightedIndex != -1){
			campLibrarySelectedIndex = campHighlightedIndex;	
		}
		
	}
	
			#endregion
			
		#endregion
	
		#region variables (dependent upon above events)
	
	//wether or not markers have reached their max
	var maxMarkerWarning = false;
	
	//alpha of map sprite
	//var alphaM = 0.7; 
	var alphaM = 1;
	
	//??????????????????????? (DO NOT REMOVE THIS) ??????????????????????????
	//scale factor of the map (used to find where something is in terms of its global position in the map)
	//var yscale = mapHeight/room_height; 
	//var xscale = mapWidth/room_width;
	
	
	//if a markerlibrary is selected reset view to center on it and set it as selected
	if(markerLibrarySelectedIndex != -1){
			if(markerLibrarySelectedIndex == 11){ //if player is selected
				
				
				var xscale = mapWidth/room_width;
				var yscale = mapHeight/room_height;
				var xposp = (o_player.x+global.xoffset)*xscale;
				var yposp = (o_player.y+global.yoffset)*yscale;
				//var xposp = o_player.x*xscale;
				//var yposp = o_player.y*yscale;
				
				selectedMarkerIndex = -1;
				
				//centerX = o_player.x*(mapWidth/room_width);
				//centerY = o_player.y*(mapHeight/room_height);
				centerX = xposp;
				centerY = yposp;
				
				mmXoffset = 0;
				mmYoffset = 0;
				mmXoldoffset = 0;
				mmYoldoffset = 0;
				markerLibrarySelectedIndex = -1;
			}
			else{//else if one of the other buttons are selected
				var xscale = mapWidth/room_width;
				var yscale = mapHeight/room_height;
				var xposp = ((markerX[markerLibrarySelectedIndex]/xscale)+global.xoffset)*xscale;
				var yposp = ((markerY[markerLibrarySelectedIndex]/yscale)+global.yoffset)*yscale;
				//var xposp = ((markerX[markerLibrarySelectedIndex]/xscale))*xscale;
				//var yposp = ((markerY[markerLibrarySelectedIndex]/yscale))*yscale;
				selectedMarkerIndex = markerLibrarySelectedIndex;
				//centerX = markerX[markerLibrarySelectedIndex];
				//centerY = markerY[markerLibrarySelectedIndex];
				centerX = xposp;
				centerY = yposp;
				
				mmXoffset = 0;
				mmYoffset = 0;
				mmXoldoffset = 0;
				mmYoldoffset = 0;
				markerLibrarySelectedIndex = -1;
				campLibrarySelectedIndex = -1;
			}
	}else if(campLibrarySelectedIndex != -1){
		var xscale = mapWidth/room_width;
		var yscale = mapHeight/room_height;
		var campX = ds_list_find_value(global.campXList, campLibrarySelectedIndex);
		var campY = ds_list_find_value(global.campYList, campLibrarySelectedIndex);
		var xposp = ((campX/xscale)+global.xoffset)*xscale;
		var yposp = ((campY/yscale)+global.yoffset)*yscale;
		//var xposp = campX;
		//var yposp = campY;
		
		selectedCampIndex = campLibrarySelectedIndex;
		//centerX = markerX[markerLibrarySelectedIndex];
		//centerY = markerY[markerLibrarySelectedIndex];
		centerX = xposp;
		centerY = yposp;
				
		mmXoffset = 0;
		mmYoffset = 0;
		mmXoldoffset = 0;
		mmYoldoffset = 0;
		markerLibrarySelectedIndex = -1;
		campLibrarySelectedIndex = -1;
	}
	
	//true height of the map to be shown
	var trueHeight = (mmHeight/2)*zoom;
	var trueWidth = (mmWidth/2)*zoom;
	
	//find left and top of map sprite to draw
	//var left = (centerX-(mmXoffset*zoom/2)-(trueWidth/2))*xscale;
	//var top = (centerY-(mmYoffset*zoom/2)-(trueHeight/2))*yscale;
	var left = (centerX-(mmXoffset*zoom/2)-(trueWidth/2));
	var top = (centerY-(mmYoffset*zoom/2)-(trueHeight/2));
	
	
	//show_debug_message(mmXoffset);
	//show_debug_message(mmYoffset);
	
	//show_debug_message(left);
	//show_debug_message(top);
	
	//scale factor for the minimap (to zoom in to the size fitting of the minimap demensions)
	var mmyscale = mmHeight/trueHeight;
	var mmxscale = mmWidth/trueWidth;
	
	#endregion
	
		#region markers highlight, editing, and creation (mouse right events and type events)
	
						#region check markers for highlight
			
	//check markers for highlight
	var xscale = mapWidth/room_width;
	var yscale = mapHeight/room_height;
	for(var i =0; i < 10; i++){
		var xposp = ((markerX[i]/xscale)+global.xoffset)*xscale;
		var yposp = ((markerY[i]/yscale)+global.yoffset)*yscale;
		//var xposp = markerX[i];
		//var yposp = markerY[i];
		
		var leftxvar = (xp+(xposp-left)*mmxscale)-22;
		var topxvar = (yp+(yposp-top)*mmxscale)-22;
		if(gx > leftxvar && gx < leftxvar + 44 && gy > topxvar && gy < topxvar + 44){
			markerHighlightedIndex = i;
		}					
	}
	
	if(mouse_check_button_pressed(mb_left)){
		if(markerHighlightedIndex != -1){
			selectedMarkerIndex = markerHighlightedIndex;
			markerSelected = true;
		}
	}
			
						#endregion
			
			#region mouse right button check
			/*
	//check for right mouse button
	if(global.M_RIGHT){
		//check if its in the minimap, the marker button is selected and no marker is being highlighted
		if(minimapHighlighted&&markerSelected&&markerHighlightedIndex==-1)
			drawMarkerReference = true;
		
		
		//if their is a marker selected and it is the marker currently highlighted
		else if(markerSelected&&selectedMarkerIndex!=-1&&markerHighlightedIndex == selectedMarkerIndex){
			//move marker if you can (if it is in minimap viewport)
			if(minimapHighlighted){
				movedMarkerIndex = selectedMarkerIndex;
				markerX[selectedMarkerIndex] = -1;
				markerY[selectedMarkerIndex] = -1;
				drawMarkerReference = true;
			}
		}
		
		//if something is being moved but the mouse goes off the map just place it down where it was
		else if(movedMarkerIndex != -1&&!minimapHighlighted){
			var miniX = mx- xp;
			var miniY = my - yp; 
					
			markerX[movedMarkerIndex] = left+miniX/mmxscale;
			markerY[movedMarkerIndex] = top+miniY/mmyscale;
			movedMarkerIndex = -1;
		}
		
		
		for(var i = 0; i <10; i ++){
			if(markerX[i] = -1)
				break;
			//if it reaches the end of the list and their was no room in the array
			//and it is currently trying to place a marker down
			else if(i = 9&&markerHighlightedIndex==-1&&markerSelected){
				maxMarkerWarning = true;
			}
		}
	}
	*/
			#endregion
	
			#region mouse right release check
			
	//check if right mouse button is released
	//if(global.M_RIGHT){
		/*
		if(minimapHighlighted&&markerSelected&&markerHighlightedIndex==-1){
			//create a marker 
			
			
			//if your dragging a marker put it down
			if(movedMarkerIndex != -1){
				var miniX = mx- xp;
				var miniY = my - yp; 
				markerX[movedMarkerIndex] = left+miniX/mmxscale;
				markerY[movedMarkerIndex] = top+miniY/mmyscale;
				markerLibrarySelectedIndex=movedMarkerIndex;
				movedMarkerIndex = -1;
			}
			
			else {	
				//else create a marker and add it to the arrays
				for(var i = 0; i < 10; i++){
					if(markerX[i] == -1){ //if a marker does not exist at that point of the array
						//translate gui x and y positions too minimap positions
						var miniX = mx - xp; //gui x displacement
						var miniY = my - yp; //gui y displacement
					
						markerX[i] = left+miniX/mmxscale; //set map x position
						markerY[i] = top+miniY/mmyscale; //set map y position
						markerCol[i] = markerColor; //set color
						selectedMarkerIndex = i; //make it the selected marker
						markerLibrarySelectedIndex=i;
						break; //leave loop youve done all you need
					}
				}
			}
		}*/
	//}
				
				#endregion
	
			#region mouse right pressed check
		
	/*	
	//check for mouse 2 pressed
	if(global.M_RIGHT){
		if(minimapHighlighted){
			for(var i =0; i < 10; i++){
				if(markerX[i] != -1){//if a marker exists at that point of the array
					if(markerHighlightedIndex==i){//if marker is highlighted
						selectedMarkerIndex = i;
						break; //leave loop youve done all you need
					}
				}
				else if(i == 9){//if it went through whole array and none were highlighted
					if(movedMarkerIndex=-1)
						markerLibrarySelectedIndex = 11;
					selectedMarkerIndex = -1;
				}
			}
		}
	}
	*/
	
			#endregion
			
			#region a copy of markerlibraryselected indexing ???????????
	/*
	//if a markerlibrary is selected reset view to center on it and set it as selected
	if(markerLibrarySelectedIndex != -1){
			if(markerLibrarySelectedIndex == 11){ //if player is selected
				selectedMarkerIndex = -1;
				centerX = o_player.x*(mapWidth/room_width);
				centerY = o_player.y*(mapHeight/room_height);
				mmXoffset = 0;
				mmYoffset = 0;
				mmXoldoffset = 0;
				mmYoldoffset = 0;
			}
			else{//else if one of the other buttons are selected
				selectedMarkerIndex = markerLibrarySelectedIndex;
				centerX = markerX[markerLibrarySelectedIndex];
				centerY = markerY[markerLibrarySelectedIndex];
				mmXoffset = 0;
				mmYoffset = 0;
				mmXoldoffset = 0;
				mmYoldoffset = 0;
			}
			
			//true height of the map to be shown
			var trueHeight = (mmHeight/2)*zoom;
			var trueWidth = (mmWidth/2)*zoom;
	
			//find left and top of map sprite to draw
			//var left = (centerX-(mmXoffset*zoom/2)-(trueWidth/2))*xscale;
			//var top = (centerY-(mmYoffset*zoom/2)-(trueHeight/2))*yscale;
			var left = (centerX-(mmXoffset*zoom/2)-(trueWidth/2));
			var top = (centerY-(mmYoffset*zoom/2)-(trueHeight/2));
	
			//scale factor for the minimap (to zoom in to the size fitting of the minimap demensions)
			var mmyscale = mmHeight/trueHeight;
			var mmxscale = mmWidth/trueWidth;
	}*/
	
	#endregion

			#region enter or backspace has been pressed
			
	//check if the enter button has been pressed, their is a selected index, and marker editor is currently open
	if(keyboard_check_pressed(vk_enter)&&selectedMarkerIndex != -1&&markerSelected){
		//initialize with whatever it used to have if start editing with enter
		if(!editNameSelected) 
			keyboard_string = markerName[selectedMarkerIndex]; 
		editNameSelected = !editNameSelected; //end name editing if it is occuring
		
		//if name editor is closed and string is empty reset string to number
		if(!editNameSelected && markerName[selectedMarkerIndex] == "")
			markerName[selectedMarkerIndex] = selectedMarkerIndex+1;
			
	}
	
	//check if the backspace button has been pressed, their is a selected index, it is not already editing
	//and the marker editor is currently open
	if(keyboard_check_pressed(vk_backspace)&&!editNameSelected&&selectedMarkerIndex != -1&&markerSelected){
		keyboard_string = ""; //empty text box if start editing with backspace
		editNameSelected = true;
	}
	
			#endregion
	
			#region delete has been pressed
			
	//check if delete button has been pressed
	/*
	if(keyboard_check(vk_delete)){
		if(selectedMarkerIndex != -1){ //if delete is pressed reset color and set x and y to false
			markerName[selectedMarkerIndex] = selectedMarkerIndex+1;
			markerCol[selectedMarkerIndex] = c_black;
			markerX[selectedMarkerIndex] = -1;
			markerY[selectedMarkerIndex] = -1;
			selectedMarkerIndex = -1; //reset selected since your no longer selecting
		}
	}*/
			
			#endregion
	
			#region if text can be edited, edit it
			
	//change text if the text box is currently selected
	if(editNameSelected&&selectedMarkerIndex != -1){
		if (string_length(keyboard_string) < 17){
			markerName[selectedMarkerIndex] = keyboard_string;
		}
		else{
			keyboard_string = markerName[selectedMarkerIndex];
		}
	}
			
			#endregion
	
	#endregion
	
	#endregion
	
	#region drawing all minimap stuff (text, markers and background)
	
		if(!global.minimapFullscreen){
			var minimapBaseSurf = surface_create(display_get_gui_width(), display_get_gui_height());
			surface_set_target(minimapBaseSurf);
		}
		#region draw background and map sprite
	
		//draw background sprite for minimap
		draw_set_color($EDF9D3); //using hex code #D3F9ED
		draw_rectangle(xp,yp, xp+mmWidth, yp+mmHeight,false);
		
		
		//draw the minimap at positions (xp,yp) with alpha (alpha) being able to view demensions set by
		//true height and true width (in global room) 
		//\/\/ draws only certain section of map (minimap)
		//show_debug_message(left);
		//show_debug_message(top);
		//show_debug_message("-------------------------");
		
		
		//block_trueWidth = trueWidth/5;
		//block_trueHeight = trueHeight/5;
		//block_spriteHeight = mapHeight/5;
		//block_spriteWidth = mapWidth/5;
		//blockScalex = room_width/block_trueWidth;
		//blockScaley = room_height/block_trueHeight;
		
		
		draw_sprite_part_ext(global.mmSprite, 0, left, top, trueWidth, 
		trueHeight, xp, yp, mmxscale, mmyscale, c_white, alphaM);
		
		/*
		draw_surface_part_ext(global.surfmm, left, top, trueWidth, 
		trueHeight, xp, yp, mmxscale, mmyscale, c_white, alphaM);
		*/
		
		if(!global.isDev){
			
			draw_sprite_part_ext(global.mmOverheadSprite, 0, left/5, top/5, trueWidth/5, 
			trueHeight/5, xp, yp, mmxscale*5, mmyscale*5, c_white, 1);
			
		}
		
		//add compass marker
		if(global.minimapFullscreen)
			draw_sprite_ext(s_mapCompass, 0, xp+mmWidth-75, mmHeight-75, 2, 2, 0, c_white, 1);
		
		/*
		gpu_set_blendmode(bm_subtract); //change to delet
		draw_sprite_stretched(s_mm_circle, 0, xp, yp, mmWidth, mmHeight);		
		gpu_set_blendmode(bm_normal);
		*/
		#endregion
		
		#region add all markers and text with clipping properties
	
	//*********************************
	//set up using surface for clipping
	//*********************************
	
	//create a surface if the surface does not exist
	//if the surface is not the right size destroy it
	//used to be "mmWidth"
	
	/*
	if(surface_exists(clip_surface)&&surface_get_width(clip_surface)!=mmWidth)
		surface_free(clip_surface);
		
	if(!surface_exists(clip_surface))*/
	var clip_surface = surface_create(mmWidth, mmHeight);
	
	// clear and start drawing to surface:
	
	surface_set_target(clip_surface);
	
	draw_clear_alpha(c_black, 0);
	
	//********************************
	//draw markers (draw things here, subtracting (xp, yp) from coordinates)
	//********************************
	
	
	/*
	if(drawMarkerReference){//if currently right clicking draw reference marker
		draw_sprite_ext(s_minimap_marker, 15, mx-22-xp, my-22-yp, 2, 2, 0, markerColor, 0.7);	
	}*/
	
	for(var i = 0; i < 10; i++){
		if(markerX[i] != -1){//if a marker exists in the array at that point
			//var mkx = markerX[i];
			//var mky = markerY[i];
			var xscale = mapWidth/room_width;
			var yscale = mapHeight/room_height;
			var mkx = ((markerX[i]/xscale)+global.xoffset)*xscale;
			var mky = ((markerY[i]/yscale)+global.yoffset)*yscale;
			//var mkx = markerX[i];
			//var mky = markerY[i];
			//if marker is within the viewport of the minimap
			if(mkx > left - 11 && mkx < left + (trueWidth) + 11 && 
			mky > top - 11 && mky < top + (trueHeight) + 11){
				//convert saved map positions back to gui positions and draw the mark
				var markerguiX = (xp+(mkx-left)*mmxscale)-22;
				var markerguiY = (yp+(mky-top)*mmyscale)-22;
				//select subimage to use
				//var markerType = 15; //normal subimage to use
				var markerType = markerCol[i];
				
				//if it is highlighted or selected change subimage
				if(markerHighlightedIndex == i)
					markerType = markerType++;//change sprite type to highlighted
				if(selectedMarkerIndex == i){
					markerType = markerType++;//change sprite type to selected	
				}
				
				//actually draw it
				draw_sprite_ext(s_minimap_marker, markerType, 
				markerguiX-xp, markerguiY-yp, 
				2, 2, 0, c_white, 1);
				
			}
		}	
	}
	//do the same thing with enemy camps
	for(var h = 0; h < ds_list_size(global.campIdList); h++){
		if(ds_list_find_value(global.campCol, h) != 0){//if its visible
			
			//var mkx = markerX[i];
			//var mky = markerY[i];
			var xscale = mapWidth/room_width;
			var yscale = mapHeight/room_height;
			var campX = ds_list_find_value(global.campXList, h);
			var campY = ds_list_find_value(global.campYList, h);
			var mkx = ((campX/xscale)+global.xoffset)*xscale;
			var mky = ((campY/yscale)+global.yoffset)*yscale;
			//if marker is within the viewport of the minimap
			if(mkx > left - 11 && mkx < left + (trueWidth) + 11 && 
			mky > top - 11 && mky < top + (trueHeight) + 11){
				//show_debug_message("drawing camp icon");
				
				//convert saved map positions back to gui positions and draw the mark
				var markerguiX = (xp+(mkx-left)*mmxscale)-22;
				var markerguiY = (yp+(mky-top)*mmyscale)-22;
				//select subimage to use
				//var markerType = 15; //normal subimage to use
				
				/*
				var markerType = markerCol[i];
				
				//if it is highlighted or selected change subimage
				if(markerHighlightedIndex == i)
					markerType = markerType++;//change sprite type to highlighted
				if(selectedMarkerIndex == i){
					markerType = markerType++;//change sprite type to selected	
				}*/
				
				//actually draw it
				draw_sprite_ext(s_player_mm, 3, 
				markerguiX-xp, markerguiY-yp, 
				2, 2, 0, c_white, 1);
				
			}
		}
	}
	

	//do the same thing with misc icons
	for(var h = 0; h < ds_list_size(global.moundXList); h++){
		if(ds_list_find_value(global.moundTypeList, h) == 1){//if its visible
			show_debug_message("visible mound");
			
			//var mkx = markerX[i];
			//var mky = markerY[i];
			var xscale = mapWidth/room_width;
			var yscale = mapHeight/room_height;
			var campX = ds_list_find_value(global.moundXList, h);
			var campY = ds_list_find_value(global.moundYList, h);
			var mkx = ((campX/xscale)+global.xoffset)*xscale;
			var mky = ((campY/yscale)+global.yoffset)*yscale;
			
			
			//if marker is within the viewport of the minimap
			if(mkx > left - 11 && mkx < left + (trueWidth) + 11 && 
			mky > top - 11 && mky < top + (trueHeight) + 11){
				//show_debug_message("drawing camp icon");
				
				//convert saved map positions back to gui positions and draw the mark
				var markerguiX = (xp+(mkx-left)*mmxscale)-22;
				var markerguiY = (yp+(mky-top)*mmyscale)-22;
				//select subimage to use
				//var markerType = 15; //normal subimage to use
				
				/*
				var markerType = markerCol[i];
				
				//if it is highlighted or selected change subimage
				if(markerHighlightedIndex == i)
					markerType = markerType++;//change sprite type to highlighted
				if(selectedMarkerIndex == i){
					markerType = markerType++;//change sprite type to selected	
				}*/
				
				//actually draw it
				draw_sprite_ext(s_player_mm, 4, 
				markerguiX-xp, markerguiY-yp, 
				2, 2, 0, c_white, 1);
				
			}
		}
	}
	
	
	var xscale = mapWidth/room_width;
	var yscale = mapHeight/room_height;
	var xposp = (o_player.x+global.xoffset)*xscale;
	var yposp = (o_player.y+global.yoffset)*yscale;
	var markerguiXp = (xp+(xposp-left)*mmxscale)-16;
	var markerguiYp = (yp+(yposp-top)*mmyscale)-18;
	
	//draw player reference (super cedes map to show objvious position)
	
	//if(global.minimapFullscreen){
	//make it face the way the player is facing not the camera
	var player_angleOff = 0;
	var img_index = o_player.img_index;
	if(img_index == 0)
		player_angleOff = 180;
	else if(img_index == 1)
		player_angleOff= -90-45;
	else if(img_index == 2)
		player_angleOff = -90;
	else if(img_index == 3)
		player_angleOff = -45;
	else if(img_index == 4)
		player_angleOff = 0;
	else if(img_index == 5)
		player_angleOff = 45;
	else if(img_index == 6)
		player_angleOff = 90;
	else if(img_index == 7)
		player_angleOff = 90+45;
	draw_sprite_ext(s_player_mm, 0, markerguiXp-xp, markerguiYp-yp, 1, 1, -global.camera_angle+player_angleOff, -1, 1);
	
	/*
		draw_sprite_ext(s_player_mm, 0, 
		markerguiXp-xp, markerguiYp-yp,
		1, 1, 0, -1, 1);*/
	//}
	/*
	else{
		var player_angleOff = 0;
		var img_index = o_player.img_index;
		if(img_index == 0)
			player_angleOff = 180;
		else if(img_index == 1)
			player_angleOff= -90-45;
		else if(img_index == 2)
			player_angleOff = -90;
		else if(img_index == 3)
			player_angleOff = -45;
		else if(img_index == 4)
			player_angleOff = 0;
		else if(img_index == 5)
			player_angleOff = 45;
		else if(img_index == 6)
			player_angleOff = 90;
		else if(img_index == 7)
			player_angleOff = 90+45;
		draw_sprite_ext(s_minimap_markers, 0, markerguiXp, markerguiYp, 5, 5, -global.camera_angle+player_angleOff, -1, 1);
	}*/
	
	
	//if a warning should be displayed display the warning
	//if(maxMarkerWarning)
		//misc_title(13, mx-xp, my-yp, false);	
	
	//if a box is highlighted show its name
	if(markerHighlightedIndex!=-1&&(markerHighlightedIndex!=selectedMarkerIndex)){
		misc_markName(markerHighlightedIndex, mx-xp, my-yp);
	}
	
	
	//if something is selected
	if(selectedMarkerIndex != -1 && markerX[selectedMarkerIndex] != -1){
		//convert to gui position
		var xscale = mapWidth/room_width;
		var yscale = mapHeight/room_height;
		var mkx = ((markerX[selectedMarkerIndex]/xscale)+global.xoffset)*xscale;
		var mky = ((markerY[selectedMarkerIndex]/yscale)+global.yoffset)*yscale;
		var markerguiX = (xp+(mkx-left)*mmxscale);
		var markerguiY = (yp+(mky-top)*mmyscale)+22;
		
		//var markerguiX = (xp+((markerX[selectedMarkerIndex]+global.xoffset)-left)*mmxscale) -xp;
		//var markerguiY = (yp+((markerY[selectedMarkerIndex]+global.yoffset)-top)*mmyscale)+22 -yp;
		misc_markName(selectedMarkerIndex, markerguiX-xp, markerguiY-yp);
	}
		
	//***********************************
	// finish and draw the surface itself:
	//***********************************
	surface_reset_target();
	draw_surface(clip_surface, xp, yp);
	surface_free(clip_surface);//*TEST*
	clip_surface = -1;
			#endregion
	
		#region add all text (and others) without clipping properties
		
		//if a library element is highlighted show its name
		if(markerLibraryHighlightedIndex!=-1){
			if(markerLibraryHighlightedIndex!= 11){//if its a marker
				misc_markNameRev(markerLibraryHighlightedIndex, 
				1862, 299+(markerLibraryHighlightedIndex*27)+38);
			}
			//else its the player
			else{
				//misc_playerNameRev(0,1862, 299+38);	
				show_debug_message("fullscreenOffset: "+string(fullscreenOffset));
				show_debug_message("libraryOffset: "+string(libraryOffset));
				misc_playerNameRev(0, 1862, 272-libraryOffset+38);
			}
		}
		
		/*if(fullscreenHighlighted)
			misc_title(15, gx, gy, true);
		if(zoominHighlighted)
			misc_title(16, gx, gy, true);
		if(zoomoutHighlighted)
			misc_title(17, gx, gy, true);
		if(markerHighlighted)
			misc_title(18, gx, gy, true);
		if(markerLibraryHighlighted)
			misc_title(19, gx, gy, true);*/
			
		#endregion
		
		#region JUST! drawing buttons
		var fullscreenOffset = 0;
		if(global.minimapFullscreen)
			fullscreenOffset = 15;
	
			#region Fullscreen button
			
				if(gx > 1878 -fullscreenOffset && gx < 1878 + 22 -fullscreenOffset && gy > 20 && gy < 20 + 22)
				{
					//fullscreenHighlighted = true;
					if(fullscreenSelected)
						draw_sprite(s_minimap_fullscreen, 3, 1878-fullscreenOffset, 20);
					else
						draw_sprite(s_minimap_fullscreen, 1, 1878-fullscreenOffset, 20);
				}
				else
				{
					if(fullscreenSelected)
						draw_sprite(s_minimap_fullscreen, 2, 1878-fullscreenOffset, 20);
					else
						draw_sprite(s_minimap_fullscreen, 0, 1878-fullscreenOffset, 20);
				}
			
				#endregion
			
			#region Scroll buttons
	
				// Zoom in
				if(gx > 1878-fullscreenOffset && gx < 1878 + 10-fullscreenOffset && gy > 47 && gy < 47 + 40)
				{
					//zoominHighlighted = true;
					draw_sprite(s_scroll, 1, 1878-fullscreenOffset, 47);		
				}
				else
					draw_sprite(s_scroll, 0, 1878-fullscreenOffset, 47);
				
				// Zoom out
				if(gx > 1878-fullscreenOffset && gx < 1878 + 10-fullscreenOffset && gy > 92 && gy < 92 + 40)
				{
					//zoomoutHighlighted = true;
					draw_sprite(s_scroll, 1, 1878-fullscreenOffset, 92);
				}
				else
					draw_sprite(s_scroll, 0, 1878-fullscreenOffset, 92);
		
				#endregion
	
			
			#region Marker Editor buttons (commented out)
			/*
				//draw minimap marker button
				if(gx > 1878 && gx < 1878 + 22 && gy > 137 && gy < 137 +22)
				{	
					markerHighlighted = true;
					
					draw_sprite(s_minimap_marker, 1, 1878, 137);
				}
				else
				{
					if(markerSelected)
						draw_sprite(s_minimap_marker, 1, 1878, 137);
					else
						draw_sprite(s_minimap_marker, 0, 1878, 137);
				}
	
				//if the marker has been selected draw the marker options below it
				if(markerSelected){
		
					//draw red
					if(gx > 1878 && gx < 1878 + 22 && gy > 164 && gy < 164 + 22){
						redHighlighted = true;
						draw_sprite(s_minimap_marker, 3, 1878, 164);
					}
					else{
						if(redSelected)
							draw_sprite(s_minimap_marker, 3, 1878, 164);
						else
							draw_sprite(s_minimap_marker, 2, 1878, 164);
					}
					//draw blue
					if(gx > 1878 && gx < 1878 + 22 && gy > 191 && gy < 191 + 22){
						blueHighlighted = true;
						draw_sprite(s_minimap_marker, 6, 1878, 191);
					}
					else{
						if(blueSelected)
							draw_sprite(s_minimap_marker, 6, 1878, 191);
						else
							draw_sprite(s_minimap_marker, 5, 1878, 191);
					}
			
					//draw green
					if(gx > 1878 && gx < 1878 + 22 && gy > 218 && gy < 218 +22){
						greenHighlighted = true;
						draw_sprite(s_minimap_marker, 9, 1878, 218);
					}
					else{
						if(greenSelected)
							draw_sprite(s_minimap_marker, 9, 1878, 218);
						else
							draw_sprite(s_minimap_marker, 8, 1878, 218);
					}
		
				}
		*/
		#endregion
			
			
			#region draw markerLibrary
				var libraryOffset = 108;
			
				//all of this will only ever happen if it is currently in fullscreen
				
				//fullscreen if is commented out so that we can have it during both
				//if(fullscreenSelected){
	
					//draw marker library controller button
					if(gx > 1878-fullscreenOffset && gx < 1878 + 22-fullscreenOffset && gy > 245-libraryOffset && gy < 245 + 22-libraryOffset){
						//markerLibraryHighlighted = true;
						if(markerLibrarySelected)
							draw_sprite(s_minimap_marker, 1, 1878-fullscreenOffset, 245-libraryOffset);
						else
							draw_sprite(s_minimap_marker, 1, 1878-fullscreenOffset, 245-libraryOffset);
					}
					else{
						if(markerLibrarySelected)
							draw_sprite(s_minimap_marker, 1, 1878-fullscreenOffset, 245-libraryOffset);
						else
							draw_sprite(s_minimap_marker, 0, 1878-fullscreenOffset, 245-libraryOffset);
					}
		
		
					if(markerLibrarySelected){//if the library is currently open
			
						//draw player reference
						if(gx > 1878-fullscreenOffset && gx < 1878 +22-fullscreenOffset && gy > 272-libraryOffset && gy < 272 +22-libraryOffset){
							//markerLibraryHighlightedIndex = 11; //11 is player index
							draw_sprite(s_minimap_marker, 3, 1878-fullscreenOffset, 272-libraryOffset);
						}
						else{
							draw_sprite(s_minimap_marker, 2, 1878-fullscreenOffset, 272-libraryOffset);
						}
			
						var posYLibrary = 299-libraryOffset;
						//draw all available markers underneath this
						for(var i =0; i <10; i++){
							if(markerX[i] != -1){//if a marker exists at that index
								if(	gx > 1878-fullscreenOffset && gx < 1878 + 22 -fullscreenOffset && gy > posYLibrary && gy < posYLibrary + 22){
									//markerHighlighted = true;
									//markerLibraryHighlightedIndex = i;
									
									//markerSelected = true;
									//electedMarkerIndex = i;
									//misc_markNameRev(i, 1878, posYLibrary);
									//draw_title(markerName[i],0, 1870, posYLibrary);
									draw_sprite_ext(s_minimap_marker, markerCol[i]+1, 1878-fullscreenOffset, posYLibrary,1,1,0,c_white, 1);
								}
								else{
									draw_sprite_ext(s_minimap_marker, markerCol[i], 1878-fullscreenOffset, posYLibrary,1,1,0,c_white, 1);
								}
							posYLibrary += 27;//set posYlibrary down so the next instance is drawn below
							}
						}
						//draw all available camps
						for(var h = 0; h < ds_list_size(global.campIdList); h++){
							if(ds_list_find_value(global.campCol, h) != 0){
							if(	gx > 1878-fullscreenOffset && gx < 1878 + 22 -fullscreenOffset && gy > posYLibrary && gy < posYLibrary + 22){
								draw_sprite_ext(s_minimap_marker, 11, 1878-fullscreenOffset, posYLibrary, 1, 1, 0, c_white, 1);
							}
							else{
								draw_sprite_ext(s_minimap_marker, 10, 1878-fullscreenOffset, posYLibrary, 1, 1, 0, c_white, 1);	
							}
							posYLibrary += 27;//set posYlibrary down so the next instance is drawn below
							}
						}
					}
		
				//}	
				#endregion
	
			#region If map is hovered 
	
				//highlight checks for buttons
				/*
		var fullscreenHighlighted = false;
		var zoominHighlighted= false;
		var zoomoutHighlighted = false;
		var minimapHighlighted = false;
	
		//marker variable checks
		var markerHighlighted = false;
		//var redHighlighted = false;
		//var greenHighlighted = false;
		//var blueHighlighted = false;
		var markerHighlightedIndex = -1;
	
		//marker library checks
		var markerLibraryHighlightedIndex = -1;
		var markerLibraryHighlighted = false;
		markerLibrarySelectedIndex = -1;*/
				if((gx > xp && gx < xp + mmWidth && gy > yp && gy < yp + mmHeight)
				&&!markerLibraryHighlighted &&markerLibraryHighlightedIndex==-1&&
				markerHighlightedIndex == -1&& !markerHighlighted&&!zoomoutHighlighted&&!zoominHighlighted
				&&!fullscreenHighlighted){
					minimapHighlighted = true;
					global.minimapHighlighted = true;
				}
				else{
					minimapHighlighted = false;
					global.minimapHighlighted = false;
				}
			#endregion
	
	#endregion
		
		if(!global.minimapFullscreen){
			draw_set_color(c_black);
			gpu_set_blendmode(bm_subtract); //change to delet
			draw_rectangle(xp, yp, xp+mmWidth+1, yp+mmHeight+1, false);
			
			gpu_set_blendmode(bm_max);
			//gpu_set
			
			//draw_circle(xp+(mmWidth/2), yp+(mmHeight/2), mmWidth/2, false);
			draw_circle(xp+(mmWidth/2), yp+(mmHeight/2), 200, false);
			
			//draw_sprite_stretched(s_mm_circle, 0, xp, yp, mmWidth+1, mmHeight+1);		
			gpu_set_blendmode(bm_normal);
		
			surface_reset_target();
			
			draw_surface_ext(minimapBaseSurf, 0, 0, 1, 1, 0, c_white, 1);
			surface_free(minimapBaseSurf);
			
		}
	#endregion

#endregion

	#region global map variables

	/*
	if(minimapHighlighted)
		global.minimapHighlighted=true;
	else if(!global.M_RIGHT)
		global.minimapHighlighted = false;
	*/
	
	if(fullscreenSelected)
		global.minimapFullscreen = true;	
	else
		global.minimapFullscreen = false;
	
	#endregion
	
}

#region active minimap
if(global.minimapActive && !global.generatingEnvironment && !global.isInventoryOpen && !global.isInventoryOpening){
	/*
	mmXoffset = fullscreen_mmXoffset;
	mmYoffset = fullscreen_mmYoffset;
			
	zoom = fullscreenZoom;
	fullscreenSelected = false;
	markerLibrarySelected = false;
	fullscreenSelected = false;
	mmWidth = 1853;
	mmHeight = 1040;
	xp = 20;
	yp = 20;
	*/
	
	mmXoffset = 0;
	mmYoffset = 0;
	markerLibrarySelected = false;
	zoom = minimizedZoom;
	fullscreenSelected = false;
	mmHeight = 480;
	mmWidth = 480;
	xp = 1500;//-240
	yp = -70;//-240
	//xp = 1394;
	//yp = 70;
	
	//centering on player
	var xscale = mapWidth/room_width;
	var yscale = mapHeight/room_height;
	var xposp = (o_player.x+global.xoffset)*xscale;
	var yposp = (o_player.y+global.yoffset)*yscale;
	selectedMarkerIndex = -1;
	//centerX = o_player.x*(mapWidth/room_width);
	//centerY = o_player.y*(mapHeight/room_height);
	centerX = xposp;
	centerY = yposp;
				
	mmXoffset = 0;
	mmYoffset = 0;
	mmXoldoffset = 0;
	mmYoldoffset = 0;
	markerLibrarySelectedIndex = -1;
	
	
	//var alphaM = 0.7; 
	var alphaM = 1;
	
	//true height of the map to be shown
	var trueHeight = (mmHeight/2)*zoom;
	var trueWidth = (mmWidth/2)*zoom;
	
	//find left and top of map sprite to draw
	//var left = (centerX-(mmXoffset*zoom/2)-(trueWidth/2))*xscale;
	//var top = (centerY-(mmYoffset*zoom/2)-(trueHeight/2))*yscale;
	var left = (centerX-(mmXoffset*zoom/2)-(trueWidth/2));
	var top = (centerY-(mmYoffset*zoom/2)-(trueHeight/2));
	
	
	//show_debug_message(mmXoffset);
	//show_debug_message(mmYoffset);
	
	//show_debug_message(left);
	//show_debug_message(top);
	
	//scale factor for the minimap (to zoom in to the size fitting of the minimap demensions)
	var mmyscale = mmHeight/trueHeight;
	var mmxscale = mmWidth/trueWidth;

	//center it on player
	
	#region drawing all minimap stuff (text, markers and background)
	
	if(!global.minimapFullscreen){
			var minimapBaseSurf = surface_create(mmWidth, mmHeight);
			surface_set_target(minimapBaseSurf);
	}
		
		#region draw background and map sprite
	
		//draw background sprite for minimap
		draw_set_color($EDF9D3); //using hex code #D3F9ED
		//draw_rectangle(xp,yp, xp+mmWidth, yp+mmHeight,false);
		draw_rectangle(0,0, 0+mmWidth, 0+mmHeight,false);
		
		//draw the minimap at positions (xp,yp) with alpha (alpha) being able to view demensions set by
		//true height and true width (in global room) 
		//\/\/ draws only certain section of map (minimap)
		//show_debug_message(left);
		//show_debug_message(top);
		//show_debug_message("-------------------------");
		
		
		//block_trueWidth = trueWidth/5;
		//block_trueHeight = trueHeight/5;
		//block_spriteHeight = mapHeight/5;
		//block_spriteWidth = mapWidth/5;
		//blockScalex = room_width/block_trueWidth;
		//blockScaley = room_height/block_trueHeight;
		
		/*
		draw_sprite_part_ext(global.mmSprite, 0, left, top, trueWidth, 
		trueHeight, xp, yp, mmxscale, mmyscale, c_white, alphaM);
		*/
		
		
		draw_sprite_part_ext(global.mmSprite, 0, left, top, trueWidth, 
		trueHeight, 0, 0, mmxscale, mmyscale, c_white, alphaM);
	
		/*
		draw_sprite_part_ext(global.mmSprite, 0, left, top, trueWidth, 
		trueHeight, 0, 0, mmxscale, mmyscale, c_white, 1);*/
		if(!global.isDev){
			/*
			draw_sprite_part_ext(global.mmOverheadSprite, 0, left/5, top/5, trueWidth/5, 
			trueHeight/5, xp, yp, mmxscale*5, mmyscale*5, c_white, 1);
			*/
			draw_sprite_part_ext(global.mmOverheadSprite, 0, left/5, top/5, trueWidth/5, 
			trueHeight/5, 0, 0, mmxscale*5, mmyscale*5, c_white, 1);
		}
		
		//gpu_set_blendmode(bm_subtract); //change to delet
		
		//draw_sprite_ext(s_mm_circle1, 0, xp, yp, 6, 6, 0, c_white, 1);
		//draw_sprite_stretched(s_mm_circle, 0, xp, yp, trueWidth, trueHeight);
		//draw_sprite_ext(s_mm_circle1, 0, xp+mmWidth-75, yp+75, 2, 2, 0, c_white, 1);
		
		//gpu_set_blendmode(bm_normal);
		
		//add compass marker
		
		//draw_sprite_ext(s_mapCompass, 0, xp+mmWidth-75, yp+75, 2, 2, 0, c_white, 1);
		
		
		#endregion
		
		#region add all markers and text with clipping properties
	
	//*********************************
	//set up using surface for clipping
	//*********************************
	
	//create a surface if the surface does not exist
	//if the surface is not the right size destroy it
	//used to be "mmWidth"
	
	/*
	if(surface_exists(clip_surface)&&surface_get_width(clip_surface)!=mmWidth)
		surface_free(clip_surface);
		
	if(!surface_exists(clip_surface))*/
	var clip_surface = surface_create(mmWidth, mmHeight);
	
	// clear and start drawing to surface:
	
	surface_set_target(clip_surface);
	
	draw_clear_alpha(c_black, 0);
	
	//********************************
	//draw markers (draw things here, subtracting (xp, yp) from coordinates)
	//********************************
	
	
	/*
	if(drawMarkerReference){//if currently right clicking draw reference marker
		draw_sprite_ext(s_minimap_marker, 15, mx-22-xp, my-22-yp, 2, 2, 0, markerColor, 0.7);	
	}*/
	
	
	var xscale = mapWidth/room_width;
	var yscale = mapHeight/room_height;
	var xposp = (o_player.x+global.xoffset)*xscale;
	var yposp = (o_player.y+global.yoffset)*yscale;
	//var markerguiXp = (xp+(xposp-left)*mmxscale)-16;
	//var markerguiYp = (yp+(yposp-top)*mmyscale)-18;
	var markerguiXp = ((xposp-left)*mmxscale)-16;
	var markerguiYp = ((yposp-top)*mmyscale)-18;
	
	//draw player reference (super cedes map to show objvious position)
	/*
	draw_sprite_ext(s_player_mm, 0, 
	markerguiXp, markerguiYp,
	1, 1, 0, -1, 1);*/ 
	
	//make it face the way the player is facing not the camera
	var player_angleOff = 0;
	var img_index = o_player.img_index;
	if(img_index == 0)
		player_angleOff = 180;
	else if(img_index == 1)
		player_angleOff= -90-45;
	else if(img_index == 2)
		player_angleOff = -90;
	else if(img_index == 3)
		player_angleOff = -45;
	else if(img_index == 4)
		player_angleOff = 0;
	else if(img_index == 5)
		player_angleOff = 45;
	else if(img_index == 6)
		player_angleOff = 90;
	else if(img_index == 7)
		player_angleOff = 90+45;
	draw_sprite_ext(s_player_mm, 0, markerguiXp, markerguiYp, 1, 1, -global.camera_angle+player_angleOff, -1, 1);
	
	for(var i = 0; i < 10; i++){
		if(markerX[i] != -1){//if a marker exists in the array at that point
			//var mkx = markerX[i];
			//var mky = markerY[i];
			var xscale = mapWidth/room_width;
			var yscale = mapHeight/room_height;
			var mkx = ((markerX[i]/xscale)+global.xoffset)*xscale;
			var mky = ((markerY[i]/yscale)+global.yoffset)*yscale;
			//if marker is within the viewport of the minimap
			/*
			if(mkx > left - 11 && mkx < left + (trueWidth) + 11 && 
			mky > top - 11 && mky < top + (trueHeight) + 11){*/
				
				
				//convert saved map positions back to gui positions and draw the mark
				//var markerguiX = (xp+(mkx-left)*mmxscale)-22;
				//var markerguiY = (yp+(mky-top)*mmyscale)-22;
				var markerguiX= ((mkx-left)*mmxscale)-22;
				var markerguiY = ((mky-top)*mmyscale)-22;
				
				//select subimage to use
				//var markerType = 15; //normal subimage to use
				var markerType = markerCol[i];
				
				//check if its outside the circle
				if(point_distance(markerguiX, markerguiY, markerguiXp, markerguiYp)>=100){
					//find angle to the position
					show_debug_message("draw on outskirts");
					var pAng = point_direction(markerguiXp, markerguiYp, markerguiX, markerguiY);
					draw_sprite_ext(s_minimap_marker, markerType, markerguiXp+lengthdir_x(100, pAng), 
					markerguiYp+lengthdir_y(100, pAng), 1, 1, 0, c_white, 1);
				}
				else{
					draw_sprite_ext(s_minimap_marker, markerType, 
					markerguiX, markerguiY, 1, 1, 0, c_white, 1);	
				}
				
				//actually draw it
				/*
				draw_sprite_ext(s_minimap_marker, markerType, 
				markerguiX-xp, markerguiY-yp, 
				2, 2, 0, markerCol[i], 1);
				*/
				/*
				draw_sprite_ext(s_minimap_marker, markerType, 
				markerguiX, markerguiY, 
				2, 2, 0, markerCol[i], 1);*/
			
			
			//}
		}
	}
	//if a warning should be displayed display the warning
	//if(maxMarkerWarning)
		//misc_title(13, mx-xp, my-yp, false);	
	
	/*
	//if a box is highlighted show its name
	if(markerHighlightedIndex!=-1&&(markerHighlightedIndex!=selectedMarkerIndex)){
		misc_markName(markerHighlightedIndex, mx-xp, my-yp);
	}*/
	
	/*
	//if something is selected
	if(selectedMarkerIndex != -1 && markerX[selectedMarkerIndex] != -1){
		//convert to gui position
		var xscale = mapWidth/room_width;
		var yscale = mapHeight/room_height;
		var mkx = ((markerX[selectedMarkerIndex]/xscale)+global.xoffset)*xscale;
		var mky = ((markerY[selectedMarkerIndex]/yscale)+global.yoffset)*yscale;
		var markerguiX = (xp+(mkx-left)*mmxscale);
		var markerguiY = (yp+(mky-top)*mmyscale)+22;
		
		//var markerguiX = (xp+((markerX[selectedMarkerIndex]+global.xoffset)-left)*mmxscale) -xp;
		//var markerguiY = (yp+((markerY[selectedMarkerIndex]+global.yoffset)-top)*mmyscale)+22 -yp;
		misc_markName(selectedMarkerIndex, markerguiX-xp, markerguiY-yp);
	}*/
		
	//***********************************
	// finish and draw the surface itself:
	//***********************************
	surface_reset_target();
	draw_surface(clip_surface, 0, 0);
	//draw_surface(clip_surface, xp, yp);
	surface_free(clip_surface);//*TEST*
	clip_surface = -1;
			#endregion
	
		#region add all text (and others) without clipping properties
		
		/*
		//if a library element is highlighted show its name
		if(markerLibraryHighlightedIndex!=-1){
			if(markerLibraryHighlightedIndex!= 11){//if its a marker
				misc_markNameRev(markerLibraryHighlightedIndex, 
				1862, 299+(markerLibraryHighlightedIndex*27)+38);
			}
			//else its the player
			else{
				misc_playerNameRev(0,1862, 299+38-27);	
			}
		}*/
		
		/*if(fullscreenHighlighted)
			misc_title(15, gx, gy, true);
		if(zoominHighlighted)
			misc_title(16, gx, gy, true);
		if(zoomoutHighlighted)
			misc_title(17, gx, gy, true);
		if(markerHighlighted)
			misc_title(18, gx, gy, true);
		if(markerLibraryHighlighted)
			misc_title(19, gx, gy, true);*/
			
		#endregion
		
	if(!global.minimapFullscreen){
			draw_set_color(c_black);
			gpu_set_blendmode(bm_subtract); //change to delet
			//draw_rectangle(xp, yp, xp+mmWidth+1, yp+mmHeight+1, false);
			draw_rectangle(0, 0, mmWidth, mmHeight, false);
			
			gpu_set_blendmode(bm_max);
			//gpu_set
			//draw_circle(mmWidth/2, mmHeight/2, 150, false);
			draw_circle(xp+mmWidth/2, yp+mmHeight/2, 200, false);
			
			//draw_circle(xp+(mmWidth/2), yp+(mmHeight/2), mmWidth/2, false);
			
			//draw_sprite_stretched(s_mm_circle, 0, xp, yp, mmWidth+1, mmHeight+1);		
			gpu_set_blendmode(bm_normal);
		
			surface_reset_target();
			
			//draw_surface_ext(minimapBaseSurf, 0, 0, 1, 1, 0, c_white, 1);
			draw_surface_ext(minimapBaseSurf, xp, yp, 1, 1, 0, c_white, 1);
			surface_free(minimapBaseSurf);
	}
	
	#endregion

}
#endregion

#region Pause Menu

var wx = device_mouse_x_to_gui(0);
var wy = device_mouse_y_to_gui(0);

var dX = display_get_gui_width();
var dY = display_get_gui_height();
	
if(confirm) {
	draw_sprite(global.pausedBackground,0,0,0);
	draw_set_color($333128);
	draw_set_alpha(.75);
	draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(), 0);
	draw_set_alpha(1);
	
	draw_set_font(f_menu);
	draw_set_halign(fa_center); 
	draw_set_valign(fa_middle);
	
	if(isGameover) {
		draw_set_color(c_white);
		if(!isWon)
			draw_menu_button(dX/2, dY/2-36, "You have died after " + string(global.days) + " days", false, true);
		else
			draw_menu_button(dX/2, dY/2-36, "Congratulations! You made it to the compound after " + string(global.days) + " days", false, true);
		
		// New Game +
		//draw_set_color($333128);
		//draw_set_alpha(.1);
		//draw_rectangle(dX/2 - string_width("New Game +")/2 - 5, dY/2 - 15, dX/2 + string_width("New Game +")/2 + 5, dY/2 + 15, false);
		//draw_set_alpha(1);
		draw_menu_button(dX/2, dY/2, "New Game +", false, !ngPlusHighlighted)
		
		// Menu
		//draw_set_color($333128);
		//draw_set_alpha(.1);
		//draw_rectangle(dX/2 - string_width("Menu")/2 - 5, dY/2+36 - 15, dX/2 + string_width("Menu")/2 + 5, dY/2+36 + 15, false);
		//draw_set_alpha(1);
		draw_menu_button(dX/2, dY/2+36, "Menu", false, !menuHighlighted)
	
		// Desktop
		//draw_set_color($333128);
		//draw_set_alpha(.1);
		//draw_rectangle(dX/2 - string_width("Desktop")/2 - 5, dY/2+(36*2) - 15, dX/2 + string_width("Desktop")/2 + 5, dY/2+(36*2) + 15, false);
		//draw_set_alpha(1);
		draw_menu_button(dX/2, dY/2+(36*2), "Desktop", false, !desktopHighlighted);
		
		var textH = string_height("NO");
		var yMax = (dY/2) + (textH/4) + 1;
		var yMin = (dY/2) - (textH/4);
		
		// New Game +
		if(!ngPlusHighlighted && wx > dX/2 - string_width("New Game +")/2 - 5 && wx < dX/2 + string_width("New Game +")/2 + 5 && wy > yMin && wy < yMax) {
			audio_play_sound(sn_menu_highlight,1,false);
			ngPlusHighlighted = true;
		}
		else if(!(wx > dX/2 - string_width("New Game +")/2 - 5 && wx < dX/2 + string_width("New Game +")/2 + 5 && wy > yMin && wy < yMax))
			ngPlusHighlighted = false;
			
		// MENU
		if(!menuHighlighted && wx > dX/2 - string_width("Menu")/2 - 5 && wx < dX/2 + string_width("Menu")/2 + 5 && wy > yMin+36 && wy < yMax+36) {
			audio_play_sound(sn_menu_highlight,1,false);
			menuHighlighted = true;
		}
		else if(!(wx > dX/2 - string_width("Menu")/2 - 5 && wx < dX/2 + string_width("Menu")/2 + 5 && wy > yMin+36 && wy < yMax+36))
			menuHighlighted = false;
		
		// DESKTOP
		if(!desktopHighlighted && wx > dX/2 - string_width("Desktop")/2 - 5 && wx < dX/2 + string_width("Desktop")/2 + 5 && wy > yMin+(36*2) && wy < yMax+(36*2)) {
			audio_play_sound(sn_menu_highlight,1,false);
			desktopHighlighted = true;
		}
		else if(!(wx > dX/2 - string_width("Desktop")/2 - 5 && wx < dX/2 + string_width("Desktop")/2 + 5 && wy > yMin+(36*2) && wy < yMax+(36*2)))
			desktopHighlighted = false;
			
		if(mouse_check_button_pressed(global.M_LEFT)) {
			if(desktopHighlighted) {
				savingWorld = true;
				instance_activate_all();
				goToMenu = false;
			} else if(menuHighlighted) {
				savingWorld = true;
				instance_activate_all();
				goToMenu = true;
			} else if(ngPlusHighlighted) {
				newGamePlus = true;
				instance_activate_all();
				// Add functionality for newgame plus here
			}
		}	
	} else {
	
		// Message
		if(exitMessage)
			draw_menu_button(dX/2, dY/2-36, "How do you want to exit?", false, true);
	
		// Menu
		draw_menu_button(dX/2, dY/2, "Menu", false, !menuHighlighted)
	
		// Desktop
		draw_menu_button(dX/2, dY/2+36, "Desktop", false, !desktopHighlighted);
	
		// Back button
		var backW = string_width("Back");
	
		draw_menu_button(dX/2, dY/2+(36*2), "Back", false, !backHighlighted);
	
		var textH = string_height("NO");
		var yMax = (dY/2) + (textH/4) + 1;
		var yMin = (dY/2) - (textH/4);
	
		if(!backHighlighted && gx > dX/2 - string_width("Back")/2 && gx < dX/2 + string_width("Back")/2 && gy > yMin+(36*2) && gy < yMax+(36*2)) {
			audio_play_sound(sn_menu_highlight,1,false);
			backHighlighted = true;
		} else if(!(gx > dX/2 - string_width("Back")/2 && gx < dX/2 + string_width("Back")/2 && gy > yMin+(36*2) && gy < yMax+(36*2)))
			backHighlighted = false;
	
		draw_set_font(f_menu);
		draw_set_halign(fa_center); 
		draw_set_valign(fa_middle);
	
		// MENU
		if(!menuHighlighted && wx > dX/2 - string_width("Menu")/2 - 5 && wx < dX/2 + string_width("Menu")/2 + 5 && wy > yMin && wy < yMax) {
			audio_play_sound(sn_menu_highlight,1,false);
			menuHighlighted = true;
		}
		else if(!(wx > dX/2 - string_width("Menu")/2 - 5 && wx < dX/2 + string_width("Menu")/2 + 5 && wy > yMin && wy < yMax))
			menuHighlighted = false;
		
		// DESKTOP
		if(!desktopHighlighted && wx > dX/2 - string_width("Desktop")/2 - 5 && wx < dX/2 + string_width("Desktop")/2 + 5 && wy > yMin+36 && wy < yMax+36) {
			audio_play_sound(sn_menu_highlight,1,false);
			desktopHighlighted = true;
		}
		else if(!(wx > dX/2 - string_width("Desktop")/2 - 5 && wx < dX/2 + string_width("Desktop")/2 + 5 && wy > yMin+36 && wy < yMax+36))
			desktopHighlighted = false;
	
		if(mouse_check_button_pressed(global.M_LEFT)) {
			if(desktopHighlighted) {
				savingWorld = true;
				instance_activate_all();
				goToMenu = false;
			} else if(menuHighlighted) {
				savingWorld = true;
				instance_activate_all();
				goToMenu = true;
			} else if(backHighlighted) {
				exitMessage = true;
				confirm = false;
				exitHighlighted = false;
			} else if(ngPlusHighlighted) {
				newGamePlus = true;
				instance_activate_all();
				// Add functionality for newgame plus here
			}
		}	
	}
	
} else {
	draw_set_font(f_menu);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
		
	if(global.isPaused) {

		draw_sprite(global.pausedBackground,0,0,0);
		draw_set_color($333128);
		draw_set_alpha(.75);
		draw_rectangle(0,0,display_get_gui_width(), display_get_gui_height(), 0);
		draw_set_alpha(1);
	
		draw_set_font(f_menu);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_alpha(1);
	
		var textH = string_height("Resume");
		var yMax = (dY/2) + (textH/4) + 1;
		var yMin = (dY/2) - (textH/4);
	
		if(!global.options) {
			// Resume
			draw_menu_button(250, dY/2-36, "Resume", false, !resumeHighlighted);
			
			// Options
			draw_menu_button(250, dY/2, "Options", false, !optionsHighlighted);
	
			// Exit
			draw_menu_button(250, dY/2+36, "Exit", false, !exitHighlighted);
	
			// Highlighting
			var textH = string_height("Resume");
			var resumeW = string_width("Resume");	
			var optionsW = string_width("Options");
			var exitW = string_width("Exit");

			// Resume
			if(!resumeHighlighted && gx > 250 && gx < 247 + resumeW && gy > yMin-36 && gy < yMax-36) {
				audio_play_sound(sn_menu_highlight,1,false);
				resumeHighlighted = true;
			}
			else if(!(gx > 250 && gx < 247 + resumeW && gy > yMin-36 && gy < yMax-36))
				resumeHighlighted = false;
				
			// Options
			if(!optionsHighlighted && gx > 250 && gx < 247 + optionsW && gy > yMin && gy < yMax)
			{
				audio_play_sound(sn_menu_highlight,1,false);
				optionsHighlighted = true;
			}
			else if(!(gx > 250 && gx < 247 + optionsW && gy > yMin && gy < yMax))
				optionsHighlighted = false;
		
			// Exit
			if(!exitHighlighted && gx > 250 && gx < 247 + exitW && gy > yMin+36 && gy < yMax+36) {
				audio_play_sound(sn_menu_highlight,1,false);
				exitHighlighted = true;
			}
			else if(!(gx > 250 && gx < 247 + exitW && gy > yMin+36 && gy < yMax+36))
				exitHighlighted = false;
		
		} else if(global.options) {
		
			// Settings button
			draw_menu_button(250, dY/2-36, "Settings", false, !settingsHighlighted);
	
			// Controls button
			draw_menu_button(250, dY/2, "Controls", false, !controlsHighlighted);
		
			// Back button
			draw_menu_button(250, dY/2+36, "Back", false, !backHighlighted);
			
			// Back
			var backW = string_width("Back");

			if(!backHighlighted && gx > 250 && gx < 247 + backW && gy > yMin+36 && gy < yMax+36) {
				audio_play_sound(sn_menu_highlight,1,false);
				backHighlighted = true;
			}
			else if(!(gx > 250 && gx < 247 + backW && gy > yMin+36 && gy < yMax+36))
				backHighlighted = false;
			
			var settingsW = string_width("Settings");
			var controlsW = string_width("Controls");
	
			// Settings
			if(!settingsHighlighted && gx > 250 && gx < 247 + settingsW && gy > yMin-36 && gy < yMax-36) {
				audio_play_sound(sn_menu_highlight,1,false);
				settingsHighlighted = true;
			}
			else if(!(gx > 250 && gx < 247 + settingsW && gy > yMin-36 && gy < yMax-36))
				settingsHighlighted = false;
		
			// Controls
			if(!controlsHighlighted && gx > 250 && gx < 247 + controlsW && gy > yMin && gy < yMax) {
				audio_play_sound(sn_menu_highlight,1,false);
				controlsHighlighted = true;
			}
			else if(!(gx > 250 && gx < 247 + controlsW && gy > yMin && gy < yMax))
				controlsHighlighted = false;
	
			var controlsW = string_width("Controls");
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
	
			if(settings) {
				
				// Fullscreen button
				draw_menu_button(250+controlsW+30, dY/2-(36*2), "WINDOW", true, !windowHighlighted);
				
				draw_set_color(c_white);
				if(window_get_fullscreen())
					draw_text(250+controlsW+50+string_width("WINDOW"), dY/2-(36*2), "fullscreen");
				else
					draw_text(250+controlsW+50+string_width("WINDOW"), dY/2-(36*2), "windowed");
		
				// Fullscreen button
				draw_menu_button(250+controlsW+30, dY/2-(36*1), "RESOLUTION", true, !resolutionHighlighted);
				
				draw_set_color(c_white);
				draw_text(250+controlsW+50+string_width("RESOLUTION"), dY/2-(36*1), string(currentResolution) + "x" + string(round((currentResolution/16)*9)));
		
				// FX button
				draw_menu_button(250+controlsW+30, dY/2+(36*0), "FX VOLUME", true, !fxHighlighted);
		
				//draw_set_color($333128);
				draw_set_color(c_white);
				for(var i = 0; i < global.SN_FX*5; i++) {
					draw_rectangle(250+controlsW+string_width("FX VOLUME")+50+(i*10), dY/2-(14*1), 250+controlsW+string_width("FX VOLUME")+50+(i*10)+5, dY/2+13, false);
				}
		
				// Music button
				draw_menu_button(250+controlsW+30, dY/2+(36*1), "MUSIC VOLUME", true, !musicHighlighted);
		
				//draw_set_color($333128);
				draw_set_color(c_white);
				for(var i = 0; i < SN_MUSIC*5; i++) {
					draw_rectangle(250+controlsW+string_width("MUSIC VOLUME")+50+(i*10), dY/2+(22*1), 250+controlsW+string_width("MUSIC VOLUME")+50+(i*10)+5, dY/2+(25*2), false);
				}
				
				// Censoring button
				draw_menu_button(250+controlsW+30, dY/2+(36*2), "CENSORING", true, !censorHighlighted);
				
				draw_set_color(c_white);
				if(global.censoring)
					draw_text(250+controlsW+50+string_width("CENSORING"), dY/2+(36*2), "on");
				else if(!global.censoring)
					draw_text(250+controlsW+50+string_width("CENSORING"), dY/2+(36*2), "off");
					
				// Interactable hints button
				draw_menu_button(250+controlsW+30, dY/2+(36*3), "INTERACTABLE HINTS", true, !hintsHighlighted);
				
				draw_set_color(c_white);
				if(global.hints)
					draw_text(250+controlsW+50+string_width("INTERACTABLE HINTS"), dY/2+(36*3), "on");
				else if(!global.hints)
					draw_text(250+controlsW+50+string_width("INTERACTABLE HINTS"), dY/2+(36*3), "off");
				
				
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
			else if(controls) {
		
				// Interact button
				draw_menu_button(250+controlsW+30, dY/2-(36*5), "PRIMARY", true, !primaryHighlighted);
		
				draw_set_color(c_white);
				draw_text(250+controlsW+50+string_width("PRIMARY"), dY/2-(36*5), "Left Mouse");
		
				// Rotate Camera button
				draw_menu_button(250+controlsW+30, dY/2-(36*4), "SECONDARY", true, !secondaryHighlighted);
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
				draw_text(250+controlsW+50+string_width("MAP"), dY/2+(36*3), mapName);
		
				// Pause button
				draw_menu_button(250+controlsW+30, dY/2+(36*4), "PAUSE", true, !pauseHighlighted);
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
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
		
				draw_set_color(c_white);
				draw_text(250+controlsW+50+string_width("BUILD ROTATE RIGHT"), dY/2+(36*7), rotateRightName);
		
		
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
			
				// DODGE
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
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_alpha(1);
	
		// Clicking
		if(mouse_check_button_pressed(mb_left)) {
			if(resumeHighlighted && !global.options) {
			
				audio_play_sound(sn_menu_transition,1,false);
				activate_essential();
				instance_activate_region(o_camera.x-200, o_camera.y-200, 500, 500, true);
				global.canMove = true;
			
				global.isPaused = false;
				sprite_delete(global.pausedBackground);
			
			} else if(optionsHighlighted && !global.options) {
			
				audio_play_sound(sn_menu_transition,1,false);
				global.options = true;
			
			} else if(exitHighlighted && !global.options) {
				audio_play_sound(sn_menu_transition,1,false);	
				confirm = true;
			} else if(backHighlighted) {
				global.options = false;
				save_settingsHub();
				audio_play_sound(sn_menu_transition,1,false);	
				settings = false;
				controls = false;
			
			} else if(settingsHighlighted) {
				settings = !settings;
				controls = false;
			} else if(controlsHighlighted) {
				controls = !controls;
				settings = false;
			}
			
			// Options Menu
			if(global.options) {	
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
						for(var i = 0; i < array_length(resolution); i++) {
					
							if(resolution[i] == currentResolution && i != 0) {
								currentResolution = resolution[i-1];
								break;
							} else if(resolution[i] == currentResolution && i == 0)
								currentResolution = resolution[array_length(resolution)-1];
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
						global.censoring = !global.censoring
						
					if(hintsHighlighted)
						global.hints = !global.hints;
				}
		
				// CONTROLS
				if(controls && controlSelected == -1) {
					if(walkHighlighted)
						controlSelected = 0;
					if(runHighlighted)
						controlSelected = 4;
					if(sitHighlighted)
						controlSelected = 5;
					if(dodgeHighlighted)
						controlSelected = 6;
					if(reloadHighlighted)
						controlSelected = 7;
					if(inventoryHighlighted)
						controlSelected = 8;
					if(mapHighlighted)
						controlSelected = 9;
					if(centerHighlighted)
						controlSelected = 10;
					if(rotateLeftHighlighted)
						controlSelected = 11;
					if(rotateRightHighlighted)
						controlSelected = 12;
						
				}
				
			}
		}

	} else if(!global.isPaused) {
		resumeHighlighted = false;
		optionsHighlighted = false;
		exitHighlighted = false;
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

// Updating resolution
if(global.display_width != currentResolution && currentResolution <= display_get_width()) {
	global.display_width = currentResolution;
	global.display_height = (currentResolution/16)*9;
	window_set_size(global.display_width, global.display_height);
}

if(!window_get_fullscreen()) {
	window_center();
	window_set_size(global.display_width, global.display_height);
}

#endregion

#region Drawing Cursor

if(global.draw_cursor){
	cursor_sprite = s_mouse_cursor;

	if(cursor_sprite == s_mouse_cursor)
		draw_sprite(s_mouse_cursor_out,0,mx,my);
	
} else
	cursor_sprite = -1;

mx += (device_mouse_x_to_gui(0)-mx)*1; 
my += (device_mouse_y_to_gui(0)-my)*1;

if(inventoryclosing){
	display_mouse_set(display_get_width()/2, display_get_height()/4);
	inventoryclosing = false;
}

//if(global.draw_cursor){
	//if((!global.slotHighlighted || global.isPaused || global.grabbed) && global.interactingObject == -1)
		//global.interactingLoad = -1;

	// Drawing load bar
	if(global.interactingLoad > 0) {
		draw_set_color(c_white);
		draw_rectangle(gx-18, gy-15, gx-16+34, gy-12, 0);
		draw_set_color($333128);
		draw_rectangle(gx-18, gy-15, gx-16+(global.interactingLoad*2), gy-12, 0);
	}

	// Drawing ending/beginning bar 
	if(global.interactingLoad > 0) {
		draw_rectangle(gx-18+34, gy-18, gx-16+34, gy-12, 0);
		draw_rectangle(gx-18, gy-18, gx-16, gy-12, 0);
	}
	
	// Decreasing load bar
//	if((global.interactingLoad > 0 && !mouse_check_button(global.M_LEFT)) || (global.interactingObject != -1 && !position_meeting(mouse_x, mouse_y, global.interactingObject) && global.interactingLoad > 0))
		//global.interactingLoad-=.5;

//}
#endregion

//auto saving check
if(saveAlarm){
	instance_activate_all();	
	goToMenu = false;
	autoSave = true;
	savingWorld = true;
}

if(global.generatingEnvironment) {
	draw_sprite(s_loading, global.loadingIndex, x_to_gui(o_player.x,o_player.y-28), y_to_gui(o_player.x,o_player.y-28));
	
	if(global.loadingIndex < 16)
		global.loadingIndex+=.5;
	else
		global.loadingIndex = 0;
	
	// Tips
	if(global.hour > 8 && global.hour < 19)
		draw_sprite(s_tip, 0, 1920-30, 1050);
	else
		draw_sprite(s_tip, 1, 1920-30, 1050);
	
	draw_set_font(f_hud);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	draw_text(1920-30-16, 1050, tips[tipNumber]);
	
}
	
#region Drawing HUD/INFO
if(!global.generatingEnvironment && !o_player.isDead) {
	draw_set_font(f_hud);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	if(global.hour > 8 && global.hour < 19)
		draw_set_color($333128);
	else
		draw_set_color(c_white);
		
	
	
	// Compass
//	draw_sprite_part_ext(s_compass, 0, 0+global.camera_angle, 0, 95, 15, 1920/2-(45*2), 2, 2, 2, draw_get_color(), image_alpha);
	
	//surface to deal with clipping on markers
	//if(!surface_exists(compasSurf))
		//compasSurf = surface_create(95*2, 100);
	
	// clear and start drawing to surface:
	//surface_set_target(compasSurf);
	
	//draw_clear_alpha(c_black, 0);
	//find all markers and draw reference pictures of them in the correct position
	/*for(var markeri = 0; markeri < 10; markeri++){
		if(markerX[markeri] != -1){//if a marker exists in the array at that point
			//var mkx = markerX[i];
			//var mky = markerY[i];
			var xscale1 = o_hud.mapWidth/room_width;
			var yscale1 = o_hud.mapHeight/room_height;
			var mkx1 = (markerX[markeri]/xscale1);//unscale it
			var mky1 = (markerY[markeri]/yscale1);

			var markerDir = point_direction(o_player.x, o_player.y, mkx1, mky1)+global.camera_angle;
			if(markerDir > 360)
				markerDir = markerDir-360;
			else if(markerDir < 0)
				markerDir = 360+markerDir;
	
			//********************************
			//draw marker stuff
			//********************************
			draw_sprite_ext(s_compassMarker, 0, (95)-((markerDir-90)*2), 11, 2, 2, 0, markerCol[markeri], 0.9);
			//draw_sprite_ext(s_compassMarker, 0, (1920/2)-(45*2), 2, 2, 2, 0, markerCol[markeri], 0.5);
		}	
	}

	//***********************************
	// finish and draw the surface itself:
	//***********************************
	surface_reset_target();
	draw_surface(compasSurf, (1920/2)-(45*2), 2);
	surface_free(compasSurf);//*TEST*
	clip_surface = -1;
			
	//marker
	draw_text(1920/2-90, 15, "|");
	draw_text(1920/2+100, 15, "|");*/
	
	// Health
	for (var i = 0; i < 21; i++) {
		var offX = 30;
		var offY = 30;
		var xx = offX+i*12;
		var yy = offY;
				
		if(o_player.health_ <= 0 && i == 0) {
			if(typer) {
				draw_sprite_ext(s_stats, 0,xx,yy, 3, 3, 0, image_blend, image_alpha);
			} else {
				draw_sprite_ext(s_stats, 2,xx,yy, 3, 3, 0, image_blend, image_alpha);
			}
		} else if(o_player.health_ > 0 && i < 20) {	
			if(i < o_player.health_/5)
				draw_sprite_ext(s_stats, 2,xx,yy, 3, 3, 0, image_blend, image_alpha);
		}
	
		if(i == 20 && global.hour > 6 && global.hour < 22) {
			draw_sprite_ext(s_stats, 5,xx,yy, 3, 3, 0, image_blend, image_alpha);
		} else if(i == 20) {
			draw_sprite_ext(s_stats, 6,xx,yy, 3, 3, 0, image_blend, image_alpha);
		}
		
		if(check_inventory(item.bandage, 1, -1) && i == 20) {
			draw_sprite_ext(s_items, item.bandage,xx+20,yy+4, 2, 2, 0, image_blend, image_alpha);
			if(check_inventory(item.splint, 1, -1) && i == 20)
				draw_sprite_ext(s_items, item.splint,xx+40,yy+4, 2, 2, 0, image_blend, image_alpha);
		} else if(check_inventory(item.splint, 1, -1) && i == 20)
			draw_sprite_ext(s_items, item.splint,xx+20,yy+4, 2, 2, 0, image_blend, image_alpha);
		
	}

	// Hunger
	for (var i = 0; i < 21; i++) {
		var offX = 30;
		var offY = 45;
		var xx = offX+i*12;
		var yy = offY;
	
		if(o_player.hunger_ <= 0 && i == 0) {
			if(typer) {
				draw_sprite_ext(s_stats, 0,xx,yy, 3, 3, 0, image_blend, image_alpha);
			} else {
				draw_sprite_ext(s_stats, 3,xx,yy, 3, 3, 0, image_blend, image_alpha);
			}
		} else if(o_player.hunger_ > 0 && i < 20) {	
			if(i < o_player.hunger_/5)
				draw_sprite_ext(s_stats, 3,xx,yy, 3, 3, 0, image_blend, image_alpha);
		}
	
		if(i == 20 && global.hour > 6 && global.hour < 22) {
			draw_sprite_ext(s_stats, 7,xx,yy, 3, 3, 0, image_blend, image_alpha);
		} else if(i == 20) {
			draw_sprite_ext(s_stats, 8,xx,yy, 3, 3, 0, image_blend, image_alpha);
		}
	}
	
	
	// Temperature
	draw_text(30, 93, string(global.temperature) + " c" );
	
	// Days
	draw_text(30, 68, "day " + string(global.days));
	
	var statusX = 0;
	
	draw_set_halign(fa_right);
	
	if(o_player.hunger_ < 50 && o_player.hunger_ > 0) {
		draw_set_color($37BAFF);
		draw_text(280, 68+statusX, "hungry");
		statusX += 25;
	}
	
	if(o_player.hunger_ <= 0) {
		draw_set_color($37BAFF);
		draw_text(280, 68+statusX, "starving");
		statusX += 25;
	}

	if(o_player.isBleeding) {
		draw_set_color($5938FF);
		draw_text(280, 68+statusX, "bleeding");
		statusX += 25;
	}
	
	if(o_player.isInjured) {
		draw_set_color($5938FF);
		draw_text(280, 68+statusX, "broken limb");
		statusX += 25;
	}
	
	if(o_player.isCold) {
		draw_set_color($FFEB36);
		draw_text(280, 68+statusX, "cold");
		statusX += 25;
	}
	
	if(o_player.isWarm) {
		draw_set_color($5938FF);
		draw_text(280, 68+statusX, "warm");
		statusX += 25;
	}
	
	if(o_player.slightlyWarm && !o_player.isWarm) {
		draw_set_color($5938FF);
		draw_text(280, 68+statusX, "slightly warm");
		statusX += 25;
	}
	
	draw_set_halign(fa_left);
}	
#endregion

draw_set_font(f_hud);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
if(global.hour > 8 && global.hour < 19)
	draw_set_color($333128);
else
	draw_set_color(c_white);

draw_text(30,1050, "V " + string(GM_version));	

// TIPS and NOTIFICATIONS
if(!global.isPaused) {
	 if(global.journalKey && journalKeyTime < 480) { // Journal Key updated
		if(o_hud.typer)
			draw_sprite(s_tip, 0, 1920-30, 1050);
		else
			draw_sprite(s_tip, 1, 1920-30, 1050);
	
		draw_set_font(f_hud);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
	
		draw_text(1920-30-16, 1050, "Journal updated");
	
		journalKeyTime++;
	} else if(global.journalGate && journalGateTime < 480) { // Journal Gate updated
		if(o_hud.typer)
			draw_sprite(s_tip, 0, 1920-30, 1050);
		else
			draw_sprite(s_tip, 1, 1920-30, 1050);
	
		draw_set_font(f_hud);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
	
		draw_text(1920-30-16, 1050, "Journal updated");
	
		journalGateTime++;
	} else if(global.compoundEntered && journalBunkerTime < 480) { // Journal Bunker updated
		if(o_hud.typer)
			draw_sprite(s_tip, 0, 1920-30, 1050);
		else
			draw_sprite(s_tip, 1, 1920-30, 1050);
	
		draw_set_font(f_hud);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
	
		draw_text(1920-30-16, 1050, "Journal updated");
	
		journalBunkerTime++;
	} else if(global.enemyMap && enemyMapTime < 480) { // Map updated
		if(o_hud.typer)
			draw_sprite(s_tip, 0, 1920-30, 1050);
		else
			draw_sprite(s_tip, 1, 1920-30, 1050);
	
		draw_set_font(f_hud);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
	
		draw_text(1920-30-16, 1050, "Map updated");
	
		enemyMapTime++;
	}
}
}