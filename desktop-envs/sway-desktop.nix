{
  name = "Sway Desktop";
  
  config = {
    launchCommand = "sway";

    sway = {
      brightness.enabled = false;
    };

    bar = {
      sound.enabled = true;
      brightness.enabled = false;
      battery.enabled = false;
    };
  };
}