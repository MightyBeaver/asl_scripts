state("IMM")
{
	int gamestate: "IMM.exe", 0x26F040;
	int loading: "IMM.exe", 0x24FB38; 
}

start
{
	return current.gamestate == 8 && old.gamestate == 17;
}

isLoading
{
	return current.loading == 1;
}

split
{
	return current.gamestate == 8 && old.gamestate != 8;
}

reset
{
	return current.gamestate == 8 && old.gamestate == 17;
}
