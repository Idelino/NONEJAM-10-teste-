resolution_width = 800;
resolution_height = 600;
global.resolution_scale = 2;
resolution_scale = global.resolution_scale;
global.view_width = resolution_width / resolution_scale;
global.view_height = resolution_height / resolution_scale;

alvo_solo = obj_player_1; // Começa focando no player 1

view_speed = 0.2;
max_distance = 200;
zoom_min = 1;
zoom_max = 2;

window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale);
surface_resize(application_surface, global.view_width * resolution_scale, global.view_height * resolution_scale);
window_center();