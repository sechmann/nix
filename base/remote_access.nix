{...}: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKUFV67ZGk8kIdPvho4IBF4fLMemDNVPbhNlnaVcatIP"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPw8RDATFPx9rcMqtT7h3tDCPYOyz0fnN5OLQ+3KJxe3"
  ];
}
