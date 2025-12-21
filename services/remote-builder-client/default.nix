{ ... }:
{
  nix = {
    distributedBuilds = true;
    settings.builders-use-substitutes = true;
    buildMachines = [
      {
        hostName = "bree";
        system = "aarch64-linux";
        protocol = "ssh-ng";
        sshUser = "nix-builder";
        maxJobs = 2;
        speedFactor = 5;
        supportedFeatures = [ "big-parallel" ];
      }
    ];
  };
}
