{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.laptop-server;
in {
  options = {
    modules.laptop-server.enabled = mkEnableOption "Enable laptop-server module";
  };

  config = mkIf cfg.enabled {
    services.logind = {
      lidSwitch = "ignore";
      lidSwitchDocked = "ignore";
      lidSwitchExternalPower = "ignore";
      extraConfig = ''
        IdleAction=ignore
        HandlePowerKey=ignore
        HandleSuspendKey=ignore
      '';
    };
    systemd.sleep.extraConfig = ''
      AllowSuspend=no
      AllowHibernation=no
      AllowHybridSleep=no
      AllowSuspendThenHibernate=no
    '';
  };
}
