{ pkgs, lib, config, inputs }: {
    options ={ modules.zsh.enable = lib.mkEnableOption "enables zsh"; };
    config = lib.mkIf config.modules.zsh.enable {
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            autosuggestion.highlight = true;
            dotDir = ".config/zsh";
            oh-my-zsh = {
                enable = true;
                plugins = [ "git" "git-prompt" "git-extras" "aliases" ]; 
            };
            syntaxHighlighting.enable = true;
            initExtra = ''
                ${builtins.readFile ./zsh-theme }
                ${builtins.readFile ./.zshrc }
            '';
        };
        
    };
}
