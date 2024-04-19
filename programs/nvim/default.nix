{ pkgs, lib, config, inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  options = {
    modules.nixvim.enable = lib.mkEnableOption "enables nvim";
  };
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      enableMan = true;
      viAlias = true;
      vimAlias = true;
      enable = true;
      clipboard = {
	register = "unnamedplus";
      };
      colorschemes.rose-pine.enable = true;
      plugins.treesitter.enable = true;
      plugins.lsp = {
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
      plugins.cmp = {
	enable = true;
	autoEnableSources = true;
      };
    };
  };
}
