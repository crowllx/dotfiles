{ pkgs, lib, config, inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  options = {
    modules.nixvim.enable = lib.mkEnableOption "enables nvim";
  };
  config = lib.mkIf config.modules.nixvim.enable {
    programs.nixvim = {
      enable = true;
    };
  };
}
