{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.fd
    pkgs.ripgrep
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      onedark-nvim
      lualine-nvim
      indent-blankline-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      neo-tree-nvim
      vim-endwise
      vim-matchup
      obsidian-nvim
      (nvim-treesitter.withPlugins(p: [
        p.astro
        p.awk
        p.bash
        p.c
        p.lua
        p.luadoc
        p.luap
        p.query
        p.vim
        p.vimdoc
        p.cpp
        p.css
        p.csv
        p.dockerfile
        p.elixir
        p.erlang
        p.git_config
        p.git_rebase
        p.gitattributes
        p.gitcommit
        p.gitignore
        p.go
        p.gpg
        p.graphql
        p.html
        p.http
        p.java
        p.javascript
        p.jq
        p.json
        p.json5
        p.kotlin
        p.make
        p.markdown
        p.markdown_inline
        p.nix
        p.passwd
        p.proto
        p.python
        p.ruby
        p.rust
        p.scss
        p.sql
        p.terraform
        p.toml
        p.typescript
        p.xml
        p.yaml
        p.yuck
      ]))
    ];
  };

  xdg.configFile = {
    "nvim/lua/core.lua".source = ./lua/core.lua;
    "nvim/lua/fold.lua".source = ./lua/fold.lua;
    "nvim/lua/indent.lua".source = ./lua/indent.lua;
    "nvim/lua/line.lua".source = ./lua/line.lua;
    "nvim/lua/mapping.lua".source = ./lua/mapping.lua;
    "nvim/lua/misc.lua".source = ./lua/misc.lua;
    "nvim/lua/modal.lua".source = ./lua/modal.lua;
    "nvim/lua/theme.lua".source = ./lua/theme.lua;
    "nvim/lua/tree-sitter.lua".source = ./lua/tree-sitter.lua;
    "nvim/lua/tree.lua".source = ./lua/tree.lua;
    "nvim/init.lua".source = ./lua/init.lua;
  };
}
