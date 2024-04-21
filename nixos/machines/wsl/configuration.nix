# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    inputs.home-manager.nixosModules.default
  ];
  
  # WSL settings
  wsl.enable = true;
  wsl.defaultUser = "crowll";
  wsl.useWindowsDriver = true;
  
  # nix-ld, run unpackaged programs
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # add missing dynamic libraries for unpackages programs
    # specifically here and not in environment.systemPackages
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  
  # home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs pkgs; };
    users = {
      "crowll" = import ./home.nix;
    };
  };

  # docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
  };

  programs.zsh.enable = true;
  users.users."crowll".shell = pkgs.zsh;

  # packages/programs
  environment.systemPackages = with pkgs; [
    wget
    git
    vim
  ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
}
