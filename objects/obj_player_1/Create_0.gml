
// Inherit the parent event
event_inherited();

//Custom functions for player
function set_on_ground(_val = true){
	if(_val == true)
	{
		on_ground = true;
		coyote_hang_timer = coyote_hang_frames
	} else {
		on_ground = false;
		coyote_hang_timer = 0;
	}
}
//control_setup
control_setup();

max_velh = 2;
max_velv = 6;

if (instance_number(obj_player_1) > 1) instance_destroy();


estado = "parado";
vfx_pulo = 2;
vfx_pulo_numb = 0;

on_plat = false;

jump_key_pressed = keyboard_check_pressed(vk_up);
jump_key_pressed = clamp(jump_key_pressed, 0, 1);

max_vida = 3;
vida_atual = max_vida;

tempo_morre = 6;
timer_die = 1;

//Jumping
	massa = 1.8;
	term_vel = 3;
	on_ground = true;
	jump_max = 2;
	jump_count = 0;
	jump_hold_timer = 0;
	//Jump values for each successive jump
		jump_hold_frames[0] = 12;
		jspd[0] = -3.2;
		jump_hold_frames[1] = 8;
		jspd[1] = -4.6;
	//Coyote time
	  //Hang time
	  coyote_hang_frames = 4;
	  coyote_hang_timer = 0;
	  //Jump buffer time
	  coyote_jump_frames = 5;
	  coyote_jump_timer = 0;

	
	
	
	
	
	