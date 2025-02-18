

switch(estado){
	case "idle":
		sprite_index = spr_parede_espinhos;
		
		//Saindo de estado
		//Destruindo
		if(obj_botao.destroi_parede = true)
		{
			estado = "destroi";	
		}
	break;
	
	case "destroi":
		//Sprite
		sprite_index = spr_parede_espinhos_destroy;
		if(!audio_is_playing(sfx_explosion))
		{
			audio_play_sound(sfx_explosion, 11, false);
		}
		
		if(image_index >= image_number - 1)
		{
			instance_destroy();
		}
	break;
}