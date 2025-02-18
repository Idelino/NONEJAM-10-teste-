/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if(global.debug)
{
	draw_text(32, 32, on_ground);	
}

	if(jump_key_pressed && jump_count < jump_max + 1 && vfx_pulo > 0 && coyote_jump_timer > 0)
	{
		var _vfx = instance_create_layer(x, y + 4, "vfx_player", obj_vfx_jump);
		vfx_pulo--;
		vfx_pulo_numb++;
		if(jump_count == 2)
		{
			_vfx.image_blend = c_lime;
		}
	}