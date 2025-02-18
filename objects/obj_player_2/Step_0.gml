#region Controles
	if(!global.solo)
	{
			//Inputs direcionais
			right_key = keyboard_check(ord("D"));
				right_key = clamp(right_key, 0, 1);
			left_key  = keyboard_check(ord("A"));
				left_key  = clamp(left_key, 0, 1);
	
			//Inputs de ação
			jump_key_pressed = keyboard_check_pressed(ord("W"));
				jump_key_pressed = clamp(jump_key_pressed, 0, 1);
			jump_key = keyboard_check(ord("W"));
				jump_key = clamp(jump_key, 0, 1);
		
			//Jump key buffering
			if(jump_key_pressed)
			{
				jump_key_buffer_timer = jump_buffer_time;
			}
			if(jump_key_buffer_timer > 0)
			{
				jump_key_buffered = 1;
				jump_key_buffer_timer--;
			} else {
				jump_key_buffered = 0;	
			}
		} 
	if(global.solo)
	{
		//Inputs direcionais
		right_key = keyboard_check(vk_right);
			right_key = clamp(right_key, 0, 1);
		left_key  = keyboard_check(vk_left);
			left_key  = clamp(left_key, 0, 1);
	
		//Inputs de ação
		jump_key_pressed = keyboard_check_pressed(vk_up);
			jump_key_pressed = clamp(jump_key_pressed, 0, 1);
		jump_key = keyboard_check(vk_up);
			jump_key = clamp(jump_key, 0, 1);
		
		//Jump key buffering
		if(jump_key_pressed)
		{
			jump_key_buffer_timer = jump_buffer_time;
		}
		if(jump_key_buffer_timer > 0)
		{
			jump_key_buffered = 1;
			jump_key_buffer_timer--;
		} else {
			jump_key_buffered = 0;	
		} 	
	}
#endregion

var _colisao = layer_tilemap_get_id("tl_colisao");
var _plat = place_meeting(x, y+1, obj_plataforma);
var _botao = place_meeting(x, y+1, obj_botao);
var _colisao_p2 = layer_tilemap_get_id("tl_colisao_player_2");
//Código de movimentação
velh = (right_key - left_key) * max_velh;

if(velv > term_vel) { velv = term_vel; };

////Bonk code (optional)
//if(velv < 0 && place_meeting(x, y-1, _colisao) || place_meeting(x, y-1, _colisao_p2))
//{
//	jump_hold_timer = 0;
//}

//Sabendo se eu estou no chão
if(velv >= 0 && place_meeting(x, y+1, _colisao) || velv >= 0 && place_meeting(x, y+1, _colisao_p2) || velv >= 0 && _plat || velv >= 0 && _botao)
{
	set_on_ground(true);
	if(_plat || _botao)
	{
		on_plat = true
		velv = 0;
	} else {
		on_plat = false;	
	}
}
if(on_ground)
{
	
	jump_count = 0;
	jump_hold_timer = 0;
	vfx_pulo = 1;
	vfx_pulo_numb = 0;
	
	coyote_jump_timer = coyote_jmup_frames;
} else {
	//Ter certeza de que ele não consegue pular mais de uma vez
	coyote_jump_timer--;
	if(jump_count == 0 && coyote_jump_timer <= 0) { jump_count = 1; };
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

if(estado = "abaixado")
{
	mask_index = spr_player2_abaixado;	
} else {
	mask_index = spr_player_mask;	
}

if(vida_atual <= 0)
{
	estado = "die";
	if(instance_exists(obj_player_1))
	{
		obj_player_1.vida_atual = 0;	
	}
}  else if(vida_atual >= 1) {
	image_speed = 1;
}


if(timer_die <= 0)
{
	
	var _checkpoint = instance_nearest(x, y, obj_checkpoint);
	x = _checkpoint.x;
	y = _checkpoint.y;
	if(instance_exists(obj_player_1))
	{
	obj_player_1.x = _checkpoint.x;
	obj_player_1.y = _checkpoint.y;
	obj_player_1.vida_atual = 1;
	obj_player_1.estado = "parado";
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

//Maquina de estados
switch(estado){
	
	#region PARADO
	case "parado":
		//sprite
		sprite_index = spr_player2_idle;
		
		//Mecanica
		
		//Saíndo do estado
		//Movendo
		if(velh != 0)
		{
			estado = "movendo";
		}
		//Abaixado
		if(place_meeting(x, y, obj_buraco) && velh != 0 && on_ground = true && !place_meeting(x, y, obj_player_1))
		{
			estado = "abaixado";	
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
		sprite_index = spr_player2_walk;
		//mecânica
		max_velh = 2;
		
		//Saíndo do estado
		//Parado
		if(velh = 0)
		{
			estado = "parado";
		}
		//Abaixado
		if(place_meeting(x, y, obj_buraco) && velh != 0 && on_ground = true)
		{
			estado = "abaixado";	
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
			
			sprite_index = spr_player2_jump;
		} else {
			sprite_index = spr_player2_fall;
			if(image_index >= image_number - 1)
			{
				image_index = image_number - 1;	
			}
		}
	
		//Saindo do estado
		if(on_ground)
		{
			if(!audio_is_playing(jumpland))
			{
				audio_play_sound(jumpland, 3, false);
			}
			estado = "parado";	
		}
	
	
	break;
	#endregion
	
	#region ABAIXADO
	case "abaixado":
	aplica_gravidade();
		//Sprite
		sprite_index = spr_player2_abaixado;
		
		//Mecânica
		if(velh = 0)
		{
			image_speed = 0;	
		} else {
			image_speed = 1;	
		}
		max_velh = 1.5;
		jspd[0] = -3.15;
		
		//Saindo do estado
		//Parado
		if(!place_meeting(x, y, obj_buraco))
		{
			estado = "parado";
		}
		
		
	break;
	#endregion
	
	#region DIE
	case "die":
	
		//Sprite
		sprite_index = spr_player2_die;
		
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

show_debug_message(on_ground);
