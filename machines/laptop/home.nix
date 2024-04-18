{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "crowll";
  home.homeDirectory = "/home/crowll";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [ 
     wget
     bspwm
     alacritty
     git
     rofi
     picom
     eww
     dunst
     gcc
     firefox
     btop
     pavucontrol
     imagemagick
     jq
     polybar
     rustup
     xclip
     sxhkd
     tree
     gopass
     tmux
     gnupg
     (nerdfonts.override { fonts = [ "FiraMono" ];})
  ];
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
    EDITOR = "nvim";
  };
  # services
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
  # PROGRAMS
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    initExtra = ''
      source $HOME/tools/dotfiles/.zshrc
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "git-prompt"
      ];
    };
  };
  programs.neovim =
  let 
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      xclip
      rust-analyzer
      nodePackages_latest.pyright
    ];

    # plugins
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ../nvim/plugin/lsp.lua;
      }
      nvim-web-devicons
      {
        plugin = nvim-tree-lua;
        config = toLuaFile ../nvim/plugin/nvim-tree.lua;

      }
      nui-nvim
      rose-pine
      {
        plugin = rose-pine;
        config = toLuaFile ../nvim/plugin/rose-pine.lua;
      }
      vim-fugitive
      vim-nix
      trouble-nvim
      {
        plugin = telescope-nvim;
        config = toLuaFile ../nvim/plugin/telescope.lua;
      }

      # cmp & dependencies
      {
        plugin = nvim-cmp;
        config = toLuaFile ../nvim/plugin/cmp.lua;
      } 
      cmp-nvim-lua
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      friendly-snippets
      nvim-autopairs

      zen-mode-nvim
      {
        plugin = zen-mode-nvim;
        config = toLuaFile ../nvim/plugin/zen.lua;
      }
      vimwiki
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-rust
          p.tree-sitter-go
        ]));
        config = toLuaFile ../nvim/plugin/treesitter.lua;
      }
    ];

    extraLuaConfig = ''
      ${builtins.readFile ../nvim/init.lua}
      ${builtins.readFile ../nvim/set.lua}
      ${builtins.readFile ../nvim/remap.lua}
    '';
  };
}
