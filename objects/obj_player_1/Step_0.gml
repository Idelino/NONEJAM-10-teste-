//Controles
get_controls_player_1();

var _colisao = layer_tilemap_get_id("tl_colisao");
var _plat = place_meeting(x, y+1, obj_plataforma);
var _botao = place_meeting(x, y+1, obj_botao);
var _colisao_p1 = layer_tilemap_get_id("tl_colisao_player_1");

//Código de movimentação
velh = (right_key - left_key) * max_velh;

if(velv > term_vel) { velv = term_vel; };

//Bonk code (optional)
//if(velv < 0 && place_meeting(x, y-1, _colisao) || place_meeting(x, y-1, _colisao_p1))
//{
//	jump_hold_timer = 0;
//}

//Sabendo se eu estou no chão
if(velv >= 0 && place_meeting(x, y+1, _colisao) || velv >= 0 && place_meeting(x, y+1, _colisao_p1) || velv >= 0 &&  _plat || velv >= 0 && _botao)
{
	set_on_ground(true);
	if(_plat || _botao)
	{
		on_plat = true;
		velv = 0;
	} else {
		on_plat = false;	
	}
}
if(on_ground)
{
	jump_count = 0;
	jump_hold_timer = 0;
	vfx_pulo = 2;
	vfx_pulo_numb = 0;
	
	coyote_jump_timer = coyote_jump_frames;
} else {
	//Ter certeza de que ele não consegue pular mais de uma vez
	coyote_jump_timer--;
	if(jump_count == 0 && coyote_jump_timer <= 0) { jump_count = 1; };
	vfx_pulo = 1;
}

//Aplicando gravidade
if(coyote_hang_timer > 0)
{
	coyote_hang_timer--;

} else {
	velv += GRAVIDADE * massa;
	set_on_ground(false);

}

if(jump_key_buffered && jump_count < jump_max)
{
	//Reset the buffer
	jump_key_buffered = false;
	jump_key_buffer_timer = 0;
		
	//Aumentar o numero de pulos feitos
	jump_count++;
		
	//set the jump hold timer
	jump_hold_timer = jump_hold_frames[jump_count-1];
	
	//Tell ourself we're no longer on the ground
	set_on_ground(false);
}
//cut off the jump by releasing the jump button
if(!jump_key)
{
	jump_hold_timer = 0;	
}
 
//Jump based on the timer/holding the button
if(jump_hold_timer > 0)
{
	//Constantly set the velv to be jumping speed
	velv = jspd[jump_count-1];
	//Count down the timer
	jump_hold_timer--;
}

if(vida_atual <= 0)
{
	estado = "die";
	if(instance_exists(obj_player_2))
	{
		obj_player_2.vida_atual = 0;	
	}
} else if( vida_atual >= 1) {
	image_speed = 1;
}

if(timer_die <= 0)
{
	var _checkpoint = instance_nearest(x, y, obj_checkpoint);
	x = _checkpoint.x;
	y = _checkpoint.y;
	if(instance_exists(obj_player_2))
	{
		obj_player_2.x = _checkpoint.x;
		obj_player_2.y = _checkpoint.y;
		obj_player_2.vida_atual = 1;
		obj_player_2.estado = "parado";
	}
	vida_atual = 1;
	estado = "parado";	
	timer_die = 1;
}



if(estado = "movendo")
{
	if(!audio_is_playing(sfx_footsteps))
	{
		audio_play_sound(sfx_footsteps, 9, true);	
	}
} else {
	audio_stop_sound(sfx_footsteps);	
}


switch(estado){
	
	#region PARADO
	case "parado":
		//Sprite
		sprite_index = spr_player1_idle;
		
		
		//Saíndo do estado
		//Andando
		if(velh != 0)
		{
			estado = "movendo";
		}
		//Pulando
		if(velv != 0)
		{
			estado = "pulando";
		}
	break;
	#endregion 
	
	#region MOVENDO
	case "movendo":
		//sprite
		sprite_index = spr_player1_walk;
		

		
		//Saíndo do estado
		if(velh = 0)
		{
			estado = "parado";
		}
		//Pulando
		if(velv != 0)
		{
			estado = "pulando";
		}		
	break;
	#endregion
	
	#region PULANDO
	case "pulando":
		//Sprite
		if(velv < 0)
		{
			if(jump_count = 1)
			{
				sprite_index = spr_player1_jump;	
			}
			if(jump_count = 2)
			{
				sprite_index = spr_player1_jump_2;	
			}
		} else {
			if(jump_count = 1)
			{
				sprite_index = spr_player1_fall;	
			}
			if(jump_count = 2)
			{
				sprite_index = spr_player1_fall_2;	
			}
			
		}
		
		//Mecanica
		
		
		
		//Saíndo do estado
		if(on_ground)
		{
			estado = "parado";
			if(!audio_is_playing(jumpland))
			{
				audio_play_sound(jumpland, 3, false);
			}
		}
	break;
	#endregion
	
	#region DIE
	case "die":
		//Sprite
		sprite_index = spr_player1_die;
		
		//Mecânica
		velh = 0;
		velv = 0;
		
		//Saíndo do estado
		if(image_index >= image_number - 1)
		{
			timer_die = 0;	
		}
	break;
	#endregion
}