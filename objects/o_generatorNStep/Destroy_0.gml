with(o_hud){
	//array of all blocks of minimaps
	#region filling the array, old fashioned way

			show_debug_message("minimapVar size: "+string(ds_list_size(global.minimapVar)));
			show_debug_message("activemm size"+string(ds_list_size(global.activemm)));
			show_debug_message("creating map blocks");
			//only clear out the array as all false when the game first starts
			scr_clear_update(global.blockUpdateArr);

			//initiate the sprites (ugh idk what else can be done here tho)
			// and add them to the array
			show_debug_message("mapWidth : "+string(mapWidth));
			show_debug_message("mapHeight : "+string(mapHeight));
	
			var blockSpr0 = scr_create_map_block(0, 0, mapWidth, mapHeight);
			global.blockArr[0] = blockSpr0;
			show_debug_message("block0");
			var blockSpr1 = scr_create_map_block(0, 1, mapWidth, mapHeight);
			global.blockArr[1] = blockSpr1;
			show_debug_message("block1");
			var blockSpr2 = scr_create_map_block(0, 2, mapWidth, mapHeight);
			global.blockArr[2] = blockSpr2;		
			show_debug_message("block2");
			var blockSpr3 = scr_create_map_block(0, 3, mapWidth, mapHeight);
			global.blockArr[3] = blockSpr3;
			show_debug_message("block3");
			var blockSpr4 = scr_create_map_block(0, 4, mapWidth, mapHeight);
			global.blockArr[4] = blockSpr4;
			show_debug_message("block4");
			var blockSpr5 = scr_create_map_block(1, 0, mapWidth, mapHeight);
			global.blockArr[5] = blockSpr5;
			show_debug_message("block5");
			var blockSpr6 = scr_create_map_block(1, 1, mapWidth, mapHeight);
			global.blockArr[6] = blockSpr6;
			show_debug_message("block6");
			var blockSpr7 = scr_create_map_block(1, 2, mapWidth, mapHeight);
			global.blockArr[7] = blockSpr7;
			show_debug_message("block7");
			var blockSpr8= scr_create_map_block(1, 3, mapWidth, mapHeight);
			global.blockArr[8] = blockSpr8;
			show_debug_message("block8");
			var blockSpr9 = scr_create_map_block(1, 4, mapWidth, mapHeight);
			global.blockArr[9] = blockSpr9;
			show_debug_message("block9");
			var blockSpr10 = scr_create_map_block(2, 0, mapWidth, mapHeight);
			global.blockArr[10] = blockSpr10;
			show_debug_message("block10");
			var blockSpr11 = scr_create_map_block(2, 1, mapWidth, mapHeight);
			global.blockArr[11] = blockSpr11;
			show_debug_message("block11");
			var blockSpr12 = scr_create_map_block(2, 2, mapWidth, mapHeight);
			global.blockArr[12] = blockSpr12;
			show_debug_message("block12");
			var blockSpr13 = scr_create_map_block(2, 3, mapWidth, mapHeight);
			global.blockArr[13] = blockSpr13;
			show_debug_message("block13");
			var blockSpr14 = scr_create_map_block(2, 4, mapWidth, mapHeight);
			global.blockArr[14] = blockSpr14;
			show_debug_message("block14");
			var blockSpr15 = scr_create_map_block(3, 0, mapWidth, mapHeight);
			global.blockArr[15] = blockSpr15;
			show_debug_message("block15");
			var blockSpr16 = scr_create_map_block(3, 1, mapWidth, mapHeight);
			global.blockArr[16] = blockSpr16;
			show_debug_message("block16");
			var blockSpr17 = scr_create_map_block(3, 2, mapWidth, mapHeight);
			global.blockArr[17] = blockSpr17;
			show_debug_message("block17");
			var blockSpr18 = scr_create_map_block(3, 3, mapWidth, mapHeight);
			global.blockArr[18] = blockSpr18;
			show_debug_message("block18");
			var blockSpr19 = scr_create_map_block(3, 4, mapWidth, mapHeight);
			global.blockArr[19] = blockSpr19;
			show_debug_message("block19");
			var blockSpr20 = scr_create_map_block(4, 0, mapWidth, mapHeight);
			global.blockArr[20] = blockSpr20;
			show_debug_message("block20");
			var blockSpr21 = scr_create_map_block(4, 1, mapWidth, mapHeight);
			global.blockArr[21] = blockSpr21;
			show_debug_message("block21");
			var blockSpr22 = scr_create_map_block(4, 2, mapWidth, mapHeight);
			global.blockArr[22] = blockSpr22;
			show_debug_message("block22");
			var blockSpr23 = scr_create_map_block(4, 3, mapWidth, mapHeight);
			global.blockArr[23] = blockSpr23;
			show_debug_message("block23");
			var blockSpr24 = scr_create_map_block(4, 4, mapWidth, mapHeight);
			global.blockArr[24] = blockSpr24;
			show_debug_message("block24");
			show_debug_message("finished making map blocks");

	#endregion	
}

with(o_camera){
	instance_deactivate_all(true);
	instance_activate_region(o_camera.x-200, o_camera.y-200, 500, 500, true);
	instance_activate_object(o_player);
	instance_activate_object(o_player_hitBox);
	instance_activate_object(o_shaders);	
	instance_activate_object(o_initializer);
	instance_activate_object(o_weather);
	instance_activate_object(o_hud);
	//instance_activate_object(o_debugger);
	instance_activate_object(o_input);
}
		
//unset global offset
global.xoffset = 0;
global.yoffset = 0;