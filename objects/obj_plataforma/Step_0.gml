if(global.solo == false)
{
	if (instance_exists(obj_player_1) || instance_exists(obj_player_2)) 
	{
	    var player1_bottom = instance_exists(obj_player_1) ? obj_player_1.bbox_bottom : -1;
	    var player2_bottom = instance_exists(obj_player_2) ? obj_player_2.bbox_bottom : -1;
    
	    if (bbox_bottom >= player1_bottom || bbox_bottom >= player2_bottom) 
	    {
			sprite_index = spr_plataforma;
	    } 
	    else  if(bbox_bottom <= player1_bottom || bbox_bottom <= player2_bottom)
	    {
	        sprite_index = -1;
	    }
	}
}
else if(global.solo == true)
{
	if (instance_exists(obj_player_1))
	{
		if(bbox_bottom >= obj_player_1.bbox_bottom)
		{
			sprite_index = spr_plataforma;	
		}else{
			sprite_index = -1;	
		}
	}
	if(instance_exists(obj_player_2))
	{
		if(bbox_bottom >= obj_player_2.bbox_bottom)
		{
			sprite_index = spr_plataforma;	
		}else{
			sprite_index = -1;	
		}
	}
}