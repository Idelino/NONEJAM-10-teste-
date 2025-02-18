if(global.solo = false)
{
	draw_sprite(spr_moeda, 0, 32, 32);
	draw_set_font(ft_menu)
	
	draw_text(64, 42, global.moedas);
	
	draw_set_font(-1);
}