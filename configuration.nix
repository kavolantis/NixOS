{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

  ./desktop/kde.nix

  ./hardware/audio.nix
  ./hardware/bluetooth.nix
  ./hardware/nvidia.nix

  ./programs/direnv.nix
  ./programs/localsend.nix
  ./programs/nix-ld.nix
  ./programs/steam.nix

  ./services/flatpak.nix
  ./services/fwupd.nix
  ./services/netdata.nix
  ./services/printing.nix

  ./users/kavolantis.nix
  ];

  ##################################################
  ## Boot
  ##################################################

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  ##################################################
  ## Nix
  ##################################################

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  ##################################################
  ## Networking
  ##################################################

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  ##################################################
  ## Locale
  ##################################################

  time.timeZone = "Europe/Budapest";

  i18n.defaultLocale = "hu_HU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "hu_HU.UTF-8";
  };

  console.keyMap = "hu";


  ##################################################
  ## System Packages
  ##################################################

  environment.systemPackages = with pkgs; [
    fastfetch
    git
    mesa-demos
    pciutils
    vulkan-tools
    wget
    tree
    wl-clipboard
  ];

  ##################################################
  ## System
  ##################################################

  system.stateVersion = "26.05";
}
