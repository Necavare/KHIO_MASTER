// Sound
if(!audio_group_is_loaded(fx))
	audio_group_load(fx);
if(!audio_group_is_loaded(main_music))
	audio_group_load(main_music);
if(!audio_group_is_loaded(back_music))
	audio_group_load(back_music);
if(!audio_group_is_loaded(camp_music))
	audio_group_load(camp_music);
if(!audio_group_is_loaded(dynamic_music))
	audio_group_load(dynamic_music);
	
if(audio_group_is_loaded(fx))
	audio_group_set_gain(fx, global.SN_FX, 1000);
if(audio_group_is_loaded(back_music))
	audio_group_set_gain(back_music, global.SN_MUSIC, 1000)
	
