{...}: let
  files = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
in {
  imports = map (f: ./${f}) files;
}
