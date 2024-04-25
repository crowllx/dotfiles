{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../programs/nvim
  ];

  # custom modules
  modules.nixvim.enable = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "crowll";
  home.homeDirectory = "/home/crowll";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.gnome3.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };
  gtk = {
      enable = true;
      theme = {
        package = pkgs.flat-remix-gtk;
        name = "Flat-Remix-GTK-Grey-Darkest";
      };
      iconTheme = {
        package = pkgs.gnome.adwaita-icon-theme;
        name = "Adwaita";
      };

      font = {
        name = "Sans";
        size = 11;
      };
  };
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
     wl-clipboard
     python311
     ripgrep
     (nerdfonts.override { fonts = [ "FiraMono" ];})
  ];
  # bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      source <(gopass completion bash)
      alias tmux='tmux -2'
      export DIRENV_LOG_FORMAT=
      source "/run/current-system/sw/share/bash-completion/completions/git-prompt.sh"
    '';
  };
  # virtualization
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # dir env
  programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
      config = {
          global.hide_env_diff = true;
      };
  };

  xdg= {
     enable = true;
      mimeApps = {
          enable = true;
          defaultApplications = {
              "application/pdf" = ["firefox.desktop"];
          };
      };
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
