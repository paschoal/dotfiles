{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    (st.overrideAttrs (
      _: rec {
        configFile = writeText "config.def.h" (builtins.readFile ./config/config.source.h);
        patches = [
          ./patches/appearance-0.9.2.diff
          ./patches/st-dracula-0.8.5.diff
          ./patches/st-scrollback-ringbuffer-0.9.2.diff
          ./patches/st-scrollback-mouse-0.9.2.diff
        ];
      }
    ))
  ];
}
