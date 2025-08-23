{
  name = "Sway Desktop";
  
  config = {
    launchCommand = "sway";

    sway = {
      brightness.enabled = false;

      cursor = {
        enabled = true;
        
        themeName = "Bibata-Modern-Ice";
        size = 22;
      };
    };

    bar = {
      sound.enabled = true;
      brightness.enabled = false;
      battery.enabled = false;
    };
  };
}