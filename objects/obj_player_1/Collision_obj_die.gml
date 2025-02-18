tempo_morre--;


if(tempo_morre <= 0)
{
	vida_atual = 0;
	screenshake(5);
	tempo_morre = 10;
}