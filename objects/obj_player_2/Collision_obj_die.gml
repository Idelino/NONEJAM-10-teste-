tempo_morre--;


if(tempo_morre <= 0)
{
	screenshake(5);
	vida_atual = 0;
	tempo_morre = 10;
}