{
  name = "Sway Laptop";
  
  config = {
    launchCommand = "sway";
  
    sway = {
      volume.enabled = true;
      brightness.enabled = true;

      cursor = {
        enabled = true;
        
        themeName = "Bibata-Modern-Ice";
        size = 22;
      };
    };

    bar = {
      sound.enabled = true;
      brightness.enabled = true;
      battery.enabled = true;
    };
  };
}