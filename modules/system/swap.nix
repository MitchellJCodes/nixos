{ ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 25;
    algorithm = "zstd";
    priority = 100;
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 4096;
      priority = 10;
    }
  ];
}
