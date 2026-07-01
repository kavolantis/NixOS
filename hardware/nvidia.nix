{ config,pkgs, ... }:

{

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    open = true;

    modesetting.enable = true;

    powerManagement.enable = true;

    dynamicBoost.enable = true;

    nvidiaSettings = true;

    prime = {
      offload.enable = true;
      #nix-shell -p pciutils --run 'lspci | grep -E "VGA|3D|Display"'
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
  };
}
