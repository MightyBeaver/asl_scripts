state("Matrix") {
    int inSaveConfirmation : "Matrix.exe", 0x57ECDC;
    int gameState: "FileParser.dll", 0x138A0;
}
init{
	vars.missionCounter = 0;
	vars.splitTarget = new int[] {9,1,1,7,8,8,3,8,1,3}; //number of missions in split 
	vars.split = false;									//size of 10 to prevent index out of bounds
	vars.index = 0;
}  
update{
	vars.split = false; 
	//counting missions in a split1
	if (old.inSaveConfirmation == 0 && current.inSaveConfirmation == 1)
		{vars.missionCounter++;}
	//a bit late final split after skipping first final cutscene. In case runner forgot to split.
	if (old.gameState != 1872 && current.gameState == 1872) 
		{vars.split = true;}
	//splitting if it's save confirmation before first mission in next level
	if (vars.missionCounter == vars.splitTarget[vars.index])
		{vars.split = true; vars.index++;vars.missionCounter = 0;}
}
start {
	vars.missionCounter = 0;
	vars.index = 0;
    return (old.gameState == 300) && (current.gameState == 87);
}
split {
    return vars.split;
}