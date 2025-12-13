{ pkgs, ... }:
{
  #
  # solving treesitter error for missing cc bin.
  #
  home.packages = with pkgs; [ gcc ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter-endwise

      {
        plugin = nvim-treesitter.withPlugins(p: [
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
          p.gotmpl
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
          p.rbs
          p.rust
          p.scss
          p.sql
          p.terraform
          p.toml
          p.typescript
          p.xml
          p.yaml
          p.yuck
        ]);
        type = "lua";
        config = builtins.readFile ./config.lua;
      }
      nvim-treesitter-endwise
    ];
  };
}
