{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local   all all trust
      host    all all 0.0.0.0/0  trust
    '';
  };

  environment.systemPackages = with pkgs; [
    postgresql.pg_config
  ];
}
