// Sistema de colisão e movimentação
var _velh = sign(velh);
var _velv = sign(velv);

// Tiles de colisão
var _colisao = layer_tilemap_get_id("tl_colisao");
var _colisao_p1 = layer_tilemap_get_id("tl_colisao_player_1");
var _colisao_p2 = layer_tilemap_get_id("tl_colisao_player_2");

// Definir colisão de acordo com o jogador
var _colisao_extra;
if (object_index == obj_player_1) 
{
    _colisao_extra = _colisao_p1;
} else if (object_index == obj_player_2) {
    _colisao_extra = _colisao_p2;
} else {
    _colisao_extra = noone;
}

// Horizontal
repeat(abs(velh))
{
    if (place_meeting(x + _velh, y, _colisao)
	||  place_meeting(x + _velh, y, _colisao_extra)
	|| place_meeting(x + _velh, y, obj_block)
	|| place_meeting(x + _velh, y, obj_botao)
	) 
	{
        velh = 0;
        break;
    }
    x += _velh;
}

// Vertical
repeat(abs(velv)) 
{
    if (place_meeting(x, y + _velv, _colisao)
	|| place_meeting(x, y + _velv, _colisao_extra) 
	|| place_meeting(x, y + _velv, obj_block) 
	|| place_meeting(x, y + _velv, obj_botao)
	)
	{
        velv = 0;
        break;
    }
    y += _velv;
}

//Sabendo se eu estou no chão
if(velv >= 0 && place_meeting(x, y+1, _colisao) || place_meeting(x, y + _velv, _colisao_extra) || place_meeting(x, y + _velv, obj_block))
{
	on_ground = true;
} else {
	on_ground = false;
}