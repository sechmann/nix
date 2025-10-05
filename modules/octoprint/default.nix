{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.octoprint;
in {
  options = {
    modules.octoprint.enabled = mkEnableOption "Enable OctoPrint module";
  };

  config = mkIf cfg.enabled {
    services.octoprint = {
      enable = true;
      openFirewall = true;
    };

    # users.users.octoprint = {
    #   isSystemUser = true;
    #   home = "/var/lib/octoprint";
    #   description = "OctoPrint User";
    #   createHome = true;
    #   group = "octoprint";
    # };
    #
    # users.groups.octoprint = {};
    #
    # systemd.tmpfiles.rules = [
    #   "d /var/lib/octoprint 0755 octoprint octoprint -"
    # ];
  };
}
