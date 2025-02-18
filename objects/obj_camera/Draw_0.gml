if (!global.solo) {
	draw_set_color(c_white)
    var x1 = obj_player_1.x;
    var x2 = obj_player_2.x;
    var y1 = obj_player_1.y;
    var y2 = obj_player_2.y;
    var max_distance = 112;
    var mid_x = (x1 + x2) / 2;
    var mid_y = (y1 + y2) / 2;
    
    if (!global.debug)
	{
        draw_circle(mid_x, mid_y, max_distance, true);
    }
	draw_set_color(-1);
}