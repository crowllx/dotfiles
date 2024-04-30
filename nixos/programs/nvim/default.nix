{ pkgs, lib, config, inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  options = {
    modules.nixvim.enable = lib.mkEnableOption "enables nvim";
  };

  config = lib.mkIf config.modules.nixvim.enable {
          
    # add lua modules
    home.file.".config/nvim/plugin" = { source = ./plugin; recursive = true; };

    # neovim settings
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraPackages = with pkgs; [
        lua-language-server
        nodePackages.typescript-language-server
        nodePackages.bash-language-server
        rust-analyzer
        nil
      ]; 
      extraPlugins = with pkgs.vimPlugins; [
        vimwiki
        lsp-zero-nvim
        nvim-lspconfig
        cmp-nvim-lsp
        cmp-nvim-lua
        nvim-cmp
        cmp-path
        cmp-buffer
        cmp_luasnip
        luasnip
        friendly-snippets
      ];
      # add required plugins
      plugins = {
        treesitter.enable = true;
	    comment.enable = true;
	    nvim-autopairs.enable = true;
        telescope.enable = true;
	    fugitive.enable = true;
	    trouble.enable = true;
        nvim-tree.enable = true;
	    zen-mode.enable = true;
      };

      # load additional config
      extraConfigLua = ''${builtins.readFile ./options.lua}'';
      colorschemes.rose-pine.enable = true;
    };
  };
}
