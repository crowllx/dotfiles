{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../programs/nvim
    ../../programs/zsh
  ];

  # custom modules
  modules.nixvim.enable = true;
  modules.zsh.enable = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "crowll";
  home.homeDirectory = "/home/crowll";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [ 
     wget
     alacritty
     wofi
     mako
     networkmanagerapplet
     btop
     pavucontrol
     jq
     tree
     gopass
     tmux
     gnupg
     waybar
     libnotify
     pciutils
     glxinfo
     amdgpu_top
     discord
     neofetch
     texliveSmall
     libreoffice
     (nerdfonts.override { fonts = [ "FiraMono" ];})
  ];
    
  xdg= {
     enable = true;
      mimeApps = {
          enable = true;
          defaultApplications = {
              "application/pdf" = ["firefox.desktop"];
          };
      };
  };
  programs.direnv ={
    enable = true;
    nix-direnv.enable = true;
  };
  programs.pandoc.enable = true;
  programs.git = {
      enable = true;
      userName = "wshine";
      userEmail = "114693487+WinstonShine@users.noreply.github.com";
      ignores = [
        "shell.nix"
        ".envrc"
        ".direnv/"
      ];
  };
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
  # services
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
  # PROGRAMS
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
