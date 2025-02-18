if (global.solo)
{ // Modo solo
    if (instance_exists(alvo_solo)) 
	{
        var target_x = alvo_solo.x - global.view_width / 2;
        var target_y = alvo_solo.y - global.view_height / 2;
		
		global.view_width = resolution_width / global.resolution_scale;
		global.view_height = resolution_height / global.resolution_scale;
		
        target_x = clamp(target_x, 0, room_width - global.view_width);
        target_y = clamp(target_y, 0, room_height - global.view_height);

        camera_set_view_size(view_camera[0], global.view_width, global.view_height);
        camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), target_x, view_speed),
                                              lerp(camera_get_view_y(view_camera[0]), target_y, view_speed));
    }
} else if (instance_exists(obj_player_1) && instance_exists(obj_player_2)) { // Modo multiplayer
    var x1 = obj_player_1.x;
    var y1 = obj_player_1.y;
    var x2 = obj_player_2.x;
    var y2 = obj_player_2.y;

    var mid_x = (x1 + x2) / 2;
    var mid_y = (y1 + y2) / 2;

    var dist = point_distance(x1, y1, x2, y2);
    var zoom = clamp(800 / max(dist, 200), zoom_min, zoom_max);

    global.view_width = (resolution_width / zoom);
    global.view_height = (resolution_height / zoom);

    camera_set_view_size(view_camera[0], global.view_width, global.view_height);

    var target_x = clamp(mid_x - global.view_width / 2, 0, room_width - global.view_width);
    var target_y = clamp(mid_y - global.view_height / 2, 0, room_height - global.view_height);

    camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), target_x, view_speed),
                                          lerp(camera_get_view_y(view_camera[0]), target_y, view_speed));

    // Bloqueio de movimento se os players estiverem longe demais
    if (dist > max_distance) {
        if (x1 > x2) {
            if (obj_player_1.velh > 0) obj_player_1.velh = 0;
            if (obj_player_2.velh < 0) obj_player_2.velh = 0;
        } else {
            if (obj_player_1.velh < 0) obj_player_1.velh = 0;
            if (obj_player_2.velh > 0) obj_player_2.velh = 0;
        }
        if (y1 > y2) {
            if (obj_player_1.velv > 0) obj_player_1.velv = 0;
            if (obj_player_2.velv < 0) obj_player_2.velv = 0;
        } else {
            if (obj_player_1.velv < 0) obj_player_1.velv = 0;
            if (obj_player_2.velv > 0) obj_player_2.velv = 0;
        }
    }
}
