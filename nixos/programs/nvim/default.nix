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
      clipboard.register = "unnamedplus";
      
      extraPlugins = [ pkgs.vimPlugins.vimwiki ];
      # add required plugins
      plugins = {
        treesitter.enable = true;
        lsp = {
          onAttach = ''
            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

            vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
            vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
            vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
          '';
          enable = true;
          servers = {
            clangd.enable = true;
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
