
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

if (instance_number(obj_player_2) > 1) instance_destroy();


max_vida = 3;
vida_atual = max_vida;


on_plat = false;

tempo_morre = 10;
timer_die = 1;

vfx_pulo = 1;
vfx_pulo_numb = 0;
jump_key_pressed = keyboard_check_pressed(vk_up);
jump_key_pressed = clamp(jump_key_pressed, 0, 1);

//Jumping
	massa = 1.8;
	term_vel = 4;
	on_ground = true;
	jump_max = 1;
	jump_count = 0;
	jump_hold_timer = 0;
//Jump values for each successive jump
	jump_hold_frames[0] = 12;
	jspd[0] = -3.15;
	jump_hold_frames[1] = 8;
	jspd[1] = -3.15;
	//Coyote time
	  //Hang time
	  coyote_hang_frames = 4;
	  coyote_hang_timer = 0;
	  //Jump buffer time
	  coyote_jmup_frames = 5;
	  coyote_jump_timer = 0;

	
		
	
	
aplica_gravidade = function(){
	//Aplicando gravidade
	if(on_ground = false)
	{
		velv += GRAVIDADE * massa;
		//Ter certeza de que ele não consegue pular mais de uma vez
		if(jump_count == 0) { jump_count = 1; };

	} else {
		//Se o player esta no ar
		//Reset/reparar variaveis de pulo
		jump_count = 0;
		jump_hold_timer = 0;

	}
}