state("PROA34-Win64-Shipping")
{
	float TotalCentiseconds : 0x42C4E20, 0x30, 0xE8, 0x258, 0x10B8, 0x260;
	//the timer, starts at milliseconds, stored as 4byte and is slightly off displayed timer

	int StartFlag : 0x42fbb90, 0x408, 0xc8;
	// Stays 0 on the main menu, changes to 1 upon selecting difficulty
	// Also does some other stuff. Don't really know what though lol

	int MainMenuState : 0x411DB30, 0xf0, 0xc8, 0x270, 0x2b8;
	// 0 = Title,    1 = File Select, 2 = Graphics Options, 3 = Settings,  4 = Game Settings,
	// 5 = Controls, 6 = Delete File, 7 = ???,              8 = File Name, 9 = Difficulty
}

startup
{
vars.menuTime = 0;
}

start
{
	if (old.TotalCentiseconds == 0 && current.MainMenuState == 9
			&& old.StartFlag == 0 && current.StartFlag == 1) {
		return true;
	}
}

gameTime
{
if (current.TotalCentiseconds != 0) {
	print("a" + current.TotalCentiseconds);
	return TimeSpan.FromSeconds(current.TotalCentiseconds / 100f);
	}
else if (old.TotalCentiseconds == 0 ) {
	print("c" + vars.menuTime);
	return TimeSpan.FromSeconds(vars.menuTime / 100f);
	}
else if (current.TotalCentiseconds == 0 ) {
	print("b" + old.TotalCentiseconds);
	vars.menuTime = old.TotalCentiseconds;
	return TimeSpan.FromSeconds(vars.menuTime / 100f);
} else { 
	print ("d" + current.TotalCentiseconds);
	return TimeSpan.FromSeconds(current.TotalCentiseconds / 100f); 
	//if something goes wrong
	}
}

isLoading
{
	return true;
}
