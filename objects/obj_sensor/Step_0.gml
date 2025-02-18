// Step Event
var player_1 = place_meeting(x, y, obj_player_1);
var player_2 = place_meeting(x, y, obj_player_2);
var _f = keyboard_check_released(ord("F"));

// Se for solo
if (global.solo) {
    if (tocar) {
        if ((player_1 || player_2) && !instance_exists(obj_transicao)) {
            var _tran = instance_create_layer(0, 0, layer, obj_transicao);
            _tran.destino = destino;
            _tran.destino_x = destino_x;
            _tran.destino_y = destino_y;
        }
    } else if (!tocar) {
        if ((player_1 || player_2) && _f && !instance_exists(obj_transicao)) {
            var _tran = instance_create_layer(0, 0, layer, obj_transicao);
            _tran.destino = destino;
            _tran.destino_x = destino_x;
            _tran.destino_y = destino_y;
        }
    }
}
// Se for multiplayer, ambos precisam estar dentro do sensor
else {
    if (tocar) {
        if (player_1 && player_2 && !instance_exists(obj_transicao)) {
            var _tran = instance_create_layer(0, 0, layer, obj_transicao);
            _tran.destino = destino;
            _tran.destino_x = destino_x;
            _tran.destino_y = destino_y;
        }
    } else if (!tocar) {
        if (player_1 && player_2 && _f && !instance_exists(obj_transicao)) {
            var _tran = instance_create_layer(0, 0, layer, obj_transicao);
            _tran.destino = destino;
            _tran.destino_x = destino_x;
            _tran.destino_y = destino_y;
        }
    }
}
