tempo_morre-=5;
screenshake(5);

if(tempo_morre <= 0)
{
	vida_atual = 0;
	tempo_morre = 10;
}