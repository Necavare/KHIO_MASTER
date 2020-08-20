function item_durability() {
	var durability = argument[0];
	var items = argument[1];
	var ix = argument[2];
	var iy = argument[3];

	if(durability[# ix, iy] > -1 
	&& items[# ix, iy] != item.cookedmeat && items[# ix, iy] != item.meat 
	&& items[# ix, iy] != item.cookedhuman && items[# ix, iy] != item.human 
	&& items[# ix, iy] != item.fungi && items[# ix, iy] != item.cookedfungi
	&& items[# ix, iy] != item.berry)
		return 11 - durability[# ix, iy];
	else if(durability[# ix, iy] > -1 
	&& (items[# ix, iy] == item.cookedmeat || items[# ix, iy] == item.cookedhuman 
	|| items[# ix, iy] == item.human || items[# ix, iy] == item.meat
	|| items[# ix, iy] == item.fungi || items[# ix, iy] == item.cookedfungi
	|| items[# ix, iy] == item.berry))
		return 23 - durability[# ix, iy];


}
