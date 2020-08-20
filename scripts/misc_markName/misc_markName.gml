/// misc_markName (index, x, y)
/// @description misc_markName(index, x, y)
/// @param index
/// @param x
/// @param y
function misc_markName(argument0, argument1, argument2) {

	//*****************************************************************************************
	//this code will show the name of a mark both when selected and hovered as set in inventory
	//*****************************************************************************************

	var index = argument0;
	var name = o_hud.markerName[index];
	var xp = argument1;
	var yp = argument2;
	var color = o_hud.markerCol[index];

	var outBoxCol = color;
	var inBoxCol = c_white;

	draw_set_font(f_hud);
	draw_set_color(make_color_rgb(40, 49, 51));
	draw_set_halign(fa_left);

	var stringW = string_width(name);
	var stringH = string_height(name);
	//check wether or not to add a cursor (if name editor is open and the selected marker is this marker)
	if((o_hud.editNameSelected&&o_hud.selectedMarkerIndex==index)){
		if(o_hud.typer){
			name += "|";
		}
		stringH = string_height(name);
		stringW += string_width("|");
	}
	else if(instance_exists(o_marker)){
		if(o_marker.editNameSelected){
			if(o_hud.typer){
				name+="|";
			}
			stringH = string_height(name);
			stringW +=string_width("|");
		}
	}
	var startX = xp + 14;
	var startY = yp - 14;

	//if name is blank
	if(name == ""){
		//stringW = string_width("|");
		stringH = string_height("|");
	}
	// Outer rectangle
	draw_rectangle_color(startX, startY, startX + stringW + 12, startY + stringH + 2, outBoxCol, outBoxCol, outBoxCol, outBoxCol, false);

	// Inner rectangle
	draw_rectangle_color(startX+4, startY+4, startX + stringW + 8, startY + 24, inBoxCol, inBoxCol, inBoxCol, inBoxCol, false);

	// Text

	//valign
	draw_set_valign(fa_top);

	draw_text_transformed(startX+8, startY+1, name, 1, 1, 0);

	draw_set_font(f_hud);


}
