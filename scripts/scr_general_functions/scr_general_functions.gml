function control_setup()
{
	jump_buffer_time = 6;
	
	jump_key_buffered = 0;
	jump_key_buffer_timer = 0;
}

function get_controls_player_1(){
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
function get_controls_player_2(){
	if(global.solo)
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
	
	if(!global.solo)
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
	
}