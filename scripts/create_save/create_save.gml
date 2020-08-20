function create_save() {
	global.saves++;

	global.saveRooms[global.saves] = room_duplicate(r_new);

	room_goto(global.saveRooms[global.saves]);


}
