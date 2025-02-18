if(room = rm_menu_principal)
{
	if(!audio_is_playing(music_titlecard_sokoban))
	{
		audio_stop_all();
		audio_play_sound(music_titlecard_sokoban, 2, true);
	}
}else{
	if(!audio_is_playing(music_titlecard_sokoban))
	{
		audio_stop_all();
		audio_play_sound(music_level_sokoban, 2, true);
	}
	
}