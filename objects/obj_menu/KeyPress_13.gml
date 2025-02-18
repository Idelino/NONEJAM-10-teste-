if(index == 0)
{
	global.solo = false;
	audio_play_sound(Retro_Blop_22, 10, false, );
	room_goto(rm_tutorial_modo_dupla);
}

if(index == 1)
{
	global.solo = true;
		audio_play_sound(Retro_Blop_22, 10, false);
	room_goto(rm_tutorial_modo_solo);
}

if(index == 2)
{
		audio_play_sound(Retro_Blop_22, 10, false);
	room_goto(rm_creditos);
}

if(index == 3)
{
		audio_play_sound(Retro_Blop_22, 10, false);
	game_end();	
}