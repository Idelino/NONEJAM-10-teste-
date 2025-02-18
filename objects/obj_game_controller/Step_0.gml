//if(keyboard_check_pressed(vk_tab)) global.debug = !global.debug;

//if(keyboard_check_pressed(vk_enter)) room_restart();

//if(keyboard_check_pressed(vk_end))
//{
//	global.solo = !global.solo;
//	game_restart();
//}

#region PARALAX
//PARALAX
var fg	        =   layer_get_id("fg");
var back        =	  layer_get_id("bg_back");
var near        =   layer_get_id("bg_near");
var stillNear   =   layer_get_id("bg_stillNear");
var stillNear_2 =   layer_get_id("bg_stillNear_2");
var distant     =   layer_get_id("bg_distant");
var farAway     =   layer_get_id("bg_farAway");
var FarFar      =   layer_get_id("bg_FarFar");

//Se a layer existir
//Aplico um efeito de velocidade nela, com base na camera(view_camera[0], para aplicar o efeito de paralax

	if(layer_exists(fg))
	{
		layer_x(fg,	   lerp(0, camera_get_view_x(view_camera[0]), 0.01));
	}
	if(layer_exists(back))
	{
		layer_x(back,	   lerp(0, camera_get_view_x(view_camera[0]), 0.01) );
	}
	if(layer_exists(near))
	{
		layer_x(near,	   lerp(0, camera_get_view_x(view_camera[0]), 0.3) );
	}
	if(layer_exists(stillNear))
	{
		layer_x(stillNear,	   lerp(0, camera_get_view_x(view_camera[0]), 0.5) );
		if(layer_get_y(stillNear) < layer_get_y(stillNear) - 64)
		{
			layer_y(stillNear,	   lerp(layer_get_y(stillNear), camera_get_view_y(view_camera[0]), 0.1) );
		}
	}
	if(layer_exists(stillNear_2))
	{
		layer_x(stillNear_2,	   lerp(0, camera_get_view_x(view_camera[0]), 0.7) );
		if(layer_get_y(stillNear_2) < layer_get_y(stillNear_2) - 64)
		{
			layer_y(stillNear_2,	   lerp(layer_get_y(stillNear_2), camera_get_view_y(view_camera[0]), 0.2) );
		}
	}
	if(layer_exists(distant))
	{
		layer_x(distant,	   lerp(0, camera_get_view_x(view_camera[0]), 0.80) );
		if(layer_get_y(distant) < layer_get_y(distant) - 64)
		{
			layer_y(distant,	   lerp(layer_get_y(stillNear_2), camera_get_view_y(view_camera[0]), 0.4) );
		}		
	}
	if(layer_exists(farAway))
	{
		layer_x(farAway,	   lerp(0, camera_get_view_x(view_camera[0]), 0.9) );
	}
	if(layer_exists(FarFar))
	{
		layer_x(FarFar,	   lerp(0, camera_get_view_x(view_camera[0]), 1));
	}
#endregion