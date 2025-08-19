{
  name = "Sway Laptop";
  
  config = {
    launchCommand = "sway";
  
    sway = {
      brightness.enabled = true;
    };

    bar = {
      sound.enabled = true;
      brightness.enabled = true;
      battery.enabled = true;
    };
  };
}