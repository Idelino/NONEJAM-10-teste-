
if(instance_exists(alvo_solo))
{
	if (keyboard_check_pressed(ord("E")) && global.solo && alvo_solo.estado != "abaixado") 
	{
	    if (instance_exists(alvo_solo)) 
		{
			if(alvo_solo.on_ground = true || alvo_solo.on_plat = true)
			{
		        var new_x = alvo_solo.x;
		        var new_y = alvo_solo.y;
				var _xscale = alvo_solo.xscale;
		        var new_player;
        
		        if (alvo_solo.object_index == obj_player_1) {
		            instance_destroy(alvo_solo);
		            new_player = instance_create_layer(new_x, new_y, "Players", obj_player_2);
					new_player.xscale = _xscale;
		        } else {
		            instance_destroy(alvo_solo);
		            new_player = instance_create_layer(new_x, new_y, "Players", obj_player_1);
					new_player.xscale = _xscale;
		        }
        
		        alvo_solo = new_player;
			}
	    }
	}
}
