// Centering the window
window_center();

// Following the camera for each room
if(room == r_title)
	camera_set_view_pos(view_camera[0], o_camera_title.x - ideal_width / 2, o_camera_title.y - ideal_height / 2);
else
	camera_set_view_pos(view_camera[0], o_camera.x - ideal_width / 2, o_camera.y - ideal_height / 2);
	
// Setting display size if it changes
if(window_get_width() != global.display_width || window_get_height() != global.display_height)
	window_set_size(global.display_width, global.display_height);
	
if(!audio_is_playing(sn_winter_air) && !global.inCave)
	audio_play_sound(sn_winter_air, 1, true);
else if(audio_is_playing(sn_winter_air) && global.inCave)
	audio_stop_sound(sn_winter_air);	

	
if(!audio_is_playing(sn_title) && room == r_title)
	audio_play_sound(sn_title, 1, true);
	
global.wind += value;