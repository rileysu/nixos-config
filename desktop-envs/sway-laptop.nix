{
  name = "Sway Laptop";
  
  config = {
    launchCommand = "sway";
  
    sway = {
      volume.enabled = true;
      brightness.enabled = true;
    };

    bar = {
      sound.enabled = true;
      brightness.enabled = true;
      battery.enabled = true;
    };
  };
}