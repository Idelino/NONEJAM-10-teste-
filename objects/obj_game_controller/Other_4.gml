if(global.solo = false)
{
	var _x = obj_checkpoint._x;
	var _y = obj_checkpoint._y;
	if(!instance_exists(obj_player_1) || !instance_exists(obj_player_2))
	{
		instance_create_layer(_x, _y, "Players", obj_player_1);
		instance_create_layer(_x + 5, _y, "Players", obj_player_2);
	}
} else {
	var _x = obj_checkpoint._x;
	var _y = obj_checkpoint._y;
	if(!instance_exists(obj_player_1) || !instance_exists(obj_player_2))
	{
		instance_create_layer(_x, _y, "Players", obj_player_1);
	}
}
