{ pkgs, lib, config, inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  options = {
    modules.nixvim.enable = lib.mkEnableOption "enables nvim";
  };

  config = lib.mkIf config.modules.nixvim.enable {
  
    # add lua modules
    home.file.".config/nvim/plugin" = { source = ./plugin; recursive = true; };
    programs.nixvim = {
      enable = true;
      enableMan = true;
      viAlias = true;
      vimAlias = true;
      clipboard.register = "unnamedplus";
      extraPlugins = [ pkgs.vimPlugins.nvim-lspconfig ];
      plugins = {
        treesitter.enable = true;
        lsp = {
          enable = true;
          servers = {
            nil_ls.enable = true;
            lua-ls = {
              enable =true;
              settings.telemetry.enable = false;
            };
            rust-analyzer = {
              enable = true;
              installCargo = true;
              installRustc = true;
            };
          };
        };
        cmp = {
          enable = true;
          autoEnableSources = true;
        };
	cmp-nvim-lsp.enable = true;
	cmp-nvim-lua.enable = true;
	luasnip.enable = true;
	cmp_luasnip.enable = true;
	cmp-path.enable = true;
	cmp-omni.enable = true;
	cmp-pandoc-nvim.enable =true;
	cmp-treesitter.enable = true;
	cmp-buffer.enable = true;
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
