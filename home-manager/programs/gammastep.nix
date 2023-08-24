{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 51.5;
    longitude = -0.1;
    # Set the time interval of dawn manually. The times must be specified as HH:MM in 24-hour format.
    #dawnTime = "6:00-7:45";
    # Set the time interval of dusk manually. The times must be specified as HH:MM in 24-hour format.
    # duskTime = "18:35-20:15";
    temperature = {
    # bw 1000-25000K
      day = 6500; 
      night = 3700; 
    };
    tray = true;
  };
}
