{ pkgs, ... }:

{
  ##################################################
  ## KDE Plasma 6
  ##################################################

  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "hu";
    variant = "";
  };

  services.displayManager.sddm.enable = true;

  services.desktopManager.plasma6.enable = true;

  ##################################################
  ## XDG Portal
  ##################################################

  xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };
}