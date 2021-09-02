state("PROA34-Win64-Shipping")
{
	float TotalCentiseconds : 0x03D8C5E0, 0x8, 0x28, 0x8, 0x3E8, 0x110, 0x18, 0xFA4, 0x230, 0x22C;
}

startup
{
vars.menuTime = 0;
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
	}
}

isLoading
{
	return true;
}