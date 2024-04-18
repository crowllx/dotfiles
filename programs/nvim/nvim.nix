{ pkgs, lib, config, inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  options = {
    modules.nixvim.enable = lib.mkEnableOption "enables nvim";
  };
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
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
	};
      };
    };
  };
}
