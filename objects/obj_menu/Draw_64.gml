draw_set_font(ft_menu);

var _dist = 55;
var _gui_l = display_get_gui_width();
var _gui_a = display_get_gui_height();
var _x1 = _gui_l / 6;
var _y1 = _gui_a / 2;
var _x2 = _gui_l - 600;  // Posicionar o texto das setas para a direita
var _y2 = _gui_a - 50;   // Posicionar o texto das setas mais para baixo

// Desenhar o contorno e o texto para as instruções das setas
draw_set_color(c_black);
draw_text(_x2 - 1, _y2 - 1, "USE AS SETAS PARA SE LOCOMOVER NOS MENUS");
draw_text(_x2 + 1, _y2 - 1, "USE AS SETAS PARA SE LOCOMOVER NOS MENUS");
draw_text(_x2 - 1, _y2 + 1, "USE AS SETAS PARA SE LOCOMOVER NOS MENUS");
draw_text(_x2 + 1, _y2 + 1, "USE AS SETAS PARA SE LOCOMOVER NOS MENUS");

draw_set_color(c_white);
draw_text(_x2, _y2, "USE AS SETAS PARA SE LOCOMOVER NOS MENUS");

// Desenhar o contorno e o texto para "USE ENTER PARA SELECIONAR"
draw_set_color(c_black);
draw_text(_x2 - 1, _y2 + 12 - 1, "USE ENTER PARA SELECIONAR");
draw_text(_x2 + 1, _y2 + 12 - 1, "USE ENTER PARA SELECIONAR");
draw_text(_x2 - 1, _y2 + 12 + 1, "USE ENTER PARA SELECIONAR");
draw_text(_x2 + 1, _y2 + 12 + 1, "USE ENTER PARA SELECIONAR");

draw_set_color(-1);
draw_text(_x2, _y2 + 12, "USE ENTER PARA SELECIONAR");

// Desenhar as opções na parte inferior esquerda
for(var i = 0; i < op_max; i++){
    // Desenhar o contorno
    draw_set_color(c_black);  // Cor do contorno
    draw_text(_x1 - 1, _y1 + (_dist * i) - 1, opcoes[i]);  // Deslocamento para o contorno
    draw_text(_x1 + 1, _y1 + (_dist * i) - 1, opcoes[i]);
    draw_text(_x1 - 1, _y1 + (_dist * i) + 1, opcoes[i]);
    draw_text(_x1 + 1, _y1 + (_dist * i) + 1, opcoes[i]);

    // Desenhar o texto principal
    if(index == i)
    {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);    
    }
    draw_text(_x1, _y1 + (_dist * i), opcoes[i]);
}

draw_set_font(-1);
