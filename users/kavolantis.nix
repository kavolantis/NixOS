{ pkgs, ... }:

{
  users.users.kavolantis = {
    isNormalUser = true;
    description = "Kävolantis Cven";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    packages = with pkgs; [
      discord
      goverlay
      kdePackages.kate
      lutris
      mangohud
      mc
      prismlauncher
      proton-authenticator
      proton-pass
      protonplus
      spotify
      steam
      vivaldi
      vivaldi-ffmpeg-codecs
      vscode
      winbox
      # xivlauncher
    ];
  };
}