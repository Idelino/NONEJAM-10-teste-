draw_set_font(ft_menu);

var _dist = 220;
var _gui_l = display_get_gui_width();
var _gui_a = display_get_gui_height();
var _x1 = _gui_l / 2;
var _y1 = _gui_a / 2;

// Posição do texto de créditos na parte inferior central
var _y_credits = _gui_a - 50;

for(var i = 0; i < op_max; i++){
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Desenhar o contorno para o primeiro texto (O JOGO FOI FEITO BASICAMENTE INTEIRO POR MIM)
    draw_set_color(c_black);  // Cor do contorno
    draw_text(_x1 - 1, _y1 - 128 - 1, "O JOGO FOI FEITO BASICAMENTE INTEIRO POR MIM");
    draw_text(_x1 + 1, _y1 - 128 - 1, "O JOGO FOI FEITO BASICAMENTE INTEIRO POR MIM");
    draw_text(_x1 - 1, _y1 - 128 + 1, "O JOGO FOI FEITO BASICAMENTE INTEIRO POR MIM");
    draw_text(_x1 + 1, _y1 - 128 + 1, "O JOGO FOI FEITO BASICAMENTE INTEIRO POR MIM");

    // Desenhar o texto principal
    draw_set_color(c_white);
    draw_text(_x1, _y1 - 128, "O JOGO FOI FEITO BASICAMENTE INTEIRO POR MIM");

    // Adicionar contorno para o segundo texto
    draw_set_color(c_black);  // Cor do contorno
    draw_text(_x1 - 1, _y1 - 112 - 1, "IDELINO");
    draw_text(_x1 + 1, _y1 - 112 - 1, "IDELINO");
    draw_text(_x1 - 1, _y1 - 112 + 1, "IDELINO");
    draw_text(_x1 + 1, _y1 - 112 + 1, "IDELINO");

    // Desenhar o texto principal
    draw_set_color(c_white);
    draw_text(_x1, _y1 - 112, "IDELINO");

    // Adicionar contorno para o terceiro texto
    draw_set_color(c_black);  // Cor do contorno
    draw_text(_x1 - 1, _y1 - 98 - 1, "SÓ NÃO FIZ EFEITOS SONOROS E MUSICAS, POR QUE NÃO SOU BOM NISSO...");
    draw_text(_x1 + 1, _y1 - 98 - 1, "SÓ NÃO FIZ EFEITOS SONOROS E MUSICAS, POR QUE NÃO SOU BOM NISSO...");
    draw_text(_x1 - 1, _y1 - 98 + 1, "SÓ NÃO FIZ EFEITOS SONOROS E MUSICAS, POR QUE NÃO SOU BOM NISSO...");
    draw_text(_x1 + 1, _y1 - 98 + 1, "SÓ NÃO FIZ EFEITOS SONOROS E MUSICAS, POR QUE NÃO SOU BOM NISSO...");

    // Desenhar o texto principal
    draw_set_color(c_white);
    draw_text(_x1, _y1 - 98, "SÓ NÃO FIZ EFEITOS SONOROS E MUSICAS, POR QUE NÃO SOU BOM NISSO...");

    // Adicionar contorno para o quarto texto
    draw_set_color(c_black);  // Cor do contorno
    draw_text(_x1 - 1, _y1 - 80 - 1, "CRÉDITOS AS MUSICAS E EFEITOS SONOROS NA DESCRIÇÃO DO ITCH.IO!");
    draw_text(_x1 + 1, _y1 - 80 - 1, "CRÉDITOS AS MUSICAS E EFEITOS SONOROS NA DESCRIÇÃO DO ITCH.IO!");
    draw_text(_x1 - 1, _y1 - 80 + 1, "CRÉDITOS AS MUSICAS E EFEITOS SONOROS NA DESCRIÇÃO DO ITCH.IO!");
    draw_text(_x1 + 1, _y1 - 80 + 1, "CRÉDITOS AS MUSICAS E EFEITOS SONOROS NA DESCRIÇÃO DO ITCH.IO!");

    // Desenhar o texto principal
    draw_set_color(c_white);
    draw_text(_x1, _y1 - 80, "CRÉDITOS AS MUSICAS E EFEITOS SONOROS NA DESCRIÇÃO DO ITCH.IO!");

    // Desenhar as opções com contorno
    draw_set_color(c_black);  // Cor do contorno
    draw_text(_x1 - 1, _y1 + (_dist * i) - 1, opcoes[i]);  // Deslocamento para o contorno
    draw_text(_x1 + 1, _y1 + (_dist * i) - 1, opcoes[i]);
    draw_text(_x1 - 1, _y1 + (_dist * i) + 1, opcoes[i]);
    draw_text(_x1 + 1, _y1 + (_dist * i) + 1, opcoes[i]);

    // Desenhar o texto das opções principais
    if(index == i)
    {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);    
    }
    draw_text(_x1, _y1 + (_dist * i), opcoes[i]);
}

// Desenhar os créditos na parte inferior central
draw_set_color(c_black);  // Cor do contorno
draw_text(_x1 - 1, _y_credits - 1, "FEITO POR IDELINO");
draw_text(_x1 + 1, _y_credits - 1, "FEITO POR IDELINO");
draw_text(_x1 - 1, _y_credits + 1, "FEITO POR IDELINO");
draw_text(_x1 + 1, _y_credits + 1, "FEITO POR IDELINO");

draw_set_color(c_white);
draw_text(_x1, _y_credits, "FEITO POR IDELINO");

draw_set_font(-1);
