with(obj_entidade)
{
	if(place_meeting(x, y+1, obj_botao))
	{
		other.image_index = 1;
		other.destroi_parede = true;
	}
}

if(destroi_parede = true)
{
	with(obj_parede_espinhos)
	{
		estado = "destroi";
		screenshake(5);
	}
}