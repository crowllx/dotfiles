{ pkgs, lib, config, inputs }: {
    options = modules.zsh.enable = lib.mkEnableOption "enables zsh"
}
