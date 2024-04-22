# catppuccin mocha sddm theme
{ pkgs }:

pkgs.stdenv.mkDerivation {
    name ="catppucin-mocha-sddm";

    src = pkgs.fetchurl {
        url = "https://github.com/catppuccin/sddm/releases/download/v1.0.0/catppuccin-mocha.zip";
        sha256 = "1699sfqv0znv6cfw3xgl13fhpiq1zpsbkh41drhym5sxd1wpmc8z";
    };

    dontUnpack = true;
    
    installPhase = ''
        mkdir -p /run/current-system/sw/share/sddm/themes/
        ${pkgs.unzip}/bin/unzip $src -d /run/current-system/sw/share/sddm/themes/
    '';
}
