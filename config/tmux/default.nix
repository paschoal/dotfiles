{  pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    clock24 = true;
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.sensible
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
        extraConfig = ''
          set -g @vim_navigator_mapping_left "C-h"
          set -g @vim_navigator_mapping_down "C-j"
          set -g @vim_navigator_mapping_up "C-k"
          set -g @vim_navigator_mapping_right "C-l"
        '';
      }
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-plugins "git ram-usage cpu-usage"
          set -g @dracula-show-empty-plugins false
          set -g @dracula-transparent-powerline-bg true
          set -g @dracula-show-left-icon "#h | #S"
          set -g @dracula-show-powerline true
          set -g @dracula-show-left-sep 
          set -g @dracula-show-right-sep 
        '';
      }
    ];
  };

  xdg.configFile."tmux/tmux.conf" = {
    text = ''
      #
      # control space as prefix
      #
      unbind C-b
      set -g prefix C-Space
      bind C-space send-prefix

      #
      # 24Bit colors for tmux
      #
      set -as terminal-features ",*:RGB"

      #
      # windows and panes starts on 1 instead of 0
      #
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      #
      # new splits follow the paths of previous
      #
      bind '"' split-window -v -c "#{pane_current_path}"
      bind '%' split-window -h -c "#{pane_current_path}"

      #
      # set status bar on top
      #
      set -g status-justify left
      set -g status-position top
    '';
  };
}
