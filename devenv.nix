{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = [ pkgs.pkg-config pkgs.gtk4 pkgs.gtk4-layer-shell pkgs.blueprint-compiler pkgs.libadwaita pkgs.cava pkgs.libGL pkgs.libglvnd pkgs.gsettings-desktop-schemas ];

  # https://devenv.sh/languages/
  languages.dotnet.enable = true;
  languages.nix.enable = true;

  # https://devenv.sh/basics/
  # Is there a better way for this? Probably! Do I know it? Absolutely not :3
  enterShell = ''
    export LD_LIBRARY_PATH="${pkgs.gtk4}/lib:${pkgs.libadwaita}/lib:${pkgs.gtk4-layer-shell}/lib:${pkgs.libGL}/lib:$LD_LIBRARY_PATH"
    export XDG_DATA_DIRS="${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk4}/share/gsettings-schemas/${pkgs.gtk4.name}:$XDG_DATA_DIRS"
  '';
}
