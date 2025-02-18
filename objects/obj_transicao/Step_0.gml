if (mudei) {
    alpha -= 0.4;
} else {
    alpha += 0.4;
}

// Se global.solo = true, apenas o player existente será movido.
if (global.solo) {
    if (alpha >= 1) {
        room_goto(destino);

        if (instance_exists(obj_player_1)) {
            obj_player_1.x = destino_x;
            obj_player_1.y = destino_y;
        } else if (instance_exists(obj_player_2)) {
            obj_player_2.x = destino_x;
            obj_player_2.y = destino_y;
        }
    }
}
// Se for multiplayer, ambos devem estar dentro do obj_sensor
else {
    if (alpha >= 1) {
        room_goto(destino);

        obj_player_1.x = destino_x;
        obj_player_1.y = destino_y;

        obj_player_2.x = destino_x;
        obj_player_2.y = destino_y;
    }
}

// Se a transição estiver completa, destrua o objeto
if (mudei && alpha <= 0) {
    instance_destroy();
}
if (mudei && room_goto(destino)) {
    instance_destroy();
}
